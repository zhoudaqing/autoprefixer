fs   = require('fs')
exec = require('child_process').exec

module.exports = (css, callback) ->
  path = __dirname + '/rework/processor'
  file = __dirname + '/test.css'
  fs.writeFileSync(file, css)

  start = new Date()
  exec "#{path}", (error, stdout, stderr) ->
    now = new Date()

    process.stderr.write(stderr)
    process.exit(1) if error

    fs.unlinkSync(file)
    callback(now - start)
