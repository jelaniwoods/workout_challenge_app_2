class Api::V1::PhotoworkoutsController < Api::V1::GraphitiController
  def index
    photoworkouts = PhotoworkoutResource.all(params)
    respond_with(photoworkouts)
  end

  def show
    photoworkout = PhotoworkoutResource.find(params)
    respond_with(photoworkout)
  end

  def create
    photoworkout = PhotoworkoutResource.build(params)

    if photoworkout.save
      render jsonapi: photoworkout, status: :created
    else
      render jsonapi_errors: photoworkout
    end
  end

  def update
    photoworkout = PhotoworkoutResource.find(params)

    if photoworkout.update_attributes
      render jsonapi: photoworkout
    else
      render jsonapi_errors: photoworkout
    end
  end

  def destroy
    photoworkout = PhotoworkoutResource.find(params)

    if photoworkout.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: photoworkout
    end
  end
end
