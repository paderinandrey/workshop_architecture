# frozen_string_literal: true

class KarafkaTopicCreator
  def self.ensure_topics
    admin = Karafka::Admin

    topic_name = 'like_in'
    partitions_count = 2
    replication_factor = 1

    existing_topics = admin.cluster_info.topics.pluck(:topic_name)

    unless existing_topics.include?(topic_name)
      admin.create_topic(
        topic_name,
        partitions_count,
        replication_factor
      )
    end
  end
end
