# How to Capture Screenshot of a Website with Command Line

## Reference

 - https://developers.google.com/web/updates/2017/04/headless-chrome
 - https://github.com/alpeware/chrome-headless-trunk
 - https://tecadmin.net/capture-screenshot-google-chrome-headless/
 - https://askubuntu.com/questions/631689/cropping-images-using-command-line-tools-only

## Steps to Capture Screenshot of a Website

1. Start alpeware/chrome-headless-trunk docker
    ```bash
    docker run -it -d --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk
    ```

2. Capture a screenshot of Google.Com

    ```bash
    docker exec chrome-headless /chrome-linux/chrome --headless --disable-gpu --no-sandbox --window-size=1020,1680 --screenshot http://www.google.com
    ```

3. Check generated image

    ```bash
     docker exec chrome-headless ls -la /chrome-linux/screenshot.png
    ```

## Crop an image from command line

1. Install imagemagick

    ```bash
     sudo apt-get install imagemagick
    ```
    
2. Get picture info

    ```bash
     $ identify image.jpg 
     image.jpg JPEG 720x482 720x482+0+0 8-bit DirectClass 100KB 0.000u 0:00.009
    ```
    
3. Now back to the image image.jpg above, I want to crop:

 - top 5px
 - bottom 7px
 - right 14px
 - left 3px
 
4. then you could do it with (widthxheight+left+top / wxh+l+t format):

    ```bash
     $ convert image.jpg -crop 703x470+3+5 output.jpg 
    ```
