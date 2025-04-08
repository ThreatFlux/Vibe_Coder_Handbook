# New Project Template

This template provides a structured approach to setting up a new project with AI-assisted development using Roo Code. Follow these steps to establish a solid foundation for your project.

## Project Initialization Checklist

- [ ] Create project directory and initialize version control
- [ ] Set up `.gitignore` for your technology stack
- [ ] Create a comprehensive `README.md`
- [ ] Configure Roo Code settings for the project
- [ ] Establish the initial file structure
- [ ] Create system instructions for AI assistants
- [ ] Set up a Makefile for common operations
- [ ] Initialize the memory bank with project context
- [ ] Configure development environment
- [ ] Set up initial CI/CD pipeline

## Step-by-Step Guide

### 1. Project Creation and Version Control

```bash
# Create project directory
mkdir my-project
cd my-project

# Initialize git repository
git init

# Create initial .gitignore
curl https://www.toptal.com/developers/gitignore/api/python,visualstudiocode,macos > .gitignore
# Edit as needed for your specific technology stack
```

### 2. Create Comprehensive README

Create a `README.md` file with the following sections:

```markdown
# Project Name

Brief description of the project and its purpose.

## Features

- Feature 1
- Feature 2
- Feature 3

## Technology Stack

- Backend: [e.g., Python/FastAPI]
- Database: [e.g., PostgreSQL]
- Frontend: [e.g., React/TypeScript]
- Deployment: [e.g., Docker/Kubernetes]

## Development Setup

### Prerequisites

- List required software and dependencies
- Minimum versions if applicable

### Installation

```bash
# Installation commands
```

### Configuration

```bash
# Configuration commands
```

### Running Locally

```bash
# Commands to run the project locally
```

## Project Structure

Explain the high-level organization of the project.

## Development Workflow

Outline the recommended development workflow.

## Testing

Explain how to run tests.

## Deployment

Describe the deployment process.

## Contributing

Guidelines for contributing to the project.

## License

Project license information.
```

### 3. Configure Roo Code Settings

Create a `.roocode` file in your project root:

```yaml
project_name: "My Project"
description: "A comprehensive description of your project and its purpose"
default_model: "gemini-2.5-pro"
models:
  gemini-2.5-pro:
    temperature: 0.7
  claude-3.7-sonnet:
    temperature: 0.5
    thinking: true
memory_bank:
  enabled: true
  strategy: "project_aware"
  auto_summarize: true
  key_files:
    - "README.md"
    - "ARCHITECTURE.md"
    - "src/core/models.py"
  ignore_patterns:
    - "**/*.pyc"
    - "venv/**"
    - "node_modules/**"
    - ".git/**"
file_associations:
  architecture: ["*.md", "ARCHITECTURE.md", "DESIGN.md"]
  tests: ["test_*.py", "*_test.py", "*.spec.ts"]
  docs: ["docs/**/*.md", "*.rst"]
```

### 4. Establish Project Structure

Create a basic project structure (example for a Python backend with React frontend):

```bash
# Core directories
mkdir -p src/backend src/frontend docs tests

# Backend structure
mkdir -p src/backend/models src/backend/api src/backend/services src/backend/utils

# Frontend structure
mkdir -p src/frontend/components src/frontend/hooks src/frontend/pages src/frontend/utils

# Test structure
mkdir -p tests/unit tests/integration tests/e2e

# Documentation
mkdir -p docs/architecture docs/api docs/user
```

### 5. Create System Instructions

Create a `SYSTEM_INSTRUCTIONS.md` file using the template provided in this handbook:

```bash
cp /path/to/templates/system_instructions.md SYSTEM_INSTRUCTIONS.md
# Edit the file to customize for your project
```

### 6. Set Up Makefile

Create a `Makefile` using the template provided in this handbook:

```bash
cp /path/to/examples/makefile/sample_makefile.mk Makefile
# Edit the Makefile to customize for your project
```

### 7. Initialize Memory Bank

Use Roo Code to initialize the memory bank with your project context:

1. Open VS Code in your project directory
2. Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on Mac)
3. Run "Roo Code: Initialize Project Context"
4. Use this prompt template to initialize:

```
This project is [brief description]. 

The technology stack includes:
- [Technology 1]
- [Technology 2]
- [Technology 3]

The project structure follows [architectural pattern] with [key design principles].

Key components include:
- [Component 1]: [Purpose]
- [Component 2]: [Purpose]
- [Component 3]: [Purpose]

Development follows these principles:
- [Principle 1]
- [Principle 2]
- [Principle 3]
```

