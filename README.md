# ArmA 3 Mod Template

This repository provides a template for creating and organizing an ArmA 3 mod project.

## About

This template is designed to help you quickly start developing your own ArmA 3 mods by providing a well-organized project structure, example configuration files, and clear documentation.
It aims to simplify setup, encourage best practices, and save time for both new and experienced modders.

You are encouraged to customize any part of the template to fit your project's needs.

## Getting Started

1. Click on `Use this template` (green button top right).
2. Run any of the `setup` scripts, you may need to install powershell.
3. Once setup has successfully ran you can delete the `setup`, `convertToLFS`, and `enableWorkflows` script files as you will nolonger need them.
4. Choose a license for your project (see `LICENSE.md`).
5. Update `.hemtt/presets/main.html` with your modlist.
6. Edit `.hemtt/project.toml` with your project details.
7. Fix the prefix for the core addon.
8. Review and adjust the documentation in `meta/doc/*` to fit your workflow.
9. Update this README to reflect your project.

## Requirements

- [PowerShell](https://github.com/PowerShell/PowerShell/releases/latest) required for running the setup and build scripts on all platforms
- [HEMTT](https://github.com/BrettMayson/HEMTT/releases/latest) required for building and testing
- [ArmA 3 Tools](https://store.steampowered.com/app/233800/Arma_3_Tools/) optional but recommended, used for uploading the mod to the workshop, also used by HEMTT for advanced checking I believe
- [Visual Sudio Code](https://code.visualstudio.com/) config editing, you may use codium or any other editor just be aware that getting the addons may be harder
- [Hemtt addon for VSCode](https://marketplace.visualstudio.com/items?itemName=BrettMayson.hemtt) adds several nice to have features to VSCode which makes config editing easier and doubles as a PAA viewer
- [EditorConfig for VSCode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) makes maintaining a code style partly automatic

## License

This template is licensed under [CC0 1.0 Universal](LICENSE.md).





