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

The original September 15, 2026 entries are preloaded as completed tasks. The original `work log` text file is kept unchanged as a source record.
