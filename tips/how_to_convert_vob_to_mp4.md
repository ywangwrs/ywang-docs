# How to Convert VOB to MP4

## Reference

https://ubuntuforums.org/showthread.php?t=2377242

## Steps

1. Install mediainfo
    ```bash
    sudo apt-get install mediainfo
    ```

2. Install ffmpeg

    ```bash
    sudo apt-get install ffmpeg
    ```

3. Convert VOB to MP4

    ```bash
     for f in *.VOB ; do ffmpeg -i "$f" -b:v 3000k -strict -2 -b:a 128k "${f%.*.VOB}.mp4"; done
    ```
