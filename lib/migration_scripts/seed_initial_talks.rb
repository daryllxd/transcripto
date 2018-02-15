# frozen_string_literal: true

module MigrationScripts
  class SeedInitialTalks
    def seed
      first_user = User.first

      opened_file = File.read('db/seeded_talks/sandi-metz-magic-tricks-of-testing.md').split('---')

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

    def revert
      TalkSummary.destroy_all
      Talk.destroy_all
    end
  end
end
