.PHONY: help build test validate clean install

# Default target
help:
	@echo "OpenAI Cookbook Build System"
	@echo "============================="
	@echo ""
	@echo "Available targets:"
	@echo "  make help       - Show this help message"
	@echo "  make build      - Build and validate the entire cookbook"
	@echo "  make test       - Run all tests and validations"
	@echo "  make validate   - Validate notebook formats"
	@echo "  make install    - Install build dependencies"
	@echo "  make clean      - Clean temporary files"
	@echo ""

# Install dependencies needed for building/validating
install:
	@echo "Installing build dependencies..."
	pip install nbformat jupyter-client ipykernel

# Validate all notebooks in the repository
validate:
	@echo "Validating notebooks..."
	python .github/scripts/check_notebooks.py --all

# Run all validation and tests
test: validate
	@echo "All tests passed!"

# Full build - validate everything
build: validate
	@echo "Build completed successfully!"

# Clean temporary files
clean:
	@echo "Cleaning temporary files..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".ipynb_checkpoints" -delete
	@echo "Clean completed!"
