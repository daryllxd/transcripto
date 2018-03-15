# frozen_string_literal: true

module MigrationScripts
  class SeedInitialTalks
    def seed
      first_user = User.first

      seeded_talk_file_locations = Dir['db/seeded_talks/*.md']

      seeded_talk_file_locations.each do |file_location|
        opened_file = File.read(file_location).split('---')

        talk = Talk.create!(
          presenter: opened_file[0].strip,
          video_url: opened_file[1].strip,
          event: opened_file[2].strip,
          title: opened_file[3].strip
        )

        TalkSummary.create!(
          body: opened_file[4],
          talk_id: talk.id,
          submitted_by_user: first_user,
          submitted_at: Date.current
        )
      end
    end

    def revert
      TalkSummary.destroy_all
      Talk.destroy_all
    end
  end
end
