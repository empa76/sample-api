class TargetGroupPrivateSerializer < TargetGroupSerializer
  attributes :secret_code
  has_one :panel_provider
end
