## About

This is a simple script to combine two of a video file's audio tracks into one. It doesn't impact the video's quality.

To make things even more simple, it only prompts for an input/output video using file selectors. The rest is handled automatically.

This is a simple utility to rapidly "fix" videos with split audio tracks, such as those recorded by **ShadowPlay** or **OBS**.

To use this script, simply copy/paste the *"merge.ps1"* code below into a new file named *"merge.ps1"*, then launch it.

If you're not interested in a full script, the important bit is:

```ffmpeg -i "input_file" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "output_file"```