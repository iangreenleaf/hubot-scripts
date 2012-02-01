# Github API helpers
#
# This script doesn't add anything to Hubot by itself. It can be used by other
# scripts wishing to use the Github API.

module.exports = (robot) ->
  robot.github = {
    qualified_repo: (repo) ->
      repo = repo.toLowerCase()
      return repo unless repo.indexOf("/") is -1
      unless (user = process.env.HUBOT_GITHUB_USER)?
        robot.logger.error "Default Github user not specified"
        return repo
      "#{user}/#{repo}"
  }
