#!/bin/sh

TOGGL_USERNAME=$(cat ~/.secrets/toggl/username.txt)
TOGGL_PASSWORD=$(cat ~/.secrets/toggl/password.txt)

CURRENT_ENTRY=$(curl -s https://api.track.toggl.com/api/v9/me/time_entries/current \
        -H "Content-Type: application/json" \
        -u $TOGGL_USERNAME:$TOGGL_PASSWORD)

DESCRIPTION=$(echo $CURRENT_ENTRY | jq -r '.description')
PID=$(echo $CURRENT_ENTRY | jq -r '.pid')
WID=$(echo $CURRENT_ENTRY | jq -r '.workspace_id')

echo $DESCRIPTION
echo $PID
echo $WID
