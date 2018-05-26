class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:update, :basics, :description, :address, :price, :price, :photos, :calendar, :bankaccount, :publish]

  def index
  end

  def show
  end

  def new
    #リスティングの作成
    @person = current_user.people.build
  end

  def create
    # パラメーターとともに現在のユーザーのリスティングを作成
    @person = current_user.people.build(person_params)

    if @person.save
      redirect_to manage_person_basics_path(@person), notice: "リスティングを作成・保存をしました"
    else
      redirect_to new_person_path, notice: "リスティングを作成・保存できませんでした"
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to :back, notice: "更新できました"
    end
  end

  def basics
  end

  def description
  end

  def address
  end

  def price
  end

  def photos
    @image = Image.new
  end

  def calendar
  end

  def bankaccount
  end

  def publish
  end


  private
  def person_params
    params.require(:person).permit(:item_type, :shop_type, :shop_size, :price_type)
  end

  def set_person
    @person = Person.find(params[:id])
  end

end
