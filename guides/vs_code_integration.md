# VS Code Integration

This guide covers how to effectively integrate Roo Code with VS Code and other extensions to create a powerful AI-assisted development environment.

## Basic Integration

### Extension Requirements

For the best experience, install these VS Code extensions:

- **Roo Code**: The primary AI assistant extension
- **GitHub Copilot** (optional): For additional code suggestions
- **GitLens** (recommended): For enhanced git integration
- **Python**, **ESLint**, etc.: Language-specific extensions

### Workspace Setup

1. Open your project folder in VS Code
2. Create a `.vscode` folder in your project root if it doesn't exist
3. Create these configuration files:

#### settings.json

```json
{
  "rooCode.defaultModel": "gemini-2.5-pro",
  "rooCode.memoryBank.enabled": true,
  "editor.inlineSuggest.enabled": true,
  "editor.suggest.showMethods": true,
  "editor.suggest.preview": true,
  "editor.acceptSuggestionOnEnter": "on"
}
```

#### extensions.json

```json
{
  "recommendations": [
    "roovetgit.roo-code",
    "github.copilot",
    "eamodio.gitlens",
    "ms-python.python"
  ]
}
```

## GitHub Copilot Integration

Roo Code can work alongside GitHub Copilot for an enhanced experience:

### Configuration

```json
{
  "rooCode.gitHubCopilot.enabled": true,
  "rooCode.gitHubCopilot.priority": "alternating",
  "github.copilot.enable": true,
  "github.copilot.editor.enableAutoCompletions": true
}
```

### Usage Scenarios

1. **Inline Completions**: 
   - GitHub Copilot provides real-time suggestions as you type
   - Roo Code offers more context-aware completions when requested

2. **Alternating Mode**:
   - Set `"rooCode.gitHubCopilot.priority": "alternating"`
   - System alternates between using Copilot and your chosen AI model

3. **Specialized Usage**:
   - Use Copilot for quick, line-by-line completions
   - Use Roo Code for more complex, multi-line implementations or explanations

## Keyboard Shortcuts

Customize keyboard shortcuts for maximum efficiency:

1. Open Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on Mac)
2. Type "Preferences: Open Keyboard Shortcuts"
3. Search for "Roo Code"
4. Add your preferred shortcuts

Recommended shortcuts:

| Command | Suggested Shortcut | Description |
|---------|-------------------|-------------|
| Roo Code: Ask About Selection | `Ctrl+Alt+A` | Ask about selected code |
| Roo Code: Complete Code | `Ctrl+Alt+C` | Complete the current code |
| Roo Code: Explain Code | `Ctrl+Alt+E` | Explain selected code |
| Roo Code: Refactor Code | `Ctrl+Alt+R` | Refactor selected code |
| Roo Code: Generate Tests | `Ctrl+Alt+T` | Generate tests for selected code |
| Roo Code: Switch Model | `Ctrl+Alt+M` | Change the active AI model |

## Context Panel

Roo Code provides a context panel for interacting with your AI assistant:

1. Open Command Palette
2. Type "Roo Code: Show Context Panel"
3. The panel appears in the sidebar

Features:
- View current project context
- See recent interactions
- Manually add context
- Switch between models
- View token usage statistics

## Editor Integration

### Code Lens

Enable Code Lens for in-editor AI interactions:

```json
{
  "rooCode.codeLens.enabled": true,
  "rooCode.codeLens.actions": [
    "explain",
    "optimize",
    "document",
    "refactor",
    "testThis"
  ]
}
```

### Status Bar Integration

The status bar shows:
- Current AI model
- Connection status
- Token usage

Click on the status bar items for quick actions.

## Command Palette Integration

All Roo Code features are accessible via Command Palette:

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Roo Code" to see all available commands

Common commands:
- **Roo Code: Initialize Project Context** - Scan project for context
- **Roo Code: Ask Question** - Ask a general question
- **Roo Code: Generate Documentation** - Create docs for selected code
- **Roo Code: Explain Code** - Get an explanation of selected code
- **Roo Code: Analyze Code Quality** - Review code for improvements
- **Roo Code: Show Settings** - View and edit Roo Code settings

## Terminal Integration

Roo Code can help with terminal commands:

1. Right-click in the terminal
2. Select "Roo Code: Help with Command"
3. Ask for help with specific command syntax

Enable this feature:

```json
{
  "rooCode.terminal.enabled": true,
  "rooCode.terminal.contextMenu": true
}
```

## Debugging Integration

Get help during debugging sessions:

```json
{
  "rooCode.debugging.enabled": true,
  "rooCode.debugging.analyzeErrors": true,
  "rooCode.debugging.suggestFixes": true
}
```

This enables:
- Error analysis when debugging stops at exceptions
- Fix suggestions for common error patterns
- Variable value inspection help

## Task Integration

Create VS Code tasks that leverage Roo Code:

```json
// tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Roo Code: Document Current File",
      "type": "shell",
      "command": "${command:rooCode.documentFile}",
      "problemMatcher": []
    },
    {
      "label": "Roo Code: Analyze Project Structure",
      "type": "shell",
      "command": "${command:rooCode.analyzeProject}",
      "problemMatcher": []
    }
  ]
}
```

## Settings Sync

Your Roo Code settings can sync with VS Code Settings Sync:

1. Enable Settings Sync in VS Code
2. Ensure Roo Code settings are not excluded

**Note**: API keys are not synced by default for security reasons. Store them securely using:

```json
{
  "rooCode.security.storeKeysInKeychain": true
}
```

## Performance Optimization

For better performance with VS Code:

```json
{
  "rooCode.performance.lazyLoading": true,
  "rooCode.performance.cacheResponses": true,
  "rooCode.performance.responseCacheSize": 100,
  "rooCode.performance.throttleInlineSuggestions": true
}
```

## Next Steps

- Learn about [Memory Management](memory_management.md) to maximize context retention
- Explore [Advanced Techniques](advanced_techniques.md) for power users
- Check out project-specific templates in [Templates](../templates)

---

*For troubleshooting VS Code integration issues, see the [Troubleshooting Guide](troubleshooting.md).*
