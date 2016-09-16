#Commands:
#  hubot abc - Returns the message 'xyz'
#
module.exports = (robot) ->
  robot.hear /(.*)の天気は/i, (msg) ->

    cityName  = msg.match[1]
    query = encodeURIComponent msg.match[1]

    key = process.env.WEATHER_API_KEY

    request = msg.http("http://api.openweathermap.org/data/2.5/forecast/weather?q=#{query}&APPID=#{key}")
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      switch json["list"][0]["weather"][0]["main"]
        when "Clear"
          weather = "晴れ"
        when "Clouds"
          weather = "くもり"
        when "Rain"
          weather = "雨"
        when "snow"
          weather = "雪"

      icon = json["list"][0]["weather"][0]["icon"]

      msg.reply "#{cityName}の天気は#{weather}にゃー \n http://openweathermap.org/img/w/#{icon}.png"
