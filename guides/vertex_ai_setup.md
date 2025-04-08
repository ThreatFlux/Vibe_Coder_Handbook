# Google Cloud Vertex AI Setup for Roo Code

This guide walks you through setting up Google Cloud Vertex AI for use with Roo Code, with special emphasis on the JSON credential configuration format.

## Overview

Google Cloud Vertex AI provides access to powerful AI models including Gemini 2.5 Pro (recommended) and others through Google's cloud infrastructure. Unlike some other AI services, Vertex AI uses service account authentication rather than simple API keys, requiring a specific setup process.

## Prerequisites

- A Google Cloud account
- A Google Cloud project with billing enabled
- Basic familiarity with Google Cloud Console

## Step 1: Create a Google Cloud Project

If you don't already have a Google Cloud project:

1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Click on "Select a project" at the top of the page
3. Click "New Project"
4. Enter a project name and click "Create"

## Step 2: Enable the Vertex AI API

1. In your Google Cloud project, navigate to the API Library
2. Search for "Vertex AI API" 
3. Click on "Vertex AI API" in the search results
4. Click "Enable"

## Step 3: Create a Service Account

1. In the Google Cloud Console, navigate to "IAM & Admin" > "Service accounts"
2. Click "Create Service Account"
3. Enter a name for your service account (e.g., "roo-code-vertex-ai")
4. Click "Create and Continue"
5. Assign the following roles:
   - "Vertex AI User" (roles/aiplatform.user)
   - "Vertex AI Service Agent" (roles/aiplatform.serviceAgent)
6. Click "Continue" and then "Done"

## Step 4: Create and Download Service Account Key

1. From the Service Accounts list, find the service account you just created
2. Click on the three dots (Options menu) at the end of the row
3. Select "Manage keys"
4. Click "Add Key" and select "Create new key"
5. Ensure the "JSON" key type is selected
6. Click "Create"

A JSON key file will be automatically downloaded to your computer. This file contains the credentials Roo Code needs to authenticate with Vertex AI.

## Step 5: Configure Roo Code with JSON Credentials

Unlike some other AI services that just need an API key pasted into a field, Roo Code requires the **entire JSON content** to be pasted into the configuration.

1. Open the downloaded JSON file in a text editor
2. Copy the **entire JSON content** (not the file path)
3. Open VS Code and access Roo Code's settings:
   - Click on the Roo Code icon in the VS Code sidebar
   - Click on the settings/gear icon
   - Select "Google Cloud Vertex AI" as the provider

4. In the credentials field, paste the entire JSON content:

```json
{
  "type": "service_account",
  "project_id": "your-project-id",
  "private_key_id": "your-private-key-id",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "your-service-account@your-project-id.iam.gserviceaccount.com",
  "client_id": "your-client-id",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-project-id.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
```

5. Enter your Google Cloud Project ID in the "Project ID" field
6. Select a region (usually "us-central1")
7. Choose a model (recommended: "gemini-2.5-pro")
8. Click "Save"

> **Important Note**: The configuration expects the **entire JSON content**, not a file path. This is a common point of confusion as the input field may suggest it wants a file path.

## Step 6: Verify the Connection

1. In VS Code, open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P on Mac)
2. Type "Roo Code: Test Connection" and press Enter
3. If successful, you'll see a confirmation message
4. If unsuccessful, check the error message and verify your configuration

## Troubleshooting

### Common Issues

1. **Authentication Error**: Ensure you've pasted the entire JSON content and not just the file path.

2. **Permission Denied**: Verify that your service account has the necessary permissions:
   - Vertex AI User (roles/aiplatform.user)
   - Vertex AI Service Agent (roles/aiplatform.serviceAgent)

3. **Invalid JSON Format**: Make sure the JSON is valid and complete. It should include all fields shown in the example above.

4. **Region or Model Not Available**: Some models are only available in certain regions. "us-central1" typically has the best model availability.

5. **Billing Not Enabled**: Ensure billing is enabled for your Google Cloud project.

### Example Service Account Key

Here's what the service account key JSON structure looks like (with fake values):

```json
{
  "type": "service_account",
  "project_id": "my-project-123456",
  "private_key_id": "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz\n-----END PRIVATE KEY-----\n",
  "client_email": "roo-code-service@my-project-123456.iam.gserviceaccount.com",
  "client_id": "123456789012345678901",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/roo-code-service%40my-project-123456.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
```

You must paste the entire JSON structure into the Roo Code configuration, not just individual values or a file path.

## Cost Management

Vertex AI access is billed based on usage. To manage costs:

1. Monitor your Vertex AI usage in the Google Cloud Console
2. Set up a budget alert in Google Cloud to notify you of spending
3. For testing, use smaller models or shorter prompts when possible
4. Vertex AI costs are typically lower than Claude for equivalent usage

## Next Steps

After configuring Roo Code with Google Cloud Vertex AI:

1. Explore [Model Selection](model_selection.md) to understand how to use Gemini 2.5 Pro effectively
2. Set up [Memory Management](memory_management.md) for better context retention
3. Learn about [VS Code Integration](vs_code_integration.md) features

---

For more detailed information about Vertex AI, refer to the [official Google Cloud Vertex AI documentation](https://cloud.google.com/vertex-ai/docs).
