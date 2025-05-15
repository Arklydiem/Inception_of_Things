# Colors for output
PURPLE=\033[0;35m
BLUE=\033[0;34m
GREEN=\033[0;32m
RED=\033[0;31m
YELLOW=\033[1;33m
NC=\033[0m

# Default target
.DEFAULT_GOAL := help

help:
	@echo "$(PURPLE)[HELP]$(NC) $(BLUE)Available commands:$(NC)"
	@echo "\t$(GREEN)make start$(NC)\t\t- Start the virtual machine"
	@echo "\t$(GREEN)make stop$(NC)\t\t- Stop the virtual machine"
	@echo "\t$(GREEN)make restart$(NC)\t\t- Restart the virtual machine (soft restart)"
	@echo "\t$(GREEN)make hard-restart$(NC)\t- Full reset and start the VM (hard restart)"
	@echo "\t$(GREEN)make reset$(NC)\t\t- Stop, destroy and clean everything"
	@echo "\t$(GREEN)make status$(NC)\t\t- Show VM status"
	@echo "\t$(GREEN)make ssh$(NC)\t\t- SSH into the VM"
	@echo "\t$(GREEN)make clean$(NC)\t\t- Remove .vagrant and temporary files"

start:
	@echo "$(PURPLE)[START]$(NC) $(BLUE)Starting the virtual machine...$(NC)"
	vagrant up
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Virtual machine started.$(NC)"

stop:
	@echo "$(PURPLE)[STOP]$(NC) $(YELLOW)Stopping the virtual machine...$(NC)"
	vagrant halt
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Virtual machine stopped.$(NC)"

restart:
	@echo "$(PURPLE)[RESTART]$(NC) $(BLUE)Restarting the virtual machine...$(NC)"
	vagrant halt || true
	vagrant up
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Virtual machine restarted successfully.$(NC)"

hard-restart:
	@echo "$(PURPLE)[HARD-RESTART]$(NC) $(RED)Performing a full reset of the virtual machine...$(NC)"
	vagrant halt || true
	vagrant destroy -f || true
	rm -rf .vagrant
	@echo "$(PURPLE)[RESET]$(NC) $(YELLOW)Starting a fresh virtual machine...$(NC)"
	vagrant up --provision
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Fresh virtual machine started successfully.$(NC)"

reset:
	@echo "$(PURPLE)[RESET]$(NC) $(RED)Destroying the virtual machine and cleaning up...$(NC)"
	vagrant halt || true
	vagrant destroy -f || true
	rm -rf .vagrant
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Environment fully cleaned.$(NC)"

status:
	@echo "$(PURPLE)[STATUS]$(NC) $(BLUE)Checking VM status...$(NC)"
	vagrant status
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Status retrieved.$(NC)"

ssh:
	@echo "$(PURPLE)[SSH]$(NC) $(BLUE)Connecting to the VM...$(NC)"
	vagrant ssh

clean:
	@echo "$(PURPLE)[CLEAN]$(NC) $(YELLOW)Cleaning project...$(NC)"
	rm -rf .vagrant
	find . -name "*.log" -type f -delete
	find . -name "*.tmp" -type f -delete
	@echo "$(PURPLE)[DONE]$(NC) $(GREEN)Project cleaned.$(NC)"
