            $IN = Read-Host "Você irá executar os comandos em qual HostName?"

            try {
                Invoke-Command -ComputerName $IN -ScriptBlock {
                # Verifica as portas abertas
                $portasAbertas = Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' }

                    if ($portasAbertas) {
                    Write-Host "Portas Abertas no Host $env:COMPUTERNAME:"
                    $portasAbertas | Format-Table -AutoSize
                        } else {Write-Host "Nenhuma porta aberta encontrada no Host $env:COMPUTERNAME."}
    }

                    Write-Host $result

                    } catch { Write-Host "Erro ao conectar-se ao host $IN. Verifique o nome do host e a conectividade."} 

                Pause
                Clear-Host
            }
