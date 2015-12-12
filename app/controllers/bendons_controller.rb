class BendonsController < ApplicationController
		def index
		@bendons=Bendon.all

		respond_to do |format|
			format.html
			format.xml{
				render :xml=>@bendons.to_xml
			}
			format.json{
				render :json=>@bendons.to_json
			}
			format.atom{
				@feed_title="My bendon list"
			}
		end
	end

	def show
		@bendon=Bendon.find(params[:id])
		@page_title=@bendon.store
		respond_to do |format|
			    format.html { @page_title = @bendon.store } # show.html.erb
   			 	format.xml # show.xml.builder
    			format.json { render :json => { id: @bendon.id, store: @bendon.store,created_at: @event_created_at}.to_json }
 		 end
		
	end

	def new
		@bendon=Bendon.new
	end


	def create
		@bendon=Bendon.new(bendon_params)

		if @bendon.save
			redirect_to bendons_path
		else
			render bendons_path
		end
	end

	def edit
		@bendon=Bendon.find(params[:id])
	end

	def update
		@bendon=Bendon.find(params[:id])
		@bendon.update(bendon_params)
		redirect_to bendon_path(@bendon)		
	end

		def destroy
		@bendon=Bendon.find(params[:id])
		@bendon.destroy
		redirect_to bendons_path
	end

private
	def bendon_params
		params.require(:bendon).permit(:store,:address,:phone_number)
	end



end