### 8. Configure Development Environment

Create appropriate configuration files for your development environment:

#### For Python projects:

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Create requirements files
touch requirements.txt requirements-dev.txt

# Create pyproject.toml
cat > pyproject.toml << EOL
[build-system]
requires = ["setuptools>=42", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "my-project"
version = "0.1.0"
description = "Project description"
readme = "README.md"
requires-python = ">=3.8"
license = {text = "MIT"}
authors = [
    {name = "Your Name", email = "your.email@example.com"},
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "pytest-cov>=4.0.0",
    "black>=23.0.0",
    "isort>=5.0.0",
    "mypy>=1.0.0",
    "ruff>=0.0.1",
]

[tool.black]
line-length = 88
target-version = ["py38", "py39", "py310", "py311"]

[tool.isort]
profile = "black"
line_length = 88

[tool.mypy]
python_version = "3.8"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true
disallow_incomplete_defs = true

[tool.ruff]
line-length = 88
target-version = "py38"
select = ["E", "F", "I", "N", "B", "A"]
ignore = []
EOL
```

#### For Node.js/TypeScript projects:

```bash
# Create package.json
npm init -y

# Install essential dependencies
npm install --save-dev typescript eslint prettier jest

# Create tsconfig.json
cat > tsconfig.json << EOL
{
  "compilerOptions": {
    "target": "es2020",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noFallthroughCasesInSwitch": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx"
  },
  "include": ["src"]
}
EOL

# Create .eslintrc.js
cat > .eslintrc.js << EOL
module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'react', 'react-hooks'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    'prettier'
  ],
  rules: {
    // Custom rules
  },
  settings: {
    react: {
      version: 'detect'
    }
  }
};
EOL

# Create prettier.config.js
cat > prettier.config.js << EOL
module.exports = {
  singleQuote: true,
  trailingComma: 'es5',
  printWidth: 80,
  tabWidth: 2,
  semi: true
};
EOL
```

### 9. Set Up CI/CD Pipeline

Create a basic GitHub Actions workflow:

```bash
mkdir -p .github/workflows

# Create CI workflow
cat > .github/workflows/ci.yml << EOL
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        if [ -f requirements-dev.txt ]; then pip install -r requirements-dev.txt; fi
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: Lint
      run: |
        make lint
    - name: Security check
      run: |
        make security
    - name: Test
      run: |
        make test
EOL
```

### 10. Initial Commit

```bash
# Add all files to git
git add .

# Commit
git commit -m "Initial project setup"

# Add remote repository (if applicable)
git remote add origin <repository-url>
git push -u origin main
```

## Using AI to Extend Your Project

After setting up the basic structure, use AI assistance to:

1. **Design the architecture**:
   ```
   Based on my project description and structure, help me design a suitable architecture. Consider:
   - Scalability requirements
   - Data flow between components
   - Security considerations
   - Maintainability and testing
   ```

2. **Create core models**:
   ```
   I need to design the core models for my application. Based on these requirements:
   [list requirements]
   
   Please suggest appropriate model definitions with proper relationships and validation.
   ```

3. **Set up configuration management**:
   ```
   Help me implement a configuration management system that supports:
   - Development, testing, and production environments
   - Secret management
   - Environment variable validation
   - Sensible defaults
   ```

4. **Create API endpoints**:
   ```
   Based on the models we've designed, help me create RESTful API endpoints for:
   - [Resource 1]
   - [Resource 2]
   - [Resource 3]
   
   Include proper validation, error handling, and documentation.
   ```

5. **Implement authentication**:
   ```
   Help me implement a secure authentication system using [authentication method].
   It should support:
   - User registration and login
   - Password reset
   - Token management
   - Role-based access control
   ```

## Project Documentation

Ensure your project includes these essential documentation files:

1. **ARCHITECTURE.md**: Overall system architecture and design decisions
2. **API.md**: API documentation if applicable
3. **CONTRIBUTING.md**: Guidelines for contributing to the project
4. **CHANGELOG.md**: Track changes in each version
5. **LICENSE**: Appropriate license for your project

## First Development Sprint

After setup, plan your first development sprint with AI assistance:

1. Break down initial features into tasks
2. Estimate complexity and dependencies
3. Set up issue tracking
4. Establish branch naming and PR conventions
5. Begin implementation with AI pair programming

---

This template provides a solid foundation for starting a new project with AI assistance. Adapt it to your specific technology stack and requirements.
