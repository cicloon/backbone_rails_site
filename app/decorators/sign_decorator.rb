class SignDecorator < Draper::Decorator
  delegate_all


  def as_json(options = {})
    {
      body: h.escape_javascript(body),
      invitee_ids: invitees.map(&:id),
      invitee_names: invitees.map(&:name)
    }
  end




end