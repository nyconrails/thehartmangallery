class Admin::CollectionsController < Admin::ApplicationController
  inherit_resources
  protect_from_forgery

  def create
    create!{ admin_collections_path }
  end

  def update
    update!{ admin_collections_path }
  end

end
