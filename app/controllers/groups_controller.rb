class GroupsController < ApplicationController
  
  def index
  end

  #空のグループテーブルを呼出してインスタンスを生成し、
  #ローグインしているuser情報を取得し、
  def new 
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  #グループテーブルからgrouo idを１つ取り出す
  def edit
    @group = Group.find(params[:id])
  end

  #グループテーブルからgroup idを１つ取り出す。
  #ストロングパラメーターのデータを
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  #グループのパラメーターからnameとuseridを取り出している。
  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
