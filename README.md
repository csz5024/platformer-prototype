# Platformer Prototype

A 2D platformer game built with Godot 4, featuring smooth movement, combat, and parallax backgrounds.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [1. Install Godot](#1-install-godot)
  - [2. Install Git & Git LFS](#2-install-git--git-lfs)
  - [3. Clone the Repository](#3-clone-the-repository)
  - [4. Open in Godot](#4-open-in-godot)
- [Project Structure](#project-structure)
- [Running the Game](#running-the-game)
- [Development Workflow](#development-workflow)
- [Contributing](#contributing)

---

## Prerequisites

| Requirement | Version | Download |
|-------------|---------|----------|
| Godot Engine | 4.x | [godotengine.org](https://godotengine.org/download) |
| Git | 2.x+ | [git-scm.com](https://git-scm.com/downloads) |
| Git LFS | 3.x+ | [git-lfs.com](https://git-lfs.com/) |

---

## Installation

### 1. Install Godot

**macOS (Homebrew):**
```bash
brew install --cask godot
```

**macOS (Manual):**
1. Download from [godotengine.org](https://godotengine.org/download)
2. Drag `Godot.app` to your Applications folder

**Windows:**
1. Download the installer from [godotengine.org](https://godotengine.org/download)
2. Run the installer or extract the portable version

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install godot

# Or download from godotengine.org
```

### 2. Install Git & Git LFS

**macOS:**
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Git and Git LFS
brew install git git-lfs

# Initialize Git LFS globally
git lfs install
```

**Windows:**
1. Download Git from [git-scm.com](https://git-scm.com/download/win) (includes Git LFS option)
2. During installation, select "Git LFS" component
3. Open Git Bash and run:
   ```bash
   git lfs install
   ```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install git git-lfs
git lfs install

# Fedora
sudo dnf install git git-lfs
git lfs install
```

### 3. Clone the Repository

```bash
# Clone the repository
git clone https://github.com/csz5024/platformer-prototype.git

# Navigate into the project directory
cd platformer-prototype

# Initialize Git LFS for this repo (if not done globally)
git lfs install

# Pull all LFS assets (images, audio, etc.)
git lfs pull
```

**Verify LFS is working:**
```bash
git lfs ls-files
```
You should see a list of tracked files (`.png`, `.wav`, etc.).

### 4. Open in Godot

1. Launch Godot Engine
2. Click **Import** (not "New Project")
3. Navigate to `platformer-prototype/`
4. Select `project.godot`
5. Click **Import & Edit**

Godot will import all assets on first load (may take a minute).

---

## Project Structure

```
platformer-prototype/
├── assets/
│   ├── sprites/          # Character, tileset, and background images
│   └── audio/            # Sound effects and music (if any)
├── scenes/
│   ├── player.tscn       # Player character scene
│   ├── killzone.tscn     # Death zone trigger
│   └── LandscapeBG.tscn  # Parallax background
├── scripts/
│   ├── player.gd         # Player movement and combat
│   ├── background.gd     # Background parallax logic
│   ├── cloud.gd          # Cloud layer parallax
│   └── killzone.gd       # Death zone logic
├── resources/            # Shared resources (materials, etc.)
├── .gitignore            # Git ignore rules
├── .gitattributes        # Git LFS tracking rules
├── project.godot         # Godot project file
└── README.md             # This file
```

---

## Running the Game

### From Godot Editor

1. Open the project in Godot
2. Press **F5** (or click the Play button)
3. If prompted, select the main scene

### Controls

| Action | Key |
|--------|-----|
| Move Left | A / Left Arrow |
| Move Right | D / Right Arrow |
| Jump | Space / W / Up Arrow |
| Attack 1 | Left Mouse Button |
| Attack 2 | Right Mouse Button |

---

## Development Workflow

### Daily Workflow

```bash
# 1. Pull latest changes before starting work
git pull

# 2. Make your changes in Godot

# 3. Stage all changes
git add -A

# 4. Commit with a descriptive message
git commit -m "Add double jump ability"

# 5. Push to remote
git push
```

### Best Practices

- **Communicate** about which scenes you're editing to avoid merge conflicts
- **Commit often** with small, focused changes
- **Pull before pushing** to stay in sync
- **Use branches** for larger features:
  ```bash
  git checkout -b feature/new-enemy
  # ... make changes ...
  git push -u origin feature/new-enemy
  # Create a Pull Request on GitHub
  ```

### Handling Merge Conflicts in Scene Files

If you get conflicts in `.tscn` files:
1. Communicate with your teammate about who has the correct version
2. Usually easiest to accept one version entirely and re-apply the other changes manually
3. Or use Godot's built-in scene merging (experimental)

---

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## Troubleshooting

### Assets appear as placeholders or missing
```bash
git lfs pull
```
Then reimport in Godot: **Project → Reload Current Project**

### "Git LFS not installed" error
```bash
git lfs install
git lfs pull
```

### Godot says "Scene file is corrupted"
Pull latest changes and ensure LFS assets are downloaded:
```bash
git pull
git lfs pull
```

### Game runs slowly in editor
- Go to **Editor → Editor Settings → Interface → Editor → Low Processor Mode** → Enable
- Or test by running the exported game instead of in-editor

---

## License

[Add your license here]

---

## Acknowledgments

- Godot Engine - [godotengine.org](https://godotengine.org)
- Asset packs used: [List any asset packs/credits here]
