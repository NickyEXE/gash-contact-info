class ScavviesController < ApplicationController

    def index
        @scavvies = Scavvie.all.sort_by{|scavvie| scavvie.name.downcase}
    end

    def show
        @scavvie = Scavvie.find(params[:id])
    end

end
