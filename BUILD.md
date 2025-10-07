# Build Guide

This guide describes how to build and validate the OpenAI Cookbook.

## Prerequisites

- Python 3.8 or higher
- Make (optional, but recommended)

## Quick Start

### Using Make (Recommended)

1. Install build dependencies:
```bash
make install
```

2. Build and validate everything:
```bash
make build
```

3. Run all tests:
```bash
make test
```

### Manual Build

1. Install dependencies:
```bash
pip install nbformat jupyter-client ipykernel
```

2. Validate all notebooks:
```bash
python .github/scripts/check_notebooks.py --all
```

3. Validate only changed notebooks (for contributors):
```bash
python .github/scripts/check_notebooks.py
```

## Available Make Targets

- `make help` - Show help message with all available targets
- `make install` - Install build dependencies
- `make build` - Build and validate the entire cookbook
- `make test` - Run all tests and validations
- `make validate` - Validate notebook formats
- `make clean` - Clean temporary files

## Validation

The build system validates:

1. **Notebook Format**: All Jupyter notebooks (`.ipynb` files) are checked for valid JSON structure and proper notebook format using `nbformat`.

## Continuous Integration

The build system is integrated with GitHub Actions:

- Pull requests automatically validate changed notebooks
- Main branch builds trigger website deployment

## Troubleshooting

### "No changed .ipynb files to validate"

This means you haven't modified any notebook files. This is normal when running the validation script without the `--all` flag on an up-to-date branch.

### Import errors

Make sure you've installed the build dependencies:
```bash
make install
```

or manually:
```bash
pip install nbformat jupyter-client ipykernel
```

## Contributing

When contributing to the cookbook:

1. Run `make test` before submitting a pull request
2. Fix any validation errors reported
3. Only commit valid notebook files

For more information, see [CONTRIBUTING.md](CONTRIBUTING.md).
