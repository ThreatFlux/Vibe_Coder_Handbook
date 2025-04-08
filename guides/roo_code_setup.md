# Roo Code Setup Guide

This comprehensive guide walks you through installing, configuring, and optimizing Roo Code for AI-assisted development.

## Installation Options

### Method 1: VS Code Marketplace (Recommended)

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X or Cmd+Shift+X on Mac)
3. Search for "Roo Code"
4. Click Install

### Method 2: Manual VSIX Installation

1. Download the latest VSIX from [GitHub Releases](https://github.com/RooVetGit/Roo-Code/releases)
2. In VS Code, go to Extensions
3. Click the "..." menu in the top right
4. Select "Install from VSIX..."
5. Choose the downloaded file

### Method 3: Build from Source

For developers who want the latest features:

```bash
# Clone the repository
git clone https://github.com/RooVetGit/Roo-Code
cd Roo-Code

# Install dependencies
npm install

# Build the extension
npm run compile

# Package as VSIX
npm run package

# Install the generated VSIX
code --install-extension roo-code-*.vsix
```

## Configuration

### Essential Settings

After installation, configure these critical settings:

1. Open VS Code settings (Ctrl+, or Cmd+, on Mac)
2. Search for "Roo Code" in settings
3. Configure at minimum:

```json
{
  "rooCode.apiKeys": {
    "gemini": "YOUR_GEMINI_API_KEY",
    "claude": "YOUR_CLAUDE_API_KEY",
    "openai": "YOUR_OPENAI_API_KEY"
  },
  "rooCode.defaultModel": "gemini-2.5-pro",
  "rooCode.memoryBank.enabled": true
}
```

### Memory Bank Configuration

For enhanced project context:

```json
{
  "rooCode.memoryBank.enabled": true,
  "rooCode.memoryBank.persistPath": "~/.roo-code-memory",
  "rooCode.memoryBank.strategy": "project",
  "rooCode.memoryBank.maxSize": 50,
  "rooCode.memoryBank.autoSync": true,
  "rooCode.memoryBank.syncInterval": 300
}
```

### Model-Specific Settings

Configure different parameters for each model:

```json
{
  "rooCode.models": {
    "gemini-2.5-pro": {
      "temperature": 0.7,
      "topP": 0.95,
      "maxTokens": 8192
    },
    "claude-3.7-sonnet": {
      "temperature": 0.5,
      "topP": 0.9,
      "maxTokens": 4096,
      "thinking": true
    }
  }
}
```

### GitHub Copilot Integration

If you have GitHub Copilot access:

```json
{
  "rooCode.gitHubCopilot.enabled": true,
  "rooCode.gitHubCopilot.priority": "secondary",
  "rooCode.gitHubCopilot.inlineSuggestions": true
}
```

## Project Configuration

Create a `.roocode` file in your project root for project-specific settings:

```yaml
project_name: MyProject
description: A comprehensive web application with React frontend and FastAPI backend
default_model: gemini-2.5-pro
models:
  gemini-2.5-pro:
    temperature: 0.7
  claude-3.7-sonnet:
    temperature: 0.5
memory_bank:
  strategy: project
  auto_summarize: true
file_associations:
  architecture: ["*.md", "ARCHITECTURE.md", "DESIGN.md"]
  tests: ["test_*.py", "*_test.py", "*.spec.ts"]
  docs: ["docs/**/*.md", "*.rst"]
ignored_paths:
  - node_modules/
  - venv/
  - .git/
  - dist/
```

## Rate Limit Handling

Configure retry mechanisms and rate limit handling:

```json
{
  "rooCode.rateLimits.enabled": true,
  "rooCode.rateLimits.autoRetry": true,
  "rooCode.rateLimits.maxRetries": 3,
  "rooCode.rateLimits.retryDelay": 2000,
  "rooCode.rateLimits.exponentialBackoff": true
}
```

## Keyboard Shortcuts

Configure keyboard shortcuts for common operations:

1. Open Keyboard Shortcuts in VS Code (Ctrl+K Ctrl+S or Cmd+K Cmd+S on Mac)
2. Search for "Roo Code"
3. Assign shortcuts to your most-used commands:

Recommended shortcuts:
- "Roo Code: Ask About Selection" - `Ctrl+Shift+A`
- "Roo Code: Complete Code" - `Ctrl+Shift+C`
- "Roo Code: Explain Code" - `Ctrl+Shift+E`
- "Roo Code: Switch Model" - `Ctrl+Shift+M`
- "Roo Code: Initialize Project Context" - `Ctrl+Shift+I`

## Advanced Configuration

### Custom Prompt Templates

Create custom prompt templates for common tasks:

```json
{
  "rooCode.prompts.templates": {
    "optimize": "Optimize this code for performance while maintaining readability:",
    "document": "Generate comprehensive documentation for this code:",
    "test": "Write unit tests for this code using the testing framework for this language:",
    "refactor": "Refactor this code to improve its structure and maintainability:",
    "securityReview": "Perform a security review of this code and identify potential vulnerabilities:"
  }
}
```

### Language-Specific Settings

Configure different settings based on programming language:

```json
{
  "rooCode.languageSettings": {
    "python": {
      "defaultModel": "gemini-2.5-pro",
      "style": "pep8"
    },
    "javascript": {
      "defaultModel": "claude-3.7-sonnet",
      "style": "standard"
    },
    "java": {
      "defaultModel": "gemini-2.5-pro",
      "style": "google"
    }
  }
}
```

### Logging and Debugging

For troubleshooting:

```json
{
  "rooCode.logging.level": "debug",
  "rooCode.logging.file": "~/.roocode/logs/roocode.log",
  "rooCode.debug.showTimings": true,
  "rooCode.debug.showTokenCounts": true
}
```

## Verification

To verify your setup:

1. Open Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on Mac)
2. Type "Roo Code: Run Diagnostics"
3. Check the output for any issues

You should see confirmation that:
- All configured API keys are valid
- Models are accessible
- Memory bank is properly configured
- GitHub Copilot integration is working (if enabled)

## Next Steps

- Learn about effective [Model Selection](model_selection.md)
- Explore [VS Code Integration](vs_code_integration.md) features
- Set up [Memory Management](memory_management.md) for better context handling
- Check out [Advanced Techniques](advanced_techniques.md) for power users

---

*For troubleshooting common issues, refer to our [Troubleshooting Guide](troubleshooting.md).*
