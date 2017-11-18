# gen_music_list
generate music list html,  use audiojs mp3 player 

music player : [audio.js](https://github.com/kolber/audiojs)

为web服务器下指定目录下的mp3文件生成在线播放列表

## var

web path:  http://music.xxx.com/gen_music_list/

local path: /var/www/html/gen_music_list/

mp3 directory: /var/www/html/gen_music_list/data/

## usage

perl gen_music_list.pl [music_path] [filename]

generate http://music.xxx.com/gen_music_list/index.html

    $ cd /var/www/html/gen_music_list/
    $ perl gen_music_list.pl data index.html

![music.png](music.png)
