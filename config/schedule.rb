every 1.day, at: '19:30' do
    DeleteEpiredTravelJob.perform_later
end