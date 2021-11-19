class Api::V1::ChallengesController < Api::V1::GraphitiController
  def index
    challenges = ChallengeResource.all(params)
    respond_with(challenges)
  end

  def show
    challenge = ChallengeResource.find(params)
    respond_with(challenge)
  end

  def create
    challenge = ChallengeResource.build(params)

    if challenge.save
      render jsonapi: challenge, status: 201
    else
      render jsonapi_errors: challenge
    end
  end

  def update
    challenge = ChallengeResource.find(params)

    if challenge.update_attributes
      render jsonapi: challenge
    else
      render jsonapi_errors: challenge
    end
  end

  def destroy
    challenge = ChallengeResource.find(params)

    if challenge.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: challenge
    end
  end
end
