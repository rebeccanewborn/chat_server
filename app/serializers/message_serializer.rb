class MessageSerializer < ActiveModel::Serializer
  attributes :content, :timestamp, :username
end
