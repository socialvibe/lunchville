require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "submit_proposals" do
    @expected.subject = 'Notifications#submit_proposals'
    @expected.body    = read_fixture('submit_proposals')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_submit_proposals(@expected.date).encoded
  end

  test "vote_on_proposals" do
    @expected.subject = 'Notifications#vote_on_proposals'
    @expected.body    = read_fixture('vote_on_proposals')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_vote_on_proposals(@expected.date).encoded
  end

  test "submit_orders" do
    @expected.subject = 'Notifications#submit_orders'
    @expected.body    = read_fixture('submit_orders')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_submit_orders(@expected.date).encoded
  end

end
