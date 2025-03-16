#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}
██████╗ ██╗      █████╗ ██╗   ██╗███████╗████████╗██████╗ ███████╗ █████╗ ██╗  ██╗
██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██║ ██╔╝
██████╔╝██║     ███████║ ╚████╔╝ ███████╗   ██║   ██████╔╝█████╗  ███████║█████╔╝ 
██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██╔═██╗ 
██║     ███████╗██║  ██║   ██║   ███████║   ██║   ██║  ██║███████╗██║  ██║██║  ██╗
╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
${NC}"

echo -e "${GREEN}Starting PlayStreak Platform...${NC}\n"

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python 3 is not installed${NC}"
    echo "Please install Python 3 and try again"
    exit 1
fi

# Check if required files exist
if [ ! -f "index.html" ]; then
    echo -e "${RED}Error: index.html not found${NC}"
    echo "Please make sure you're in the correct directory"
    exit 1
fi

# Kill any process using port 8000
echo "Checking if port 8000 is in use..."
if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null ; then
    echo "Port 8000 is in use. Attempting to free it..."
    lsof -ti:8000 | xargs kill -9
    echo "Port 8000 has been freed"
fi

# Start the server
echo -e "\n${GREEN}Starting server...${NC}"
python3 server.py
