require 'spec_helper'

describe "snippets/edit" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :parent_id => 1,
      :title => "MyString",
      :description => "MyText",
      :code => "MyText"
    ))
  end

  it "renders the edit snippet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", snippet_path(@snippet), "post" do
      assert_select "input#snippet_parent_id[name=?]", "snippet[parent_id]"
      assert_select "input#snippet_title[name=?]", "snippet[title]"
      assert_select "textarea#snippet_description[name=?]", "snippet[description]"
      assert_select "textarea#snippet_code[name=?]", "snippet[code]"
    end
  end
end
