class StatesController < ApplicationController
    def index
        @dstates = CS.states(params[:dcountry])
        @pstates = CS.states(params[:pcountry])
        end
end
