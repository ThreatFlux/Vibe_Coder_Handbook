# Memory Management

Effective memory management is crucial for maximizing the capabilities of AI coding assistants. This guide explores strategies for optimizing context retention and managing project knowledge through Roo Code's memory features.

## Understanding Context Windows

Different AI models have different context window sizes:

| Model | Context Window | Notes |
|-------|---------------|-------|
| Gemini 2.5 Pro | 1,000,000 tokens | Largest context window, ideal for complex projects |
| Claude 3.7 Sonnet | ~200,000 tokens | Smaller window but excellent reasoning |

A larger context window allows the AI to:
- Maintain awareness of more project files
- Remember more of your conversation history
- Better understand complex relationships between components

## Memory Bank System

### What is the Memory Bank?

The Roo Code Memory Bank is a structured system for:
- Storing important project context
- Maintaining key information between sessions
- Organizing code and documentation knowledge
- Providing persistent project awareness

### Setting Up Memory Bank

1. **Basic Configuration**:

```json
{
  "rooCode.memoryBank.enabled": true,
  "rooCode.memoryBank.persistPath": "~/.roo-code-memory",
  "rooCode.memoryBank.maxSize": 50
}
```

2. **Advanced Configuration**:

```json
{
  "rooCode.memoryBank.strategy": "project_aware",
  "rooCode.memoryBank.autoSync": true,
  "rooCode.memoryBank.syncInterval": 300,
  "rooCode.memoryBank.autoSummarize": true,
  "rooCode.memoryBank.summarizationThreshold": 0.8,
  "rooCode.memoryBank.prioritizeFiles": [
    "README.md",
    "ARCHITECTURE.md",
    "src/core/**/*.py",
    "src/models/**/*.py"
  ]
}
```

### Project-Specific Memory Configuration

In your project's `.roocode` file:

```yaml
memory_bank:
  strategy: project_aware
  auto_summarize: true
  key_files:
    - README.md
    - ARCHITECTURE.md
    - src/core/models.py
    - src/api/routes.py
  ignore_patterns:
    - "**/*.pyc"
    - "venv/**"
    - "node_modules/**"
    - ".git/**"
  priorities:
    high:
      - "src/core/**/*.py"
    medium:
      - "src/api/**/*.py"
    low:
      - "tests/**/*.py"
```

## Memory Management Strategies

### 1. Project Initialization

For new projects, properly initialize context:

1. Run "Roo Code: Initialize Project Context" from the Command Palette
2. Provide a comprehensive project description
3. Identify key architecture files
4. Define coding conventions and standards

Example project initialization prompt:

```
This project is a web application built with FastAPI and React. 
The backend uses SQLAlchemy for database access with PostgreSQL.
Authentication is handled via JWT tokens.
The project follows PEP 8 styling for Python and uses ESLint for JavaScript.
Key architectural files are in src/core/architecture.py and docs/ARCHITECTURE.md.
```

### 2. Session Management

At the start of each development session:

1. Run "Roo Code: Update Project Context" to refresh memory with recent changes
2. Use "Roo Code: Show Memory Status" to verify key files are in context
3. If needed, use "Roo Code: Focus Memory" to prioritize specific components

### 3. Progressive Disclosure

For large projects, use progressive disclosure:

1. Start with high-level architectural understanding
2. Focus on specific modules or components as needed
3. Use "Roo Code: Set Component Focus" to narrow the AI's attention

```json
{
  "rooCode.focus.component": "authentication",
  "rooCode.focus.files": [
    "src/auth/**/*.py",
    "src/models/user.py",
    "tests/auth/**/*.py"
  ]
}
```

### 4. Memory Persistence Strategies

Choose the appropriate persistence strategy:

- **Session Persistence**: Maintains context within a coding session
- **Project Persistence**: Maintains context between sessions for a project
- **Global Persistence**: Maintains some context across different projects

Configure in settings:

