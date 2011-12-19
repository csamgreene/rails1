
class Role

  ROLES = {
    'chris' =>  %w[ author ],
    'ezra' =>   %w[ author reviewer publisher ],
    'john' =>   %w[ reviewer ]
  }

  def self.by_user(uname)

    ROLES[uname]
  end
end

