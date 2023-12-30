do {
    # Cabeçalho com um aqui-string
    Write-Host -ForegroundColor green @'

 ▄▄▄        ██████   ██████  ██▓  ██████ ▄▄▄█████▓ ▄▄▄       ███▄    █ ▄▄▄█████▓   ▄▄▄█████▓      ██▓
▒████▄    ▒██    ▒ ▒██    ▒ ▓██▒▒██    ▒ ▓  ██▒ ▓▒▒████▄     ██ ▀█   █ ▓  ██▒ ▓▒   ▓  ██▒ ▓▒     ▓██▒
▒██  ▀█▄  ░ ▓██▄   ░ ▓██▄   ▒██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▓██  ▀█ ██▒▒ ▓██░ ▒░   ▒ ▓██░ ▒░     ▒██▒
░██▄▄▄▄██   ▒   ██▒  ▒   ██▒░██░  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░ ▓██▓ ░    ░ ▓██▓ ░      ░██░
 ▓█   ▓██▒▒██████▒▒▒██████▒▒░██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒▒██░   ▓██░  ▒██▒ ░      ▒██▒ ░  ██▓ ░██░
 ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░░▓  ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░   ▒ ▒   ▒ ░░        ▒ ░░    ▒▓▒ ░▓  
  ▒   ▒▒ ░░ ░▒  ░ ░░ ░▒  ░ ░ ▒ ░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░░   ░ ▒░    ░           ░     ░▒   ▒ ░
  ░   ▒   ░  ░  ░  ░  ░  ░   ▒ ░░  ░  ░    ░        ░   ▒      ░   ░ ░   ░           ░       ░    ▒ ░
      ░  ░      ░        ░   ░        ░                 ░  ░         ░                        ░   ░  
                                                                                              ░      
'@
    # Exibe as opções para o usuário
    Write-Host "Escolha uma opção:"
    Write-Host "1. EXEMPLO" -ForegroundColor red
    Write-Host "2. EXEMPLO" -ForegroundColor red
    Write-Host "Digite 'q' para sair."

    # Solicita ao usuário que insira um número
    $numero = Read-Host "Digite um número"

    # Verifica se o valor inserido é um número
    if ($numero -as [int]) {
        # Converte o número para inteiro
        $numero = [int]$numero

        # Executa a ação com base no número
        switch ($numero) {
            1 {
                Write-Host "Você escolheu a opção 1. Ação 1 será executada."
                start-Sleep -Seconds 2
                cls

                $começo = read-host "Você ira executar os comandos em qual HostName?"

                try {
                    $result = Invoke-Command -ComputerName $comeco -ScriptBlock {

                        # Obtém informações sobre o processador do sistema
                        $processador = Get-CimInstance -ClassName Win32_Processor

                        if ($processador) {# Exibe informações sobre o processador
                        Write-Host "Nome do Processador: $($processador.Name)"
                        Write-Host "Arquitetura: $($processador.Architecture)"
                        Write-Host "Número de Núcleos: $($processador.NumberOfCores)"
                        Write-Host "Número de Threads: $($processador.NumberOfLogicalProcessors)"
                        Write-Host "Velocidade do Clock: $($processador.MaxClockSpeed) MHz"
                    } else {
                        Write-Host "Nenhuma porta aberta encontrada no Host $env:COMPUTERNAME."}
                   }
                    Write-Host $result

                } catch {
                    Write-Host "Erro ao conectar-se ao host $comeco. Verifique o nome do host e a conectividade."
                } finally {
                    pause
                    cls
                #break
            }
            }
             2 {
            Write-Host "Você escolheu a opção 2. Ação 2 será executada."
            Start-Sleep -Seconds 2
            cls

            $comeco = Read-Host "Você irá executar os comandos em qual HostName?"

            try {
                $result = Invoke-Command -ComputerName $comeco -ScriptBlock {
                    # Obtém informações sobre a memória física do sistema
                    $memoria = Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum

                    # Converte a capacidade total para gigabytes
                    $memoriaTotalGB = [math]::Round($memoria.Sum / 1GB, 2)

                    "Memória RAM Total: $memoriaTotalGB GB"
                }

                Write-Host $result

            } catch {
                Write-Host "Erro ao conectar-se ao host $comeco. Verifique o nome do host e a conectividade."
            } finally {
                Pause
                Clear-Host
            }
        } 
        default {
                Write-Host "Opção não reconhecida. Tente novamente."
            }
        }
    } elseif ($opcao -eq 'q') {
        Write-Host "Você escolheu sair. Adeus!"
        exit
        #break
    } else {
        Write-Host "Por favor, insira um número válido. Tente novamente."
        cls
    }
} while ($true)  # Loop infinito, só sairá quando uma opção válida ou 'q' for escolhida

