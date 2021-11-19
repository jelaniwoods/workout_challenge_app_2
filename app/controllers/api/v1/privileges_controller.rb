class Api::V1::PrivilegesController < Api::V1::GraphitiController
  def index
    privileges = PrivilegeResource.all(params)
    respond_with(privileges)
  end

  def show
    privilege = PrivilegeResource.find(params)
    respond_with(privilege)
  end

  def create
    privilege = PrivilegeResource.build(params)

    if privilege.save
      render jsonapi: privilege, status: :created
    else
      render jsonapi_errors: privilege
    end
  end

  def update
    privilege = PrivilegeResource.find(params)

    if privilege.update_attributes
      render jsonapi: privilege
    else
      render jsonapi_errors: privilege
    end
  end

  def destroy
    privilege = PrivilegeResource.find(params)

    if privilege.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: privilege
    end
  end
end
