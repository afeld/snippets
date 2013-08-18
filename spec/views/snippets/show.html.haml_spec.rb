require 'spec_helper'

describe "snippets/show" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :parent_id => 1,
      :title => "Title",
      :description => "MyText",
      :code => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
