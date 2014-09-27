class ItemsController < ApplicationController
    
    def index
    end

    def search
        #logger.info "*********************** #{params.inspect}"
        #redirect_to root_path
        #@hash = JSON.load(open("http://api.target.com/v2/products/11678018?idType=TCIN&key=J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF"))

        
        @hash = JSON.load(open("https://api.target.com/v2/products/search?searchTerm=#{params[:Search]}&key=J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF"))
        #logger.info "*********************** #{@hash["CatalogEntryView"][0]["CustomerReview"][0]["Reviews"]}"
        @products_info = Array.new
        @reviews = Array.new
        logger.info("******* #{@hash}")
        @hash["CatalogEntryView"].each do |product| 
            product["ItemAttributes"].each do |product_attributes|
                @products_info << product["Attribute"]
            end
        end
        #logger.info "******************* #{@reviews.inspect}"
        logger.info "******************* #{@products_info.inspect}"

    end
    
    def new
        @item = Item.find(params[:id])
    end

    def create
        @item = Item.create(item_params)
        if @item.save
            flash[:success] = "Your item was successfully created."
            redirect_to @item
        else
            flash[:error] = @item.errors.full_messages.to_sentence
        end
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update_attributes(item_params)
            flash[:success] = "Item #{item.name} was successfully created."
            redirect_to @item
        else
            flash[:error] = "There was an error updating #{item.name}."
        end
    end
    
    def destroy
    end

    private

    def item_params
        params.require(:items).permit!
    end
end
