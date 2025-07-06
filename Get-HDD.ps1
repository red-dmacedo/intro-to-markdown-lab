param(
    [ValidateSet("cmd","table")][string]$format = "cmd"
);
function Get-CustomHDDObject{
    param($Win32_LogicalDisk)
    $result=[pscustomobject]@{
        Drive=$Win32_LogicalDisk.DeviceID
        'Free(GB)'="$([Math]::Round(($Win32_LogicalDisk.FreeSpace / 1GB),1)) GB"
        'Size(GB)'="$([Math]::Round(($Win32_LogicalDisk.Size / 1GB),1)) GB"
        'Free(%)'="$([Math]::Round(($Win32_LogicalDisk.Freespace * 100/$Win32_LogicalDisk.Size),1))%"
        DriveType=Switch ($Win32_LogicalDisk.DriveType)
        {
            2 {"2 (SD/USB)"}
            3 {"3 (HDD)"}
            4 {"4 (SSD)"}
        }
    }
    return $result
}
function Get-HardDriveSize{
    param($Win32_LogicalDisk)
    if (($Win32_LogicalDisk -is [array]) -or ($Win32_LogicalDisk -is [System.Collections.ArrayList])){
        [System.Collections.ArrayList]$result=@()
        $Win32_LogicalDisk.foreach{
            $result+=Get-CustomHDDObject -Win32_LogicalDisk $_
        }
    }else{$result=Get-CustomHDDObject -Win32_LogicalDisk $Win32_LogicalDisk}
    return $result
}
$obj=Get-CimInstance -ClassName Win32_LogicalDisk #-Filter "DriveType=3"

switch($format){
    'cmd' {
        Get-HardDriveSize -Win32_LogicalDisk $obj | Format-Table | Out-host
        break;
    };
    'table' {
        Get-HardDriveSize -Win32_LogicalDisk $obj | Out-GridView
        break;
    };
};
