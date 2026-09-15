# Daily Work Log

A colorful, local-first daily task tracker for one meaningful win and the smaller tasks around it.

## Use it

Open `index.html` in any modern browser. No install or server is required.

The hosted version is available at <https://atlaskeeper.github.io/work_log/>. On Android, open it in Chrome, open the browser menu, and choose **Add to Home screen** or **Install app**.

- Choose a date with the arrows or calendar.
- Add a main win or little task.
- Click task text to edit it directly.
- Tick a checkbox when the task is complete.
- Your daily percentage, completed-task count, and weekly count update automatically.
- Any unfinished task automatically appears on every following day until you complete it. Its original **Added** date stays visible, including when it is carried forward.

Changes are saved in that browser using `localStorage`. Use **Export backup** regularly to download a JSON backup. Use **Import** to restore it in another browser or computer.

The included service worker makes the installed app available offline after its first successful load.

## Automatic device sync

The app keeps a local offline copy and uses Supabase to synchronize it. Sign in from the **Device sync** card with the same email on Linux and Android. A sign-in link is emailed to you; no password is stored by this app.

Before the first sign-in:

1. Open the Supabase project's **SQL Editor** and run `supabase-setup.sql` once.
2. In **Authentication → URL Configuration**, set the Site URL to `https://atlaskeeper.github.io/work_log/` and add the same address to Redirect URLs.

The `Back up cloud work logs` GitHub Action exports portable JSON snapshots every six hours. Supabase remains the sync layer—not the only copy of the data.

Sync checks every 15 seconds when the page is visible and you are not editing text. Offline changes stay local until reconnecting. If both devices change their copies independently, sync pauses instead of overwriting either copy; export the local copy before resolving the conflict.

Existing tasks entered through a local file URL require a one-time Export from that page and Import into the hosted app before first sign-in. Browsers isolate local-file storage from website storage. Thereafter use the hosted URL on both devices with the same email.

Cloud rows and GitHub backups are publicly readable by design. Do not enter confidential information. Browser storage is not a permanent backup; keep downloaded exports too. Scheduled backups can be delayed or disabled by GitHub.

Backup files contain an array of account snapshots. To restore through the app's Import button, extract the desired account's `data` object into a JSON file.

The original September 15, 2026 entries are preloaded as completed tasks. The original `work log` text file is kept unchanged as a source record.
