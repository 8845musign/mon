module.exports = (robot) ->
  robot.router.post "/hubot/svn", (req, res) ->

    revision = req.body.revision
    username = req.body.username
    log = req.body.log

    robot.logger.info "Subversion revision #{revision} committed."

    room = sandbox
    message = "Subversion revision #{revision} committed."

    robot.messageRoom room, message

    res.send 'OK'