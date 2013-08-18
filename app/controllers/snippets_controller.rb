class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  # GET /snippets
  def index
    @snippets = Snippet.all
  end

  # GET /snippets/1
  def show
  end

  # GET /snippets/new
  def new
    @snippet = Snippet.new
  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets
  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      redirect_to @snippet, notice: 'Snippet was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /snippets/1
  def update
    if @snippet.update(snippet_params)
      redirect_to @snippet, notice: 'Snippet was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /snippets/1
  def destroy
    @snippet.destroy
    redirect_to snippets_url, notice: 'Snippet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def snippet_params
      params.require(:snippet).permit(:parent_id, :title, :description, :code)
    end
end
