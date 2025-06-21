@echo off 

rem =============================
rem 🟢 Boas-vindas e verificação
rem ============================= 

echo Boas vindas ao portal do aluno! 
timeout /t 2 /nobreak >nul
cls
echo Para sua seguranca, vamos verificar que você não é um robo
timeout /t 3 /nobreak >nul

:verificacao
set code=akw458a

color A
echo Verifique que voce nao é um robo, digite o código %code%
set /p entrada="Digite o código de verificação: "

if "%entrada%" == "%code%" (
    echo Acesso liberado! Prosseguindo, aguarde...
    timeout /t 2 /nobreak >nul
) else (
    echo Acesso negado! Refazendo a verificacão...
    timeout /t 2 /nobreak >nul
    pause 
    goto verificacao
)
cls

rem =============================
rem 🟢 Coleta de dados do aluno
rem =============================

set /p nome=Digite o nome do aluno: 
set /p idade=Digite a idade do aluno:

:confirmacao
echo Nome do aluno: %nome%
echo Idade do aluno: %idade%
choice /c SN /n /m "Confirma? (S/N): "

if errorlevel 2 goto confirmacao
if errorlevel 1 goto prosseguindo

timeout /t 2 /nobreak >nul

:prosseguindo
cls 
echo Quase lá! 
timeout /t 2 /nobreak >nul

rem 🟢 Inserção de notas
set /p p=Digite a nota de Portugues do aluno: 
set /p m=Digite a nota de Matematica do aluno:
echo Salvando...
timeout /t 2 /nobreak >nul
cls 
goto perfil 

rem =============================
rem 🟢 Exibição do perfil
rem =============================

:perfil 
if %p% GEQ 5 (
    set aprovado1=true
) else (
    set aprovado1=false
)

if %m% GEQ 5 (
    set aprovado2=true
) else (
    set aprovado2=false
)

echo ==== Notas do aluno: %nome% ====
echo Portugues (%p%) → Aprovado? %aprovado1%
echo Matematica (%m%) → Aprovado? %aprovado2%
echo ================================
echo Obs: Digite 1 para o menu de configuração do usuário

choice /c 1 /n /m "Digite: "
if errorlevel 1 goto config 

rem =============================
rem ⚙️ Menu de configuração
rem =============================

:config
cls 
echo ====== CONFIGURACAO ======
echo 1 - Editar nome do aluno 
echo 2 - Editar idade do aluno 
echo 3 - Editar notas do aluno
echo 4 - Voltar 
echo ==========================

choice /c 1234 /n /m "Escolha uma opção: "
if errorlevel 4 goto perfil
if errorlevel 3 goto edn  rem Editar Notas
if errorlevel 2 goto ida  rem Editar Idade
if errorlevel 1 goto nd   rem Nome eDitar

rem =============================
rem 🔁 Editar nome
rem =============================

:nd 
cls
set /p nome=Digite o novo nome do aluno:
cls
echo Salvando...
timeout /t 2 /nobreak >nul
echo Voltando para o menu de configuracao...
timeout /t 2 /nobreak >nul
goto config

rem =============================
rem 🔁 Editar idade
rem =============================

:ida
cls
set /p idade=Digite a nova idade do aluno: 

if "%idade%"=="" (
    echo Você precisa digitar uma idade válida!
    timeout /t 2 /nobreak >nul
    goto ida
)

if %idade% LSS 0 (
    echo A idade do aluno não pode ser menor que 0!
    timeout /t 2 /nobreak >nul
    goto ida
) else (
    echo Salvando...
    timeout /t 2 /nobreak >nul
    cls
    echo Voltando...
    timeout /t 2 /nobreak >nul
    goto config
)

rem =============================
rem 🔁 Editar notas
rem =============================

:edn 
cls 
echo ==== Edicao de Notas ====
echo 1 - Portugues 
echo 2 - Matematica 
echo 3 - Voltar 
echo =========================

choice /c 123 /n /m "Escolha uma opcao: "
if errorlevel 3 goto config
if errorlevel 2 goto edm
if errorlevel 1 goto edp

:edp 
cls
set /p p=Digite a nova nota de Portugues do aluno:
echo Salvando...
timeout /t 2 /nobreak >nul
goto edn 

:edm 
cls
set /p m=Digite a nova nota de Matematica do aluno:
echo Salvando...
timeout /t 2 /nobreak >nul
goto edn 

pause



