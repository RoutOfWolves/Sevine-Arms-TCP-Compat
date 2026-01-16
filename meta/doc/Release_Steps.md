# Release Steps
These instructions are for senior developers. If you are not a senior developer, you can safely ignore this page.

## The Actual Release Steps
- Make a new branch.
- Run the `prepRelease.ps1` script and follow onscreen instructions.
- Commit and push any changes.
- Create a PR and add the release tag (label on the right side of the code view on the GitHub website).
- After all checks pass, merge the PR.
- Checkout the `main` branch and pull the latest changes.
- Run the `release.ps1` script.
- Upload the release build to Steam Workshop, updating the changelog there too.
- Post the changelog to the designated Discord channel.
