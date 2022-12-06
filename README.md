<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/etherealxx/audiotracksmerger">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Audio Tracks Merger</h3>

  <p align="center">
    Merges multiple audio tracks from a video into one. For Windows.
    <br />
    <!-- <a href="https://github.com/etherealxx/audiotracksmerger"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
<!--     <a href="https://github.com/etherealxx/audiotracksmerger">View Demo</a>  -->
<!--    · -->
    <a href="https://github.com/etherealxx/audiotracksmerger/issues">Report Bug</a>
    ·
    <a href="https://github.com/etherealxx/audiotracksmerger/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#made-with">Made With</a></li>
      </ul>
    </li>
    <li>
      <a href="#using-the-app/script">Using the App/Script</a>
      <ul>
        <li><a href="#prerequisites-(important!)">Prerequisites (Important!)</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Have you ever recorded with, say OBS, and using more than one audio tracks, but when you want to check the recording on your favorite video player, it can't play both tracks at once? <br />
Well this tool is here to help! It will merge all audio tracks in a video file into one, so you can play it directly from your video player. <br />
This tool was made because i was frustated that Premiere Pro sometimes decrease quality of the video, or making the video file size bigger, oh and also i just lazy to open Premiere just to convert a single video file y'know :). With this tool, it uses `ffmpeg` to merge the audio without decreasing the video quality. <br />
Sure you can just type the ffmpeg command in command prompt, but the goal of this project is for simplicity, and the ease of use for beginner.

![2022-12-06 17_06_01-C__WINDOWS_system32_cmd exe](https://user-images.githubusercontent.com/64251396/205886336-b8d71a34-9879-4b17-a483-8e4f4235cb48.jpg)

The code are inspired from [this gist](https://gist.github.com/shadowmoose/ae4df1e8617184c9f4fcf55382e9236b) by [shadowmoose](https://github.com/shadowmoose) <br />
(and actually the reason i made this repo is because his powershell script somehow doesn't work on my device :D) <br />
TL;DR the ffmpeg command is `ffmpeg -i "input_file" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "output_file"`

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Made With

* Windows Command Prompt
* [Notepad++](https://github.com/notepad-plus-plus/notepad-plus-plus)
* [Bat to Exe Converter](https://www.majorgeeks.com/files/details/bat_to_exe_converter.html)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Using the App/Script

Download the executable or the script [here](example.com)

### Prerequisites (Important!)

Before you can run the executable/script, you need to install ffmpeg first and set the environment path variable. Here's a great tutorial to do it: https://www.geeksforgeeks.org/how-to-install-ffmpeg-on-windows/

Or you can download ffmpeg [here](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.7z), extract it, and then copy `ffmpeg.exe` to the same directory as the executable/script.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

1. Run the executable/script (the one with the .exe/.bat file extension)
2. Locate the video you want to merge the audio tracks
3. Make sure the video chosen is correct, then press any key to do conversion (it will create a new file)
4. Wait for the process to complete
5. Check the directory of the source video, the merged video will be there with the name of (filename)_merged.mp4 (or other video extension)

![project audiomerger-gif-comp30](https://user-images.githubusercontent.com/64251396/205890753-5edc14b8-3e32-41c0-bca2-256dbbef7ce0.gif)

<!-- _For more examples, please refer to the [Documentation](https://example.com)_
 -->
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the GNU GPLv3 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

etherealxx - gwathon3@gmail.com

Project Link: [https://github.com/etherealxx/audiotracksmerger](https://github.com/etherealxx/audiotracksmerger)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Original powershell script by shadowmoose](https://gist.github.com/shadowmoose/ae4df1e8617184c9f4fcf55382e9236b)
* [Accelerator font for the logo](https://fontesk.com/accelerator-font/)
* [README.md Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