```json
{
  "rooCode.memoryBank.persistenceStrategy": "project",
  "rooCode.memoryBank.globalRetention": [
    "coding_standards",
    "language_preferences",
    "common_patterns"
  ]
}
```

## Advanced Memory Techniques

### Custom Memory Vectors

Create custom memory vectors for important concepts:

1. Open Command Palette
2. Run "Roo Code: Add Custom Memory"
3. Enter a key (e.g., "authentication_flow")
4. Provide a detailed description

Example custom memory:

```
Key: authentication_flow
Value: Our authentication uses JWT tokens stored in HTTP-only cookies.
The flow involves:
1. User submits credentials to /auth/login
2. Server validates and issues a JWT token with 1-hour expiry
3. Refresh token with 7-day expiry is stored in Redis
4. Token renewal happens via /auth/refresh endpoint
5. User logout at /auth/logout invalidates both tokens
```

### Memory Summarization

Enable automatic summarization for efficient memory use:

```json
{
  "rooCode.memoryBank.autoSummarize": true,
  "rooCode.memoryBank.summarizationModel": "gemini-2.5-pro",
  "rooCode.memoryBank.summarizationPrompt": "Summarize this project context while preserving key architectural details and relationships:"
}
```

### Context Pruning

Configure how memory gets pruned when approaching limits:

```json
{
  "rooCode.memoryBank.pruningStrategy": "lru",
  "rooCode.memoryBank.protectedMemories": [
    "project_architecture",
    "coding_standards",
    "authentication_flow"
  ],
  "rooCode.memoryBank.pruningExclusions": [
    "src/core/**/*.py"
  ]
}
```

## Model-Specific Memory Strategies

### For Gemini 2.5 Pro (1M tokens)

With its massive context window:
- Include more project files in context
- Keep longer conversation history
- Use less aggressive summarization
- Include more detailed documentation

```json
{
  "rooCode.models.gemini-2.5-pro.memorySettings": {
    "summarizationThreshold": 0.9,
    "conversationHistoryLength": 100,
    "projectFilesLimit": 50,
    "includeDocumentation": true,
    "includeTests": true
  }
}
```

### For Claude 3.7 Sonnet (~200K tokens)

With a more limited context window:
- Focus on essential files only
- Use more aggressive summarization
- Prioritize architecture over implementation details
- Limit conversation history retention

```json
{
  "rooCode.models.claude-3.7-sonnet.memorySettings": {
    "summarizationThreshold": 0.7,
    "conversationHistoryLength": 30,
    "projectFilesLimit": 20,
    "prioritizeArchitecture": true,
    "progressiveDisclosure": true
  }
}
```

## Memory Backup and Restoration

Protect your valuable project context:

```json
{
  "rooCode.memoryBank.backup": {
    "enabled": true,
    "path": "~/.roo-code-backups",
    "frequency": "daily",
    "retention": 10
  }
}
```

Restore memory from backup:
1. Open Command Palette
2. Run "Roo Code: Restore Memory from Backup"
3. Select the backup point to restore

## Troubleshooting Memory Issues

Common memory issues and solutions:

1. **Context Loss**:
   - Check that memoryBank.enabled is true
   - Verify persistence path is valid
   - Run "Roo Code: Diagnose Memory Issues"

2. **Model Confusion**:
   - Context might be exceeding model limits
   - Run "Roo Code: Clear Conversation History"
   - Keep core architecture but reduce peripheral files

3. **Performance Degradation**:
   - Too many files in memory can slow responses
   - Use more aggressive memory pruning
   - Reduce `projectFilesLimit` setting

## Next Steps

- Explore [Advanced Techniques](advanced_techniques.md) for power user features
- Learn about effective prompting in [Prompting Guide](prompting_guide.md)
- Set up project templates in [Project Templates](../templates/new_project.md)

---

*For more advanced memory management features, check the [Roo Code Memory Bank repository](https://github.com/GreatScottyMac/roo-code-memory-bank).*
