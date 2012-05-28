class Admin::ItemsController < Admin::ApplicationController
  inherit_resources
  protect_from_forgery
end
