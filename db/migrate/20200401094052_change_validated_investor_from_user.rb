class ChangeValidatedInvestorFromUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :validated_investor, nil
    change_column_default :users, :validated_developer, nil
  end
end
