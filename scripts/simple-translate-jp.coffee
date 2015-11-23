module.exports = (robot) ->
    robot.hear /eigo (.*)/i, (msg) ->
        word = msg.match[1]

        robot
            .http("https://translate.google.com/translate_a/single")
            .query({
                client: 't'
                hl: 'en'
                sl: 'ja'
                ssel: 0
                tl: 'en'
                tsel: 0
                q: word
                ie: 'UTF-8'
                oe: 'UTF-8'
                otf: 1
                dt: ['bd', 'ex', 'ld', 'md', 'qca', 'rw', 'rm', 'ss', 't', 'at']
            })
            .header('User-Agent', 'Mozilla/5.0')
            .get() (err, res, body) ->
                if err
                    msg.send "Failed to connect to GAPI"
                    robot.emit 'error', err, res
                    return
                try
                    if body.length > 4 and body[0] == '['
                        parsed = eval(body)
                        parsed = parsed[0] and parsed[0][0] and parsed[0][0][0]
                        parsed and= parsed.trim()
                        if parsed
                            msg.send "#{word} は英語で #{parsed} にゃ"
                    else
                        throw new SyntaxError 'Invalid JS code'
                catch err
                    msg.send "Failed to parse GAPI response"
                    robot.emit 'error', err

    robot.hear /nihongo (.*)/i, (msg) ->
        word = msg.match[1]

        robot
            .http("https://translate.google.com/translate_a/single")
            .query({
                client: 't'
                hl: 'en'
                sl: 'en'
                ssel: 0
                tl: 'ja'
                tsel: 0
                q: word
                ie: 'UTF-8'
                oe: 'UTF-8'
                otf: 1
                dt: ['bd', 'ex', 'ld', 'md', 'qca', 'rw', 'rm', 'ss', 't', 'at']
            })
            .header('User-Agent', 'Mozilla/5.0')
            .get() (err, res, body) ->
                if err
                    msg.send "Failed to connect to GAPI"
                    robot.emit 'error', err, res
                    return
                try
                    if body.length > 4 and body[0] == '['
                        parsed = eval(body)
                        parsed = parsed[0] and parsed[0][0] and parsed[0][0][0]
                        parsed and= parsed.trim()
                        if parsed
                            msg.send "#{word} は日本語で #{parsed} にゃ"
                    else
                        throw new SyntaxError 'Invalid JS code'
                catch err
                    msg.send "Failed to parse GAPI response"
                    robot.emit 'error', err