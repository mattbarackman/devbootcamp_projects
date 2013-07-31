class Student < Database::Model

  attr_reader :attributes, :old_attributes

  # We say a record is "new" if it doesn't have a defined primary key in its
  # attributes

  def cohort
    Cohort.where('id = ?', self[:cohort_id]).first
  end

  def cohort=(cohort)
    self[:cohort_id] = cohort[:id]
    self.save
    cohort
  end

end
