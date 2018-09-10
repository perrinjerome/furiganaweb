
Micro service to transform kanji text to add furigana.

 お寿司を食べたい  becomes <span>
お<ruby><rb>寿司</rb><rt>すし</rt></ruby>を<ruby><rb>食</rb><rt>た</rt></ruby>べたい
<span>


# Credits

This is just a small wrapper on top of:

* https://github.com/MikimotoH/furigana/

which uses:

* http://taku910.github.io/mecab/
* https://pypi.org/project/mecab-python3/0.7/


# Example usage

```bash
curl -i -H "Content-Type: application/json" -X POST -d '{"kanji":"お寿司を食べたい"}' http://localhost:5000/furigana

HTTP/1.0 200 OK
Content-Type: application/json
Content-Length: 149
Access-Control-Allow-Origin: *
Server: Werkzeug/0.14.1 Python/3.5.3
Date: Sun, 09 Sep 2018 23:47:56 GMT

{
  "furigana": "\u304a<ruby><rb>\u5bff\u53f8</rb><rt>\u3059\u3057</rt></ruby>\u3092<ruby><rb>\u98df</rb><rt>\u305f</rt></ruby>\u3079\u305f\u3044"
}
```

# Using

This is live on [now.sh](https://zeit.co/now), at https://furiganaweb-umdhypwttw.now.sh and on usable like https://codepen.io/perrinjerome/full/BOJVwZ/
