# GitHub Pages Deployment

This guide explains how your Vibe Coder Handbook is automatically deployed to GitHub Pages, making it accessible as a beautiful, searchable website.

## How It Works

The handbook uses GitHub Actions to automatically build and deploy your documentation whenever changes are pushed to the main branch. The workflow:

1. Detects changes to the main branch
2. Sets up a build environment
3. Installs MkDocs and the Material theme
4. Builds a static website from your Markdown files
5. Deploys the site to GitHub Pages

## Accessing the Published Handbook

Once deployed, your handbook will be available at:

```
https://threatflux.github.io/Vibe_Coder_Handbook/
```

The site includes:
- Full navigation menu
- Search functionality
- Mobile-responsive design
- Code syntax highlighting
- Dark/light mode toggle

## Requirements for Successful Deployment

For the GitHub Pages deployment to work correctly:

1. The repository must be public or have GitHub Pages enabled for private repositories
2. GitHub Pages must be enabled in the repository settings
3. The source branch for GitHub Pages should be set to `gh-pages` (created automatically by the workflow)
4. The workflow needs appropriate permissions (already set in the workflow file)

## Setting Up GitHub Pages in Your Repository

1. Go to your repository on GitHub
2. Click on "Settings"
3. Scroll down to the "Pages" section in the sidebar
4. Under "Build and deployment", ensure:
   - Source is set to "Deploy from a branch"
   - Branch is set to "gh-pages" and "/(root)"
5. Click "Save"

## Customizing the Site

You can customize the site by editing the `mkdocs.yml` file in the root of your repository:

- Change the theme colors
- Modify the navigation structure
- Add or remove features
- Configure additional plugins

## Adding New Content

1. Add new Markdown files to the appropriate directories
2. Update the navigation structure in `mkdocs.yml` if needed
3. Push changes to the main branch
4. The GitHub Actions workflow will automatically deploy the updated site

## Troubleshooting

If your deployment fails:

1. Check the GitHub Actions workflow logs for errors
2. Ensure all required directories exist
3. Verify that your Markdown files are formatted correctly
4. Make sure the `mkdocs.yml` file is valid YAML

## Local Development

To preview the site locally before pushing changes:

1. Install MkDocs and the Material theme:
   ```bash
   pip install mkdocs mkdocs-material
   ```

2. Run the local development server:
   ```bash
   mkdocs serve
   ```

3. Open your browser to `http://127.0.0.1:8000/`

Changes you make to the Markdown files will be reflected in real-time.

## Advanced Configuration

For more advanced configuration options, refer to:

- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material for MkDocs Documentation](https://squidfunk.github.io/mkdocs-material/)

These resources provide detailed information on themes, plugins, extensions, and customization options.
