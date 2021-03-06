Authority.configure do |config|

  # USER_METHOD
  # ===========
  # Authority needs the name of a method, available in any controller, which
  # will return the currently logged-in user. (If this varies by controller,
  # just create a common alias.)
  #
  # Default is:
  #
  config.user_method = :current_user_or_guest

  # CONTROLLER_ACTION_MAP
  # =====================
  # For a given controller method, what verb must a user be able to do?
  # For example, a user can access 'show' if they 'can_read' the resource.
  #
  # These can be modified on a per-controller basis; see README. This option
  # applies to all controllers.
  #
  # Defaults are as follows:
  #
  config.controller_action_map = {
     :index   => 'read',
     :show    => 'read',
     :new     => 'create',
     :create  => 'create',
     :edit    => 'update',
     :update  => 'update',
     :destroy => 'delete',

     #TODO: need refactoring
     :regenerate_api_key => 'update',
     :locate => 'read',
     :destroy_several => 'delete',
     :resolve_several => 'update',
     :unresolve_several => 'update',
     :merge_several => 'update',
     :unmerge_several => 'update',
     :search => 'read',
     :destroy_all => 'delete',
     :resolve => 'update',
     :unresolve => 'update',
     :create_issue => 'update',
     :unlink_issue => 'update',
  }

  # ABILITIES
  # =========
  # Teach Authority how to understand the verbs and adjectives in your system. Perhaps you
  # need {:microwave => 'microwavable'}. I'm not saying you do, of course. Stop looking at
  # me like that.
  #
  # Defaults are as follows:
  #
  # config.abilities =  {
  #   :create => 'creatable',
  #   :read   => 'readable',
  #   :update => 'updatable',
  #   :delete => 'deletable'
  # }

  # LOGGER
  # ======
  # If a user tries to perform an unauthorized action, where should we log that fact?
  # Provide a logger object which responds to `.warn(message)`, unless your
  # security_violation_handler calls a different method.
  #
  # Default is:
  #
  # config.logger = Logger.new(STDERR)
  #
  # Some possible settings:
  # config.logger = Rails.logger                     # Log with all your app's other messages
  # config.logger = Logger.new('log/authority.log')  # Use this file
  # config.logger = Logger.new('/dev/null')          # Don't log at all (on a Unix system)

  config.logger = Rails.logger
end
