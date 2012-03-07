require 'redmine'
require 'account_controller_patch'
require 'dispatcher'

Dispatcher.to_prepare do
  AccountController.send(:include, DisableLogoutOnLogin::AccountPatch)
end

Redmine::Plugin.register :redmine_disable_logout_on_login do
  name 'Disable Logout on Login'
  author '---'
  description 'Disable Logout on Login'
  version '0.0.1'
  author_url ''
end
