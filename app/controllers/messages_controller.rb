class MessagesController < ApplicationController
  before_action :set_group

  def index
    # form_for に送る空のインスタンス
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end
  # メッセージを保存。
  # respond_toを使用してHTMLとJSONの場合で処理を分ける.
  # jsonの場合はjbuilderからjson形式に変換する。
  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
