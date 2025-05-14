# GoPro File Sequential Renamer (GH → prefix_date_sequence)

This tool renames video files shot with GoPro (e.g., `GHxxxx.MP4`)  
**by sorting them in order of last modified time (= shooting time) and renaming them as `[prefix]_YYYY-MM-DD_001.mp4`.**

---

## 🔧 Main Features

- Select target folder via GUI (no need to input path)
- Enter any file name prefix (e.g., `trip`, `tokyo2025`)
- Sort files by last modified time (LastWriteTime) to ensure correct shooting order
- Output format: `[prefix]_YYYY-MM-DD_001.mp4`, `..._002.mp4`, ...
- Sequence number resets for each date
- Supports both `.MP4` and `.mp4`
- **Supports all files starting with `GH` followed by numbers (e.g., GH01, GH10, GH123, etc.)**
- Automatically deletes `.THM` / `.LRV` files (with log output)
- Outputs execution log to console (rename and delete operations)
- No installation required, can be run directly on Windows

---

## 🚀 How to Use

1. Download the following two files from this repository:
    - `rename_gopro.bat`
    - `rename_gopro.ps1`

2. Place them in the same folder

3. Double-click `rename_gopro.bat` to run

4. First, **enter the file name prefix**

5. Next, **select the folder to rename**

6. Done! Files will be renamed as follows:

```
GH10.MP4    → trip_2025-04-01_001.mp4
GH11.MP4    → trip_2025-04-01_002.mp4
GH123.MP4   → trip_2025-04-02_001.mp4
```

---

## 🛡 Notes

- Original file names will be overwritten. **Back up files in advance if necessary.**
- Only `.mp4` files (case-insensitive) starting with `GH` followed by numbers will be renamed.
- `.THM` / `.LRV` files will also be deleted.
- Sorting is based on "last modified time" (LastWriteTime) to arrange by shooting order.
- Tested on Windows PowerShell (5.1 or later).

---

## 🧪 Example

Input files:

```
GH10.MP4
GH11.MP4
GH123.MP4
GH124.MP4
```

Prefix: `geo`

After conversion:

```
geo_2025-04-04_001.mp4
geo_2025-04-04_002.mp4
geo_2025-04-05_001.mp4
geo_2025-04-05_002.mp4
```

---

## 📄 License

MIT License — Modification, redistribution, and commercial use are all permitted.
