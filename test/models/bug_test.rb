require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @bug = Bug.create(title: "a title", description: "This is the bug
      descption.  It can be rather long.", issue_type: 0, priority: 2,
      status: 1)
  end

  test "bug must be valid" do
    assert @bug.valid?
  end

  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "issue_type must be valid" do
    invalid_issues = [-10, -1, 3, 10]
    invalid_issues.each do |ii|
      begin
        @bug.issue_type = ii
        assert false, "#{ii} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "issue_type must be in enum" do
    valid_issues = [:issue, :enhancement, :feature]
    valid_issues.each do |vi|
      begin
        @bug.issue_type = vi
        assert true
      rescue
        assert false, "#{vi} should be valid"
      end
    end
  end

  test "priority must be valid" do
    invalid_priorities = [-10, -1, 3, 10]
    invalid_priorities.each do |ip|
      begin
        @bug.priority = ip
        assert false, "#{ip} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "priority must be in enum" do
    valid_priorities = [:low, :medium, :high]
    valid_priorities.each do |vp|
      begin
        @bug.priority = vp
        assert true
      rescue
        assert false, "#{vp} should be valid"
      end
    end
  end

  test "status must be valid" do
    invalid_statuses = [-10, -1, 3, 10]
    invalid_statuses.each do |is|
      begin
        @bug.status = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must be in enum" do
    valid_statuses = [:open, :closed, :monitor]
    valid_statuses.each do |vs|
      begin
        @bug.status = vs
        assert true
      rescue
        assert false, "#{vs} should be valid"
      end
    end
  end
end
