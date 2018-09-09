from flask import Flask, request, abort, jsonify
from flask_cors import CORS

from furigana.furigana import split_furigana

app = Flask(__name__)
CORS(app)


def convert_text_to_furigana_html(text):
    for pair in split_furigana(text):
        if len(pair) == 2:
            kanji, hira = pair
            yield ("<ruby><rb>{0}</rb><rt>{1}</rt></ruby>".
                   format(kanji, hira))
        else:
            yield pair[0]
    yield ''


@app.route('/')
def hello_world():
    return ''.join(convert_text_to_furigana_html('お寿司を食べたい'))


@app.route('/furigana', methods=['POST', 'OPTIONS'])
def furigana():
    if request.method == 'OPTIONS':
        return jsonify({})
    if not request.json or not 'kanji' in request.json:
        abort(400)
    return jsonify({'furigana': ''.join(
        convert_text_to_furigana_html(request.json['kanji']))}), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
