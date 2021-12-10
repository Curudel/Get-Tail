function Get-Tail{
    [CmdletBinding()]
    param(
        [Parameter()][string]$Function,
        [Parameter()][string]$File
    )
    If($Function -eq "Stream"){
        write-host "Press CTRL-C to break out" -ForegroundColor Yellow
        $Check = Get-Content -Path $File -Tail 1
        DO
            {
            If($status -eq "1"){
                Write-Host $Check
                $status = "2"
                Write-Host $status
            }
            $check2 = Get-Content -Path $File -Tail 1
            If("$check1" -ne "$check2"){
                Write-Host $check2
                $check1 = $check2
            }
        } While ($LoopDeLoop -le 5)
    }
    If($Function -eq "Static"){
        $Rows = Read-Host -Prompt "How many rows?"
        Get-Content -Path $File -Tail $Rows
    }
} 