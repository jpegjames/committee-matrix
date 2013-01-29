class MemberResponse < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :member
  
  attr_accessible :q1a, :q1c, :q2a, :q2c, :q3a, :q3c, :q4a, :q4c, :q5a, :q5c, :q6a, :q6c, :q7a, :q7c, :q8a, :q8c, :q9a, :q9c, :q10a, :q10c, :general_comments, :skype_vote, :skype_comments
  
  before_save :calculate_score
  after_save :calculate_average_score
  
  def calculate_score
    total = 0
    count = 0
    
    if self.q1a != nil and self.q1a.between?(1,5)
      total += self.q1a
      count += 1
    end
    if self.q2a != nil and self.q2a.between?(1,5)
      total += self.q2a
      count += 1
    end
    if self.q3a != nil and self.q3a.between?(1,5)
      total += self.q3a
      count += 1
    end
    if self.q4a != nil and self.q4a.between?(1,5)
      total += self.q4a
      count += 1
    end
    if self.q5a != nil and self.q5a.between?(1,5)
      total += self.q5a
      count += 1
    end
    if self.q6a != nil and self.q6a.between?(1,5)
      total += self.q6a
      count += 1
    end
    if self.q7a != nil and self.q7a.between?(1,5)
      total += self.q7a
      count += 1
    end
    if self.q8a != nil and self.q8a.between?(1,5)
      total += self.q8a
      count += 1
    end
    if self.q9a != nil and self.q9a.between?(1,5)
      total += self.q9a
      count += 1
    end
    if self.q10a != nil and self.q10a.between?(1,5)
      total += self.q10a
      count += 1
    end
    
    if count != 0
      self.score = "%0.4f" % (total.to_f / count).to_f
    else
      self.score = 0
    end
  end
  
  def calculate_average_score
    applicant = self.applicant
    responses = applicant.member_responses

    if responses.count > 1
      # Calculate Average
      applicant_average_score = responses.average(:score)
      applicant.average_score = "%0.5f" % applicant_average_score
      applicant.average_score_sort = "%0.2f" % applicant_average_score
      applicant.save
    
      # Calculate Variance
      all_deviations = 0
      responses.each do |response|
        deviation = response.score - applicant_average_score
        all_deviations += ( deviation * deviation ) # square deviation
      end
    
      variance = all_deviations / ( responses.count )
    
      puts "variance ==== #{ variance }"
    
      # Calculate Standard Deviation
      applicant.average_score_precision = "%0.4f" % Math.sqrt(variance)
    end
    
    # Tally Skype Votes
    skype_votes_total = 0
    responses.each do |response|
      skype_votes_total += 1 if response.skype_vote == true
    end 
    applicant.skype_vote_total = skype_votes_total
    
    
    applicant.save
  end
end
