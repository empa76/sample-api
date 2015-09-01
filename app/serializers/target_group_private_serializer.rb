class TargetGroupPrivateSerializer < TargetGroupSerializer
  attributes :secret_code, :external_id
  has_one :panel_provider
  has_many :children
end
