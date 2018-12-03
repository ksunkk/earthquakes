class KeywordsService
  EXPIRE_TIME = 15.minutes

  def self.list
    return @keywords_list if @keywords_list && !keywords_list_expired?
    @keywords_list = YAML.load_file(Rails.root.join('config', 'keywords.yml'))
    @cached_at = Time.now
  end

  def self.keywords_list_expired?
    @keywords_list.nil? || @cached_at <= EXPIRE_TIME.ago
  end
end
