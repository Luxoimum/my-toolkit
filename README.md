# my-toolkit

`my-toolkit` is a single script to manage:

1. **Bazel Workspaces** (create, add, build):
   - Create a new Bazel workspace folder (installs Bazel if missing).
   - Add external GitHub repositories as local dependencies.
   - Build one or more packages in that workspace.

2. **Project Skeletons** for Kotlin (Gradle-based) or AWS CDK (TypeScript):
   - Generates minimal starter files (e.g., `build.gradle.kts` for Kotlin, `package.json` for CDK).
   - Includes a `BUILD.bazel` referencing Bazel rules that wrap the native build (Gradle, npm).
   - Initializes a local Git repo in the new skeleton.

---

## Installation

1. **Download or clone** this repository so you have the scripts `my-toolkit` and `install-my-toolkit.sh`.
2. **Run the installer**:
   ```bash
   chmod +x install-my-toolkit.sh
   ./install-my-toolkit.sh
