require "English"
require "git_tracker/repository"

module GitTracker
  module Branch
    def self.story_number
      branch = `git symbolic-ref --short HEAD`
      description = `git config --get branch.#{branch.strip}.description`
      Repository.ensure_exists unless exit_successful?
      description.strip
    end

    def self.exit_successful?
      $CHILD_STATUS.exitstatus == 0
    end

    private_class_method :exit_successful?
  end
end
