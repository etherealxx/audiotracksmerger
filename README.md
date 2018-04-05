## About

This is a simple script to combine two of a video file's audio tracks into one.

To make things even more simple, it prompts for an input/output video using file selectors.

This is a simple utility to rapidly "fix" videos with split audio tracks, such as those recorded by **ShadowPlay**.

To use this script, simply copy/paste the *"merge.ps1"* code below into a new file named "merge.ps1", then launch it.

If you're not interested in a full script, the important bit is:

```ffmpeg -i "input_file_path" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "output_file_path"```