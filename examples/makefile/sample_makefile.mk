# Project Makefile - Standard Development Workflow
.PHONY: all clean test lint format install dev-setup build docker-build deploy-dev deploy-prod help test-env test-cleanup test-migrate test-setup

# Default target
all: lint test

#---- Environment Setup ----#

# Set up development environment
dev-setup:
	python -m venv .venv
	. .venv/bin/activate && uv pip install -e ".[dev]"
	pre-commit install

# Install the package
install:
	uv pip install -e .

# Install development dependencies
install-dev:
	uv pip install -e ".[dev]"

#---- Code Quality ----#

# Run all linting checks
lint: lint-black lint-isort lint-mypy lint-ruff

# Check code formatting with black
lint-black:
	black --check src

# Check import sorting with isort
lint-isort:
	isort --check-only src

# Run type checking with mypy
lint-mypy:
	mypy src

# Run code linting with ruff
lint-ruff:
	ruff check src

# Format code automatically
format:
	black src
	isort src
	ruff check --fix src

#---- Security ----#

# Run all security checks
security: security-bandit security-safety

# Run bandit security linter
security-bandit:
	bandit -r src -ll -ii

# Run safety dependency vulnerability scanner
security-safety:
	safety check --full-report

#---- Testing ----#

# Run all tests
test:
	pytest

# Run tests with coverage
test-cov:
	pytest --cov=src --cov-report=xml --cov-report=term

# Run only unit tests
test-unit:
	pytest tests/unit

# Run only integration tests
test-integration:
	pytest tests/integration

# Run only end-to-end tests
test-e2e:
	pytest tests/e2e

# Test Environment Management
test-env: ## Start the test environment
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d

test-cleanup: ## Stop and clean up test environment
	docker-compose down -v

test-migrate: ## Run database migrations in test environment
	docker-compose exec app alembic upgrade head

test-setup: test-env ## Full test environment setup including migrations
	@echo "Waiting for services to be ready..."
	@sleep 10
	@$(MAKE) test-migrate

#---- Building ----#

# Build the package
build: clean
	python -m build

# Clean build artifacts
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete

#---- Docker ----#

# Build Docker image
docker-build:
	docker build -t myproject:latest .

# Run application in Docker using docker-compose
docker-run:
	docker-compose up

# Run development environment in Docker using docker-compose
docker-dev:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

#---- Deployment ----#

# Deploy to development environment using Skaffold
deploy-dev:
	skaffold run -p dev

# Deploy to staging environment using Skaffold
deploy-staging:
	skaffold run -p staging

# Deploy to production environment using Skaffold
deploy-prod:
	skaffold run -p prod

#---- Help ----#

# Show help
help:
	@echo "Available targets:"
	@echo "  dev-setup       Set up development environment"
	@echo "  install         Install the package"
	@echo "  install-dev     Install development dependencies"
	@echo "  lint            Run all linting checks"
	@echo "  format          Format code automatically"
	@echo "  test            Run all tests"
	@echo "  test-cov        Run tests with coverage"
	@echo "  test-unit       Run only unit tests"
	@echo "  test-integration Run only integration tests"
	@echo "  test-e2e        Run only end-to-end tests"
	@echo "  test-env        Start the test environment"
	@echo "  test-cleanup    Stop and clean up test environment"
	@echo "  test-migrate    Run database migrations in test environment"
	@echo "  test-setup      Full test environment setup including migrations"
	@echo "  build           Build the package"
	@echo "  clean           Clean build artifacts"
	@echo "  docker-build    Build Docker image"
	@echo "  docker-run      Run application in Docker using docker-compose"
	@echo "  docker-dev      Run development environment in Docker using docker-compose"
	@echo "  deploy-dev      Deploy to development environment using Skaffold"
	@echo "  deploy-staging  Deploy to staging environment using Skaffold"
	@echo "  deploy-prod     Deploy to production environment using Skaffold"
	@echo "  security        Run security checks (bandit, safety)"
	@echo "  help            Show this help"
