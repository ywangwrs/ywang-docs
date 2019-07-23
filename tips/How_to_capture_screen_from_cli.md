# How to Capture Screenshot of a Website with Command Line

## Reference

 - https://developers.google.com/web/updates/2017/04/headless-chrome
 - https://github.com/alpeware/chrome-headless-trunk

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
