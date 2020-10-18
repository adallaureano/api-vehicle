class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :update, :destroy]
    
    #GET/vehicles
    def index
        @vehicle = Vehicle.all
    end

    #GET/vehicles/1
    def show
        #@vehicle = Vehicle.find(params[:id])
    end

    #POST/vehicles
    def create
        @vehicle = Vehicle.new(vehicle_params)
        if @vehicle.save
            render :show, status: :created, location: @vehicle                
        else
            render json: @vehicle.errors, status: :unprocessable_entity
        end
    end

    #PUT/vehicles/1
    def update
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.update_attributes(vehicle_params)
            render :show, status: :ok, location: @vehicle  
        else
            render json: @vehicle.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.delete
            render :show, status: :ok, location: @vehicle  
        else
            render json: @vehicle.errors, status: :unprocessable_entity
        end
    end


    private 
    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:marca, :veiculo, :descricao, :ano)
    end
end
