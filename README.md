# MPV for Default Media Player (Windows) ✨

Tired of Windows defaulting to other media players? Want the lightweight power and extensive format support of [MPV](https://mpv.io/) for **all** your media files, including videos, audio, AND images? This repository provides simple batch scripts to make MPV your go-to media application on Windows!

This is a fork of an [original concept](https://github.com/rossy/mpv-install) with significant enhancements, including:
*   Comprehensive support for **image file associations** (JPEG, PNG, HEIC, GIF, WebP, etc.).
*   Robust installation and uninstallation scripts.
*   Clearer instructions and community focus.

## 🚀 Features

*   **Easy Setup:** Just run a script! No complex manual registry edits.
*   **Video, Audio & Image Support:** Sets MPV as the default for a wide range of video, audio, and common image formats.
*   **"Open with..." Integration:** MPV will prominently appear in the "Open with..." context menu.
*   **Default Apps Integration:** Registers MPV so it can be managed via Windows "Default Apps" settings.
*   **AutoPlay Handlers:** Configures MPV to handle AutoPlay for DVDs and Blu-rays.
*   **Clean Uninstall:** A dedicated script to revert all changes cleanly.
*   **Portable MPV Friendly:** Designed to work with portable MPV installations.

## 🔧 Prerequisites

1.  **MPV Media Player:** You need to have `mpv.exe` downloaded. You can get the latest Windows builds from [first party builds](https://nightly.link/mpv-player/mpv/workflows/build/master) or other sources listed on [mpv.io](https://mpv.io/installation/).
2.  **Windows:** Windows Vista or later.
3.  **Administrator Privileges:** The scripts modify the system registry (HKLM) and require administrator rights to run.

## 🛠️ How to Use

**Important:** Always back up your registry before making significant changes, or test in a virtual machine if unsure. These scripts are provided as-is.

### 1. Installation

This will register MPV as the default handler for many media types and integrate it into Windows.

1.  **Download:**
    *   Download `mpv.exe` (if you haven't already).
    *   Download `mpv-install.bat` from this repository.
    *   (Optional but Recommended) Download `mpv-document.ico` if you want custom icons for associated files.
2.  **Placement:** Place `mpv-install.bat` (and `mpv-document.ico` if using) in the **same directory** as your `mpv.exe` file.
    ```
    your-mpv-folder/
    ├── mpv.exe
    ├── mpv-install.bat
    └── mpv-document.ico  (optional)
    ```
3.  **Run as Administrator:**
    *   Right-click on `mpv-install.bat`.
    *   Select "Run as administrator".
    *   Confirm any User Account Control (UAC) prompts.
4.  **Done!** The script will output its progress. MPV should now be associated with various media files.

    💡 **Tip:** After running the script, you can usually fine-tune associations further via Windows Settings: `Settings > Apps > Default apps > Choose default apps by file type`. MPV should now be an option there for supported file types.

### 2. Uninstallation

This will remove all registry entries and file associations made by the `mpv-install.bat` script.

1.  **Download:**
    *   Download `mpv-uninstall.bat` from this repository.
2.  **Placement:** Place `mpv-uninstall.bat` in the **same directory** as your `mpv.exe` file (it doesn't strictly need `mpv.exe` to run, but it's good practice to keep them together).
3.  **Run as Administrator:**
    *   Right-click on `mpv-uninstall.bat`.
    *   Select "Run as administrator".
    *   Confirm any User Account Control (UAC) prompts.
4.  **Done!** The script will remove the associations.

    ❗ **Note:** You might need to restart Windows Explorer or log off/on for all icon changes and default program settings to fully revert or apply.

## 🖼️ Image Viewing with MPV

While MPV can open and display images, its primary strength is as a video and audio player. For advanced image editing or management, dedicated image viewers/editors are recommended. However, for quick previews, MPV works fine!

## 📂 What the Scripts Do (Simplified)

The `mpv-install.bat` script performs several actions:

*   Registers `mpv.exe` in `App Paths` for easier system-wide access.
*   Adds MPV to the `Applications` registry key for "Open with..." context menu integration.
*   Adds MPV to the `OpenWithList` for `video`, `audio`, and `image` System File Associations.
*   Sets up AutoPlay handlers for DVDs and Blu-rays.
*   Registers MPV's capabilities so it appears in the "Default Programs" / "Default Apps" control panel.
*   Creates `ProgID` entries (e.g., `io.mpv.mkv`, `io.mpv.jpg`) for many file extensions and associates them with MPV.
    *   This includes a wide range of video, audio, and common image formats like `.mkv, .mp4, .avi, .flac, .mp3, .ogg, .jpg, .png, .gif, .webp, .heic, .bmp, .tiff` and many more.

The `mpv-uninstall.bat` script reverses these changes.

## 🤝 Contributing

Found a bug? Have an improvement? Feel free to:
*   Open an Issue to discuss the problem or suggestion.
*   Fork the repository and submit a Pull Request with your changes.

Please ensure any changes to the install script are also reflected in the uninstall script.

## 📜 License

This project is likely under a permissive license (e.g., MIT, Unlicense, or based on the original scripts' license if known). Please check the `LICENSE` file. If no license file is present, assume it's provided as-is for public use but without warranty.

---

Give these scripts a try and enjoy MPV as your all-in-one media powerhouse on Windows!
