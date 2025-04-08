# Makefile Commands Reference

This reference documents the standard Makefile commands that should be used across projects to ensure consistent development workflows when using AI assistance.

## Core Development Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make all` | Default target that runs linting and tests | `make all` |
| `make dev-setup` | Set up the development environment | `make dev-setup` |
| `make install` | Install the package | `make install` |
| `make install-dev` | Install development dependencies | `make install-dev` |

## Code Quality Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make lint` | Run all linting checks | `make lint` |
| `make lint-black` | Check code formatting with black | `make lint-black` |
| `make lint-isort` | Check import sorting with isort | `make lint-isort` |
| `make lint-mypy` | Run type checking with mypy | `make lint-mypy` |
| `make lint-ruff` | Run code linting with ruff | `make lint-ruff` |
| `make format` | Format code automatically | `make format` |

## Security Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make security` | Run all security checks | `make security` |
| `make security-bandit` | Run bandit security linter | `make security-bandit` |
| `make security-safety` | Run safety dependency vulnerability scanner | `make security-safety` |

## Testing Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make test` | Run all tests | `make test` |
| `make test-cov` | Run tests with coverage | `make test-cov` |
| `make test-unit` | Run only unit tests | `make test-unit` |
| `make test-integration` | Run only integration tests | `make test-integration` |
| `make test-e2e` | Run only end-to-end tests | `make test-e2e` |

## Test Environment Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make test-env` | Start the test environment | `make test-env` |
| `make test-cleanup` | Stop and clean up test environment | `make test-cleanup` |
| `make test-migrate` | Run database migrations in test environment | `make test-migrate` |
| `make test-setup` | Full test environment setup including migrations | `make test-setup` |

## Building Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make build` | Build the package | `make build` |
| `make clean` | Clean build artifacts | `make clean` |

## Docker Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make docker-build` | Build Docker image | `make docker-build` |
| `make docker-run` | Run application in Docker using docker-compose | `make docker-run` |
| `make docker-dev` | Run development environment in Docker using docker-compose | `make docker-dev` |

## Deployment Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make deploy-dev` | Deploy to development environment using Skaffold | `make deploy-dev` |
| `make deploy-staging` | Deploy to staging environment using Skaffold | `make deploy-staging` |
| `make deploy-prod` | Deploy to production environment using Skaffold | `make deploy-prod` |

## Help Command

| Command | Description | Usage |
|---------|-------------|-------|
| `make help` | Show available targets | `make help` |

## AI Integration Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `make ai-review` | Run AI code review on changed files | `make ai-review` |
| `make ai-document` | Generate documentation using AI | `make ai-document` |
| `make ai-test` | Generate tests using AI | `make ai-test` |
| `make ai-refactor` | Suggest code refactoring improvements | `make ai-refactor` |

## Using Makefile Commands with AI Assistance

When using AI coding assistants with Makefile-based projects:

1. **Setting up a new project**:
   ```
   make dev-setup
   make install-dev
   ```

2. **Normal development cycle**:
   ```
   # Write code with AI assistance
   make format  # Format code before committing
   make lint    # Verify code quality
   make test    # Run tests to verify functionality
   ```

3. **Before submitting pull requests**:
   ```
   make all           # Run linting and tests
   make security      # Check for security issues
   make ai-review     # Get AI feedback on your changes
   ```

4. **When deploying**:
   ```
   make build         # Build the package
   make deploy-dev    # Deploy to development environment
   ```

## Extending the Makefile

To extend the Makefile for your specific project while maintaining AI integration compatibility:

1. Add custom targets at the end of the Makefile
2. Document new targets using standard comment formats
3. Update the `help` target to include new commands
4. Consider adding AI-specific targets prefixed with `ai-`

Example custom target:
```makefile
#---- Custom Commands ----#

# Generate OpenAPI documentation
api-docs:
	python -m scripts.generate_openapi_docs

# Analyze code complexity
complexity:
	radon cc src/ -a -s
```

These standard Makefile targets create consistency across projects, making it easier for AI assistants to understand your project structure and suggest appropriate commands during development.
