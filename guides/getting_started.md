# Getting Started with AI-Assisted Development

This guide will help you set up your development environment for AI-assisted coding using Roo Code and configure your preferred AI models.

## Prerequisites

Before getting started, ensure you have the following installed:

- **VS Code**: Version 1.85.0 or higher ([Download](https://code.visualstudio.com/))
- **Python**: Version 3.13 or higher for best practices
- **Git**: For version control
- **API Keys**: For your chosen AI models (Gemini, Claude, etc.)

## Installation Steps

### 1. Install VS Code Extensions

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X or Cmd+Shift+X on Mac)
3. Search for "Roo Code" and install the extension

### 2. Configure Roo Code

1. After installation, open VS Code settings (Ctrl+, or Cmd+, on Mac)
2. Search for "Roo Code" in settings
3. Configure the following settings:
   - API keys for your chosen models
   - Default model preferences
   - Memory bank settings

Example configuration:

```json
{
  "rooCode.gemini.apiKey": "YOUR_GEMINI_API_KEY",
  "rooCode.claude.apiKey": "YOUR_CLAUDE_API_KEY",
  "rooCode.defaultModel": "gemini-2.5-pro",
  "rooCode.memoryBank.enabled": true,
  "rooCode.memoryBank.persistPath": "~/.roo-code-memory"
}
```

### 3. Set Up Memory Bank (Optional)

For enhanced context management:

```bash
# Clone the memory bank repository
git clone https://github.com/GreatScottyMac/roo-code-memory-bank
cd roo-code-memory-bank

# Install dependencies
pip install -r requirements.txt

# Configure memory bank
cp config.example.yaml config.yaml
# Edit config.yaml with your preferred settings
```

## Initial Configuration

After installation, it's recommended to:

1. Create a `.roocode` configuration file in your project root
2. Set up project-specific model preferences
3. Configure memory bank initialization for your project

Example `.roocode` configuration:

```yaml
project_name: MyAwesomeProject
default_model: gemini-2.5-pro
fallback_model: claude-3.7-sonnet
memory_bank:
  enabled: true
  context_strategy: project_aware
models:
  gemini-2.5-pro:
    temperature: 0.7
  claude-3.7-sonnet:
    temperature: 0.5
    thinking-tokens: 1024
```

## First Steps

1. **Test Your Installation**:
   - Open VS Code in a project directory
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Roo Code: Test Connection" and press Enter
   - You should see a confirmation that your models are accessible

2. **Try a Simple Prompt**:
   - Open a code file
   - Select some code or position your cursor where you want to add code
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Roo Code: Ask About Selection" and press Enter
   - Enter a prompt like "Explain this code" or "Optimize this function"

3. **Initialize Project Context**:
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Roo Code: Initialize Project Context"
   - Follow the prompts to provide your project description

## Next Steps

Once you've confirmed your setup is working:

- Explore [Model Selection](model_selection.md) to understand which models work best for different tasks
- Learn about [Memory Management](memory_management.md) for handling larger projects
- Check out [VS Code Integration](vs_code_integration.md) for more advanced features

## Troubleshooting

If you encounter issues during setup:

- Verify your API keys are correct and have the necessary permissions
- Check VS Code's extension logs for error messages
- Ensure you have the correct versions of all prerequisites
- See our [Troubleshooting Guide](troubleshooting.md) for common issues and solutions

---

*For more detailed configuration options, refer to the [Roo Code Setup](roo_code_setup.md) guide.*
