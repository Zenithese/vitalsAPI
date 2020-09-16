Measurement.destroy_all

259.times { |n| Measurement.create(
    temperature: String(rand(96..100)), 
    blood: String(rand(120..130)) + "/" + String(rand(65..75)), 
    oximeter_spo2: String(rand(92..98)), 
    oximeter_pr: String(rand(71..80)), 
    created_at: String(DateTime.ordinal(2020, n + 1).utc)[0..-5]
    ) 
}