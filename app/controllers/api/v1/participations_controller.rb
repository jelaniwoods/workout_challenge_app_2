class Api::V1::ParticipationsController < Api::V1::GraphitiController
  def index
    participations = ParticipationResource.all(params)
    respond_with(participations)
  end

  def show
    participation = ParticipationResource.find(params)
    respond_with(participation)
  end

  def create
    participation = ParticipationResource.build(params)

    if participation.save
      render jsonapi: participation, status: :created
    else
      render jsonapi_errors: participation
    end
  end

  def update
    participation = ParticipationResource.find(params)

    if participation.update_attributes
      render jsonapi: participation
    else
      render jsonapi_errors: participation
    end
  end

  def destroy
    participation = ParticipationResource.find(params)

    if participation.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: participation
    end
  end
end
