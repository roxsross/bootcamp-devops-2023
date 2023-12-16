fmt:
	terraform fmt -recursive

clean:
	find . -type f -name "*.tfstate*" -prune -exec rm -rf {} \;
	find . -type f -name "*.terraform.lock.hcl" -prune -exec rm -rf {} \;
	find . -type d -name "*.terraform" -prune -exec rm -rf {} \;