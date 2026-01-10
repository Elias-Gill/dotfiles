#!/usr/bin/env bash

selected="$1"

dir="$(dirname -- "$selected")"
base="$(basename -- "$selected")"

mapfile -t images < <(
  find "$dir" -maxdepth 1 -type f \
    | grep -Ei '\.(jpg|jpeg|png|webp|gif|bmp)$' \
    | sed "s|^$dir/||" \
    | sort -V -f
)

start_index=1
for i in "${!images[@]}"; do
  if [[ "${images[$i]}" == "$base" ]]; then
    start_index=$((i + 1))
    break
  fi
done

args=()
for img in "${images[@]}"; do
  args+=("$dir/$img")
done

exec sxiv -n "$start_index" "${args[@]}"
