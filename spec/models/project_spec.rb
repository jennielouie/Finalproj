require 'spec_helper'

describe Project do
  it "is valid with a project title" do
    project = Project.new(projtitle: "Mittens", pattern: "pattern")
    expect(project).to be_valid
  end

  it "is not valid without a project title" do
    expect(Project.new(projtitle: nil, pattern: "pattern")).to have(1).errors_on(:projtitle)
  end

  it "is not valid without a pattern" do
    expect(Project.new(projtitle: "Title")).to have(1).errors_on(:pattern)
  end

end
