#!/usr/bin/env bash

MONITOR_NAME="$1"

MONITOR_JSON=$(hyprctl monitors -j)

MONITOR_ID=$(echo "$MONITOR_JSON" | jq -r --arg name "$MONITOR_NAME" '
  .[] | select(.name == $name) | .id
')

ACTIVE_WORKSPACE_ID=$(echo "$MONITOR_JSON" | jq -r --arg name "$MONITOR_NAME" '
  .[] | select(.name == $name) | .activeWorkspace.id
')

layout=$(hyprctl workspaces -j | jq -r --argjson wid "$ACTIVE_WORKSPACE_ID" '.[] | select(.id == $wid) | .tiledLayout')

if [[ "$layout" != "monocle" ]]; then
  echo "{}"
  exit 0 
fi

hyprctl clients -j | jq -r -c \
  --argjson mid "$MONITOR_ID" \
  --argjson wid "$ACTIVE_WORKSPACE_ID" '
[
  .[]
  | select(.monitor == $mid)
  | select(.workspace.id == $wid)
  | select(.title != null and .title != "")
]
| (map(.focusHistoryID) | min) as $min
| {
    text: (
      map(
        (.title[0:30] + (if (.title | length) > 30 then "..." else "" end)) as $t
        | if .focusHistoryID == $min then
            "<span foreground=\"#b4befe\">" + $t + "</span>"
          else
            "<span>" + $t + "</span>"
          end
      )
      | join("  ")
    ),
    class: "monocle"
  }
'
