class ConferencesService
  def self.search(search_params, user, confirmed: false)
    Conference.actual.where(is_confirmed: confirmed)
  end
end
