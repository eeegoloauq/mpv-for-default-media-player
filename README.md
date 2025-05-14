# MPV for Default Media Player (Windows) ✨

Make [MPV](https://mpv.io/) your default application for videos, audio, and images on Windows with these simple batch scripts. This project enhances an [original concept](https://github.com/rossy/mpv-install) by providing:

*   Full support for **image file associations** (JPEG, PNG, HEIC, GIF, WebP, etc.).
*   Robust installation and uninstallation scripts.
*   Clear instructions.

## 🔧 Prerequisites

1.  **MPV Player:** `mpv.exe` is required. Get official nightly builds from [mpv-player/mpv builds](https://nightly.link/mpv-player/mpv/workflows/build/master) or check [mpv.io/installation](https://mpv.io/installation/) for other sources.
2.  **Windows:** Vista or later.
3.  **Administrator Privileges:** Scripts modify the system registry and need admin rights.

## 🛠️ How to Use

**Important:** Back up your registry or test in a VM if unsure. Scripts are provided as-is.

### 1. Install Associations

1.  **Download:**
    *   `mpv.exe` (if you don't have it).
    *   `mpv-install.bat` from this repository.
    *   (Optional) `mpv-document.ico` for custom file icons.
2.  **Placement:** Put `mpv-install.bat` (and `mpv-document.ico` if using) in the **same folder** as `mpv.exe`:
    ```
    your-mpv-folder/
    ├── mpv.exe
    ├── mpv-install.bat
    └── mpv-document.ico  (optional)
    ```
3.  **Run as Administrator:**
    *   Right-click `mpv-install.bat` ➔ "Run as administrator".
    *   Approve UAC prompts.
4.  **Done!** MPV is now associated with media files.

    💡 **Tip:** Fine-tune associations in `Settings > Apps > Default apps > Choose default apps by file type`.

### 2. Uninstall Associations

1.  **Download:**
    *   `mpv-uninstall.bat` from this repository.
2.  **Placement:** Place `mpv-uninstall.bat` in the same folder as `mpv.exe`.
3.  **Run as Administrator:**
    *   Right-click `mpv-uninstall.bat` ➔ "Run as administrator".
    *   Approve UAC prompts.
4.  **Done!** Associations are removed.

    ❗ **Note:** A restart of Explorer or Windows (log off/on) may be needed for all changes to apply/revert.

## 🖼️ Image Viewing with MPV

MPV can open images for quick previews, but it's primarily a video/audio player. For advanced image tasks, use dedicated image software.

## 📂 Script Actions (Simplified)

*   **`mpv-install.bat`:**
    *   Registers `mpv.exe` in `App Paths`.
    *   Adds MPV to `Applications` registry key (for "Open with...").
    *   Adds MPV to `OpenWithList` for video, audio, and image file types.
    *   Sets up DVD/Blu-ray AutoPlay.
    *   Registers MPV for "Default Apps" control panel.
    *   Creates `ProgID` entries (e.g., `io.mpv.mkv`, `io.mpv.jpg`) for many extensions (video, audio, images like `.mkv, .mp4, .jpg, .png, .heic`, etc.) and links them to MPV.
*   **`mpv-uninstall.bat`:** Reverses these changes.

## 🤝 Contributing

Found a bug or have an improvement?
*   Open an Issue.
*   Fork and submit a Pull Request.
    *   Ensure `uninstall` script reflects any `install` script changes.

## 📜 License

This project is distributed under the **MIT License**. See the `LICENSE` file for more details.

*(**Action for you:** Create a file named `LICENSE` in the root of your repository and paste the MIT License text into it. You can find the MIT License text easily online, e.g., on [choosealicense.com](https://choosealicense.com/licenses/mit/))*

---

Enjoy MPV as your all-in-one media player on Windows!
