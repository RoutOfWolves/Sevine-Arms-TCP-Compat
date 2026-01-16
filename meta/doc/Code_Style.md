# Code Style
This is the code style that I like to use in my projects, feel free to adapt it to your preferences.

## Class Names
`PboName_FolderStructure_ItemName_Variants`

- Always start the class name with the PBO name, for example: `MyMod_ArmourStandard`.
- Then copy the folder structure to the config file, skipping `data`. Separate each folder with underscores `_`.
- Finally, name the new class, preferably with a significant part of its display name. If the name matches the folder, then don't add it. For example, `Beret_Beret` should be just `Beret`.
- If you need to add variants, add those at the end. Preferably use descriptive names for these, e.g. `UrbanBlue_WhiteVisor`. Multiple variants can be used, separated with underscores `_`. If you can't think of a meaningful name for the variants, then number them. Avoid initials (e.g., use `NoVisor` instead of `NV`), unless required for functionality (e.g. depolarised versions of helmets).
- Separate each element above with an underscore `_`. Do not separate words if they are part of the same element, e.g. `Urban_Blue` should be `UrbanBlue`.

The weapon part of a uniform is called `Uniform`, the vehicle part is called `Trooper` instead.

## External Classes
When a class from another mod is referenced, add a comment labeling what PBO it came from. This should be the internal mod name, which often matches the PBO name but not always. You can find the mod's name in its `config.cpp` file in the PBO.

You then need to add that internal mod name to your mod's `requiredAddons` entry in your `config.cpp`. This should also have a comment, this time with the Steam Workshop name of that mod (except for anything coming from Arma 3 itself, which should be labeled as `Vanilla`). If there is already an entry for that internal mod name in your `requiredAddons`, do not add a duplicate.

## Inheritance
Prefer inheriting from one of your own classes instead of inheriting from the same external class multiple times. For example, if you are making camo variants for a helmet, instead of inheriting from the external helmet class for each camo pattern, inherit from the external class once for one camo and then inherit from that camo's class for the rest of the camos. Convention is to have the urban camo be the one that inherits from the external class and acts as a base for the other camos.

### Definitions
Place definitions at the top of the config. Definitions are used to pull specific classes from another PBO and allow for inheritance. At a minimum, these should have a comment informing others of which PBO they are coming from. Additional information such as which config it is located in can be helpful as well but is not required.

### Colons
Colons `:` are how you inherit from other classes. This should be written as `class PBONAME_FolderStructure_ItemName_Variant : class InheritedClass`.

## Semicolons
Semicolons `;` should be placed after each closing curly brace `}` and at the end of any lines which are not a class declaration followed by `{};`, for example when writing a definition such as `class My_Definition;` or `author="your name";`.

## Indentation and Whitespace
If your editor is compatible with an EditorConfig file, then your editor will do this automatically on saving.

Indentation is to be done with tabs; check your editor settings as it may be using spaces even when you push the tab key.

Line endings are to be CRLF. Make sure to set Git to *not* convert CRLF to LF on commit.

The last line in the file should be blank.

No trailing whitespace at the end of a line.

## File Paths
Paths inside of the PBO are to be lowercase; the config should also use lowercase when pointing to files.

### Texture File / .paa Names
Texture file names should be lowercase with words separated by underscores `_`, and should not have information that can be gleaned from the folder structure.

