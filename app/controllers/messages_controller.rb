class MessagesController < ApplicationController
  before_action :set_message,only:[:show,:edit,:update,:destroy]
  def index
    @messages = Message.order(id: :desc).page(params[:page]).per(5)
  end
  
  def show
    set_message
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message =  Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Messageが正常に投稿されました。'
      redirect_to @message
    else
      flash.now[:denger] = 'Messageが投稿されませんでした。'
      render :new
    end
  end
  
  def edit
    set_message
  end
  
  def update
    set_message
    
    if @message.update(message_params)
      flash[:success] = 'Messageが正常に投稿されました。'
      redirect_to @message
    else
      flash.now[:denger] = 'Messageが投稿されませんでした。'
      render :edit
    end
  end
  
  def destroy
    set_message
    @message.destroy
    
    flash[:success] = 'Messageは正常に削除されました。'
    redirect_to messages_url
  end
  
  private
  def set_message
    @message = Message.find(params[:id])
  end  
  
  def message_params
    params.require(:message).permit(:content,:title)
    #params.require(:message)でMessageモデルのフォームから得られるデータに関するものだと示す。
    #permit(:content)でcontentカラムだけを選択。
  end
  
end  
