@echo off
REM Batch script to run and configure a TeamCity server and agent Docker containers

REM Set variables
SET SERVER_CONTAINER_NAME=teamcity-server
SET AGENT_CONTAINER_NAME=teamcity-agent
SET TEAMCITY_VERSION=2024.12
SET TEAMCITY_DATA_DIR=%cd%\teamcity_data
SET TEAMCITY_LOGS_DIR=%cd%\teamcity_logs
SET TEAMCITY_PORT=8111
SET AGENT_NAME=MyAgent

REM Create required directories
echo Creating TeamCity data and logs directories...
mkdir "%TEAMCITY_DATA_DIR%" 2>nul
mkdir "%TEAMCITY_LOGS_DIR%" 2>nul

REM Check if the server container is already running
docker ps -a --filter "name=%SERVER_CONTAINER_NAME%" | find "%SERVER_CONTAINER_NAME%" >nul
IF %ERRORLEVEL% EQU 0 (
    echo Server container "%SERVER_CONTAINER_NAME%" already exists.
    echo Stopping and removing existing server container...
    docker stop %SERVER_CONTAINER_NAME%
    docker rm %SERVER_CONTAINER_NAME%
)

REM Run the TeamCity server container
echo Starting TeamCity server container...
docker run -d ^
    --name %SERVER_CONTAINER_NAME% ^
    -p %TEAMCITY_PORT%:8111 ^
    -v "%TEAMCITY_DATA_DIR%:/data/teamcity_server/datadir" ^
    -v "%TEAMCITY_LOGS_DIR%:/opt/teamcity/logs" ^
    jetbrains/teamcity-server:%TEAMCITY_VERSION%

REM Confirm the server container is running
docker ps --filter "name=%SERVER_CONTAINER_NAME%" | find "%SERVER_CONTAINER_NAME%" >nul
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to start TeamCity server container.
    exit /b 1
)

REM Wait for the server to start
echo Waiting for the TeamCity server to initialize (this may take a few minutes)...
timeout /t 1800

REM Check if the agent container is already running
docker ps -a --filter "name=%AGENT_CONTAINER_NAME%" | find "%AGENT_CONTAINER_NAME%" >nul
IF %ERRORLEVEL% EQU 0 (
    echo Agent container "%AGENT_CONTAINER_NAME%" already exists.
    echo Stopping and removing existing agent container...
    docker stop %AGENT_CONTAINER_NAME%
    docker rm %AGENT_CONTAINER_NAME%
)

REM Run the TeamCity agent container
echo Starting TeamCity agent container...
docker run -d ^
    --name %AGENT_CONTAINER_NAME% ^
    --link %SERVER_CONTAINER_NAME%:teamcity-server ^
    -e SERVER_URL=http://teamcity-server:%TEAMCITY_PORT% ^
    -e AGENT_NAME=%AGENT_NAME% ^
    jetbrains/teamcity-agent:%TEAMCITY_VERSION%

REM Confirm the agent container is running
docker ps --filter "name=%AGENT_CONTAINER_NAME%" | find "%AGENT_CONTAINER_NAME%" >nul
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to start TeamCity agent container.
    exit /b 1
)

echo TeamCity server is running at http://localhost:%TEAMCITY_PORT%
echo Agent "%AGENT_NAME%" is connected to the server.
echo Data directory: %TEAMCITY_DATA_DIR%
echo Logs directory: %TEAMCITY_LOGS_DIR%

REM Optionally, display logs
echo To view server logs: docker logs -f %SERVER_CONTAINER_NAME%
echo To view agent logs: docker logs -f %AGENT_CONTAINER_NAME%

pause
