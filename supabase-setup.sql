-- Run this once in Supabase Dashboard > SQL Editor.
create table if not exists public.work_log_snapshots (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.work_log_snapshots enable row level security;

drop policy if exists "Public backups can read work logs" on public.work_log_snapshots;
create policy "Public backups can read work logs"
  on public.work_log_snapshots for select
  using (true);

drop policy if exists "Users can create their own work log" on public.work_log_snapshots;
create policy "Users can create their own work log"
  on public.work_log_snapshots for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own work log" on public.work_log_snapshots;
create policy "Users can update their own work log"
  on public.work_log_snapshots for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create index if not exists work_log_snapshots_updated_at_idx
  on public.work_log_snapshots(updated_at desc);
