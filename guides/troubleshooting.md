# Troubleshooting Guide

This guide helps you diagnose and resolve common issues when using Roo Code and AI coding assistants in your development workflow.

## Connection and API Issues

### API Key Authentication Failures

**Symptoms**:
- "Invalid API key" or "Authentication failed" errors
- "Unable to connect to model service" messages

**Solutions**:
1. Verify your API key is correctly entered in VS Code settings
2. Check that your API key has the necessary permissions and quota
3. Ensure your key isn't expired or revoked
4. Try regenerating your API key from the provider's website

```json
// Check your VS Code settings.json
{
  "rooCode.apiKeys": {
    "gemini": "YOUR_GEMINI_API_KEY",
    "claude": "YOUR_CLAUDE_API_KEY"
  }
}
```

### Rate Limit Errors

**Symptoms**:
- "Rate limit exceeded" messages
- Unusual delays followed by timeouts
- Requests failing after multiple rapid interactions

**Solutions**:
1. Enable auto-retry functionality in settings
   ```json
   {
     "rooCode.rateLimits.autoRetry": true,
     "rooCode.rateLimits.maxRetries": 3,
     "rooCode.rateLimits.retryDelay": 2000
   }
   ```
2. Implement pacing in your workflow (wait a few seconds between requests)
3. Switch to a model with higher rate limits
4. Use the "Roo Code: Show Usage Statistics" command to monitor your usage

### Connectivity Problems

**Symptoms**:
- "Unable to connect to service" errors
- Timeouts during requests
- Intermittent connection failures

**Solutions**:
1. Check your internet connection
2. Verify that you can access the model provider's website
3. Ensure no firewall or proxy is blocking the connection
4. Increase the request timeout in settings:
   ```json
   {
     "rooCode.requestTimeout": 60000  // 60 seconds
   }
   ```
5. Try the "Roo Code: Test Connection" command from the Command Palette

## Memory and Context Issues

### Context Loss

**Symptoms**:
- AI seems to "forget" project details it knew earlier
- Inconsistent understanding of code structure
- Refers to files or functions that don't exist

**Solutions**:
1. Verify memory bank is enabled and properly configured
   ```json
   {
     "rooCode.memoryBank.enabled": true,
     "rooCode.memoryBank.persistPath": "~/.roo-code-memory"
   }
   ```
2. Run "Roo Code: Refresh Project Context" to update the AI's understanding
3. Check if the memory bank storage path exists and is writable
4. Increase memory allocation for your project
   ```json
   {
     "rooCode.memoryBank.maxSize": 50,
     "rooCode.memoryBank.projectFilesLimit": 30
   }
   ```

### Conversation Drift

**Symptoms**:
- AI responses become less relevant over time
- Discussion quality deteriorates during lengthy sessions
- AI starts providing generic or incorrect responses

**Solutions**:
1. Run "Roo Code: Clear Conversation History" to reset the current chat
2. Use "Roo Code: Start New Session" to begin fresh while maintaining project context
3. Periodically refocus the AI with explicit context statements
4. Configure conversation summarization for longer sessions
   ```json
   {
     "rooCode.conversationManagement.autoSummarize": true,
     "rooCode.conversationManagement.summarizationThreshold": 0.8
   }
   ```

### Project Context Errors

**Symptoms**:
- AI references outdated files or code that has been changed
- Confusion about project structure after significant changes
- Incorrect imports or references to refactored components

**Solutions**:
1. Use "Roo Code: Update Project Context" after significant changes
2. Configure automatic context updates:
   ```json
   {
     "rooCode.projectContext.autoUpdate": true,
     "rooCode.projectContext.updateTriggers": ["gitCommit", "save", "editorFocus"]
   }
   ```
3. Manually highlight important structural changes:
   ```
   I've refactored the authentication module. Previously, we had auth.py but now we have:
   - auth/
     - jwt.py
     - oauth.py
     - password.py
   ```
4. Reset project context completely using "Roo Code: Reset Project Context" if necessary

## VS Code Integration Issues

### Extension Conflicts

**Symptoms**:
- Roo Code commands fail only when certain other extensions are enabled
- Features stop working after installing another extension
- Performance degradation when multiple AI extensions are active

**Solutions**:
1. Temporarily disable other AI coding extensions to isolate conflicts
2. Check the VS Code "Output" panel for extension error messages
3. Configure priority between Roo Code and GitHub Copilot:
   ```json
   {
     "rooCode.gitHubCopilot.priority": "rooCode"
   }
   ```
4. Update all extensions to their latest versions

### Performance Issues

**Symptoms**:
- VS Code becomes sluggish when using Roo Code
- High CPU or memory usage
- Delayed responses or UI freezing

**Solutions**:
1. Reduce the number of files included in project context
   ```json
   {
     "rooCode.projectContext.maxFiles": 25,
     "rooCode.projectContext.excludePatterns": [
       "node_modules/**",
       "dist/**",
       ".git/**"
     ]
   }
   ```
2. Enable lazy loading and performance optimizations
   ```json
   {
     "rooCode.performance.lazyLoading": true,
     "rooCode.performance.cacheResponses": true,
     "rooCode.performance.responseCacheSize": 50
   }
   ```
