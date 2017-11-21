RSpec.describe ToDoList do
  it "belongs to a person" do
    expect(app.owner).not_to be nil
  end

  it "has no lists by default" do
    expect(app.lists).to be_blank
  end

  it "displays all expired items in a list" do
    expect(app.list("name").expired_items).to eq ["1-1-2017 - I'm expired", "2-1-2017 - Me too"]
  end

  it "displays all items in a list" do
    expect(app.list("name").all_items).to eq ["Item 1", "Item 2", "Item 3"]
  end

  it "displays all lists" do
    expect(app.lists).to eq({"List 1" => {}, "List 2" => {}})
  end

  it "can have a list added" do
    expect { app.add(list) }.to change(app.lists.size).by 1
  end

  it "can have a list removed" do
    expect { app.remove(list) }.to change(app.lists.size).by -1
  end
end
