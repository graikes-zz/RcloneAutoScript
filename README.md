# RcloneAutoScript
Simple script to aid in the automatic upload\download using rclone. Ensure rclone has been configured, the script is made executable and the relevant variables configured

This could be used via cron to ensure a local or remote dir is kept in sync. It's particularly useful for this as the script will check if it's already running and not initiate another transfer if one is in currently in progress.

You'll need rclone installed and configured before using this script. You can place it anywhere you desire, just make sure it's executable and the paths you define for logs and PIDs are accessible\writeable