3. Restart VS Code after long sessions
4. Check for memory leaks using the VS Code Process Explorer

### Command Not Found Issues

**Symptoms**:
- "Command not found" errors when trying to use Roo Code commands
- Commands disappear from Command Palette
- Features described in documentation are missing

**Solutions**:
1. Verify that Roo Code is properly installed and enabled
2. Check the Extensions panel for any warnings or errors
3. Try reloading the VS Code window (Ctrl+R or Cmd+R on Mac)
4. Reinstall the extension if necessary
5. Ensure you're using a compatible VS Code version (1.85.0+)

## Model-Specific Issues

### Gemini 2.5 Pro Issues

**Symptoms**:
- Context window not handling as much data as expected
- Specific error messages related to Gemini API
- Inconsistent response quality or formatting

**Solutions**:
1. Ensure you're using the correct API version
   ```json
   {
     "rooCode.models.gemini-2.5-pro.apiVersion": "v1"
   }
   ```
2. Check Google Cloud billing status if using Google Cloud API
3. Try adjusting model parameters
   ```json
   {
     "rooCode.models.gemini-2.5-pro.temperature": 0.7,
     "rooCode.models.gemini-2.5-pro.topP": 0.95
   }
   ```
4. Use "Roo Code: Diagnose Model Connection" to test Gemini connectivity

### Claude 3.7 Sonnet Issues

**Symptoms**:
- Thinking mode not engaging properly
- Context window limitations affecting response quality
- High token usage leading to quota issues

**Solutions**:
1. Verify thinking mode is properly configured
   ```json
   {
     "rooCode.models.claude-3.7-sonnet.thinking": true
   }
   ```
2. Adjust memory strategy for Claude's more limited context window
   ```json
   {
     "rooCode.models.claude-3.7-sonnet.memorySettings": {
       "summarizationThreshold": 0.7,
       "conversationHistoryLength": 20,
       "projectFilesLimit": 15
     }
   }
   ```
3. Monitor token usage with "Roo Code: Show Claude Usage"
4. For complex reasoning tasks, try using explicit step-by-step prompting

## GitHub Copilot Integration Issues

**Symptoms**:
- Roo Code and GitHub Copilot suggestions conflict
- One service overrides or blocks the other
- Inconsistent suggestion behavior

**Solutions**:
1. Configure integration priority
   ```json
   {
     "rooCode.gitHubCopilot.enabled": true,
     "rooCode.gitHubCopilot.priority": "alternating",
     "rooCode.gitHubCopilot.inlineSuggestions": true
   }
   ```
2. Set specific scenarios for each tool
   ```json
   {
     "rooCode.gitHubCopilot.useCasePriorities": {
       "inlineCompletion": "copilot",
       "contextualAssistance": "rooCode",
       "documentGeneration": "rooCode",
       "testing": "alternating"
     }
   }
   ```
3. Ensure both extensions are updated to their latest versions
4. Verify GitHub Copilot authentication is working

## Diagnostics and Logging

### Enabling Enhanced Logging

For detailed troubleshooting:

1. Enable debug logging in settings:
   ```json
   {
     "rooCode.logging.level": "debug",
     "rooCode.logging.file": "~/.roocode/logs/roocode.log",
     "rooCode.logging.console": true
   }
   ```

2. Run the diagnostics command:
   - Open Command Palette
   - Run "Roo Code: Run Diagnostics"
   - Save the diagnostic report when prompted

3. Check the VS Code "Output" panel:
   - Select "Roo Code" from the dropdown
   - Look for error messages or warnings

### Collecting Diagnostic Data

If you need to report an issue:

1. Enable logging as described above
2. Reproduce the issue
3. Run "Roo Code: Generate Diagnostic Report"
4. The report will be saved (with API keys redacted)
5. Include this report when filing issues

## Getting Additional Help

If you're still experiencing issues:

1. Check the [Roo Code GitHub repository](https://github.com/RooVetGit/Roo-Code) for known issues
2. Join the [Roo Code Discord community](https://discord.gg/roocode) for real-time help
3. Review the [official documentation](https://roocode.dev/docs)
4. Submit a detailed bug report with:
   - VS Code version
   - Roo Code version
   - Diagnostic report
   - Steps to reproduce
   - What you expected vs. what happened

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| RC-AUTH-001 | API key authentication failed | Verify API key is correct and has necessary permissions |
| RC-RATE-001 | Rate limit exceeded | Enable auto-retry or pace your requests |
| RC-CONN-001 | Connection failure | Check network connectivity and firewall settings |
| RC-MEM-001 | Memory bank access error | Verify memory bank path exists and is writable |
| RC-CONT-001 | Context initialization failure | Run "Roo Code: Reset Project Context" |
| RC-MOD-001 | Model not available | Switch to an alternative model or check service status |
| RC-VS-001 | VS Code integration error | Restart VS Code or reinstall the extension |
| RC-API-001 | Provider API error | Check provider status page for service issues |

---

*If you encounter persistent issues not covered by this guide, please report them through our [issue tracker](https://github.com/RooVetGit/Roo-Code/issues) with detailed reproduction steps.*
