class VoteController < ApplicationController
  before_filter :authenticate_user!

end