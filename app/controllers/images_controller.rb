class ImagesController < ApplicationController
    
    def create
        @image = Image.new(image_params)
        if @image.save
            render json: { message: "success", imageId: @image.id }, status: 200
        else
            render json: { error: @image.errors.full_messages.join(", ") }, status: 400
        end
    end

    def destroy
        @image = Image.find(params[:id])
        if @image.destroy
            render json: { message: "file deleted from server" }
        else
            render json: { message: @image.errors.full_messages.join(", ") }
        end
    end

    def list
        person = Person.find(params[:person_id])

        images = []
        Image.where(person_id: person.id).each do |image|
            new_image = {
                id: image.id,
                name: image.image_file_name,
                size: image.image_file_size,
                src: image.image(:thumb)
            }
            images.push(new_image)
        end
        render json: { images: images }
    end

    private
    def image_params
        params.require(:image).permit(:image,:person_id)
    end
end