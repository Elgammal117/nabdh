---
name: create-readme
description: Analyze the project and generate a comprehensive, professional README.md. Use this skill when the user asks to create, update, or improve the project's README.
---

# Create README Skill

When invoked, your task is to generate a high-quality `README.md` file for the repository. 

Follow these steps:
1. **Analyze the Project**: Look at the main project files (e.g., `pubspec.yaml`, `package.json`, main entry points) to understand what the project does, what technologies it uses, and how it is structured.
2. **Draft the Content**: The README should include the following sections:
   - **Project Title**: A clear, concise title.
   - **Description**: A short paragraph explaining what the project is and what problem it solves.
   - **Features**: Bullet points highlighting the main functionality.
   - **Getting Started / Installation**: Step-by-step instructions on how to set up the project locally. Include prerequisites and commands.
   - **Usage**: Examples of how to use the application.
   - **Project Structure** (Optional): A brief overview of the directory structure if it's complex.
3. **Action**: Write the resulting content to the `README.md` file in the root directory. If a `README.md` already exists, you can either overwrite it (if requested) or propose the changes as a diff.

Be sure to tailor the instructions to the specific framework used in the project (e.g., for this Flutter project, include commands like `flutter pub get` and `flutter run`).
