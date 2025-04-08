# Model Selection Guide

Choosing the right AI model for your development tasks can significantly impact productivity, code quality, and cost efficiency. This guide provides recommendations based on different development scenarios.

## Current Recommended Models

### Gemini 2.5 Pro (Primary Recommendation)

**Best for**:
- Day-to-day coding tasks
- Complex project-wide context understanding
- Long development sessions
- Cost-efficient development

**Key advantages**:
- Massive 1M token context window
- Excellent price-to-performance ratio
- Strong code generation capabilities
- Good at following detailed instructions
- Supports various programming languages
- Works well with GitHub Copilot integration

**Configuration**:
```json
{
  "rooCode.defaultModel": "gemini-2.5-pro",
  "rooCode.models.gemini-2.5-pro.temperature": 0.7,
  "rooCode.models.gemini-2.5-pro.topP": 0.95
}
```

### Claude 3.7 Sonnet with Thinking (Secondary Recommendation)

**Best for**:
- Architecture planning
- Complex reasoning tasks
- Detailed code analysis
- Security review and assessment
- When cost is less of a concern

**Key advantages**:
- Excellent reasoning capabilities
- "Thinking" mode for complex problems
- Very strong at explaining decisions
- High quality architectural guidance
- Better at handling complex system relationships

**Limitations**:
- More limited context window than Gemini 2.5 Pro
- Higher cost per token
- May require more prompt optimization

**Configuration**:
```json
{
  "rooCode.models.claude-3.7-sonnet.temperature": 0.5,
  "rooCode.models.claude-3.7-sonnet.thinking": true
}
```

## Task-Specific Recommendations

### Architecture Planning Phase

**Recommended Model**: Gemini 2.5 Pro  
**Alternative**: Claude 3.7 Sonnet with thinking for especially complex systems

**Why**:
- Better at reasoning through system architecture
- More verbose in explaining decisions
- Handles complex system relationships well
- Can maintain context through multiple revisions

### Implementation Phase

**Recommended Model**: Gemini 2.5 Pro  
**Alternative**: GitHub Copilot through VS Code integration

**Why**:
- More focused on code generation
- Better at handling implementation details
- More efficient for actual coding tasks
- Excellent for iterative development

### Debugging and Code Review

**Recommended Model**: Gemini 2.5 Pro  
**Alternative**: Claude 3.7 Sonnet for complex bugs

**Why**:
- Can process larger blocks of code
- Good at identifying logical errors
- Can suggest fixes efficiently

### Documentation Generation

**Recommended Model**: Either model works well
- Gemini 2.5 Pro for more comprehensive docs with larger context
- Claude 3.7 Sonnet for more polished writing quality

## Setting Up Multiple Models

For optimal workflow, configure multiple models and switch between them based on your current task:

1. Configure all models in VS Code settings
2. Set a default model for general use
3. Use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and select "Roo Code: Switch Model" to change models

Example VS Code configuration for multiple models:

```json
{
  "rooCode.defaultModel": "gemini-2.5-pro",
  "rooCode.models.gemini-2.5-pro": {
    "apiKey": "YOUR_GEMINI_API_KEY",
    "temperature": 0.7
  },
  "rooCode.models.claude-3.7-sonnet": {
    "apiKey": "YOUR_CLAUDE_API_KEY",
    "temperature": 0.5,
    "thinking": true
  },
  "rooCode.modelSwitching.enabled": true,
  "rooCode.modelSwitching.shortcut": "ctrl+alt+m"
}
```

## Cost Management

To optimize costs while maintaining productivity:

1. Use Gemini 2.5 Pro as your primary model for most tasks
2. Reserve Claude 3.7 Sonnet for specific complex reasoning tasks
3. Monitor usage with built-in tracking: "Roo Code: Show Usage Statistics"
4. Set up usage limits in your configuration:

```json
{
  "rooCode.usageTracking.enabled": true,
  "rooCode.usageTracking.dailyLimit": 500000,
  "rooCode.usageTracking.warningThreshold": 0.8
}
```

## Performance Considerations

Different models have different response times:

- **Gemini 2.5 Pro**: Generally faster for most coding tasks
- **Claude 3.7 Sonnet**: May be slower, especially with thinking mode enabled

Configure timeout settings appropriately:

```json
{
  "rooCode.requestTimeout": 60000,
  "rooCode.models.claude-3.7-sonnet.requestTimeout": 120000
}
```

## Next Steps

- Learn how to optimize prompts for your chosen model in [Advanced Techniques](advanced_techniques.md)
- Set up memory management for extended coding sessions in [Memory Management](memory_management.md)
- Configure VS Code integration in [VS Code Integration](vs_code_integration.md)

---

*Model capabilities and pricing may change over time. This guide was last updated on April 8, 2025.*
