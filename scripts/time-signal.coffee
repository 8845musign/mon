cron = require('cron').CronJob

module.exports = (robot) ->
    new cron '30 9 * * 1-5', () =>
        robot.send {room: "#general"}, "始業時間が北にゃー、今日も1日がんばるぞい\(^o^)/", null, true

    new cron '0 12 * * 1-5', () =>
        robot.send {room: "#general"}, "エサの時間が北にゃー、一休み一休み( *｀ω´)", null, true

    new cron '30 17 * * 1-5', () =>
        robot.send {room: "#general"}, "定時ほー、仕事まとめるにゃー", null, true