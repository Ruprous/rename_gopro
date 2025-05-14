# GoProファイル連番リネーマー（GH0 → プレフィックス_日付_連番）

GoProで撮影された動画ファイル（例：`GH0xxxx.MP4`）を、  
**更新日時（＝撮影時刻）順に並べて、`[プレフィックス]_YYYY-MM-DD_001.mp4` のようにリネームするツール**です。

---

## 🔧 主な機能 / Features

- フォルダ選択をGUIで行える（パス入力不要）
- ファイル名のプレフィックスを任意入力可能（例：`trip`, `tokyo2025`）
- 更新日時（LastWriteTime）でソートし、正しい撮影順で並び替え
- 出力形式：`[prefix]_YYYY-MM-DD_001.mp4`, `..._002.mp4`, ...
- 同一日付ごとに連番がリセットされる
- `.MP4` / `.mp4` の両方対応
- `.THM` / `.LRV` ファイルは自動削除（ログ出力あり）
- 実行ログをコンソールに出力（リネームと削除処理）
- インストール不要、Windowsでそのまま実行可能

---

## 🚀 使い方 / How to Use

1. このリポジトリから以下の2ファイルをダウンロード：
    - `rename_gopro.bat`
    - `rename_gopro.ps1`

2. 同じフォルダに置く

3. `rename_gopro.bat` をダブルクリックで実行

4. 最初に**ファイル名のプレフィックスを入力**

5. 次に、**リネーム対象のフォルダを選択**

6. 完了！ファイルは以下のように変換されます：

```
GH02030.MP4 → trip_2025-04-01_001.mp4
GH02031.MP4 → trip_2025-04-01_002.mp4
GH02045.MP4 → trip_2025-04-02_001.mp4
```

---

## 🛡 注意事項 / Notes

- 元のファイル名は上書きされます。**必要があれば事前にバックアップを取ってください。**
- リネーム対象は `.mp4`（大文字小文字問わず）かつ `GH0` で始まるファイルのみです。
- `.THM` / `.LRV` ファイルも削除されます。
- 撮影順で並び替えたい場合、"更新日時"（LastWriteTime）を基準にしています。
- Windows PowerShell（5.1以上）で動作確認済みです。

---

## 🌍 英語での概要（English Summary）

This is a simple renaming tool for GoPro video files (`GH0xxxx.MP4`) that:

- Renames files in shooting order (based on `LastWriteTime`)
- Lets you choose the prefix via input box
- Outputs files like `yourprefix_2025-04-04_001.mp4`
- Resets the serial number for each date
- Automatically deletes `.THM` and `.LRV` files (case-insensitive)
- Shows logs of all renamed and deleted files
- Fully GUI based, no terminal typing needed
- No install required (Windows only)

---

## 🧪 動作例 / Example

入力ファイル：

```
GH02030.MP4
GH02031.MP4
GH02032.MP4
GH02033.MP4
```

プレフィックス：`geo`

変換後：

```
geo_2025-04-04_001.mp4
geo_2025-04-04_002.mp4
geo_2025-04-05_001.mp4
geo_2025-04-05_002.mp4
```

---

## 📄 ライセンス / License

MIT License — 改変・再配布・商用利用すべてOKです。
