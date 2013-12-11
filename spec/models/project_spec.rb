require 'spec_helper'

describe Project do
  it "is valid with a project title" do
    project = Project.new(projtitle: "Mittens")
    expect(project).to be_valid
  end

  it "is not valid without a project title" do
    expect(Project.new(projtitle: nil)).to have(1).errors_on(:projtitle)
  end

end
