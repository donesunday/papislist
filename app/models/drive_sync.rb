class DriveSync
  COUNTRIES = { portugal: 0, us: 1, uk: 2, singapore: 3 }
  ATTRIBUTES = [:name, :description, :auth, :https, :paid, :link]

  def sync(country)
    country_drive_index = COUNTRIES[country.name.downcase.to_sym]
    session = GoogleDrive::Session.
               from_service_account_key(StringIO.new(ENV['GOOGLE_DRIVE_JSON']))

    ws = session.
          spreadsheet_by_key(ENV["GOOGLE_DRIVE_SHEET_ID"]).
          worksheets[country_drive_index]

    (2..ws.num_rows).each do |row|
      # Instantiate API
      api = country.apis.new

      (1..ATTRIBUTES.count).each_with_index do |col, index|
        # Do not continue if API is already created
        if index == 0 && country.apis.find_by_name(ws[row, col]).present?
          break
        end
        api[ATTRIBUTES[index]] = ws[row, col]
      end

      api.save
    end

    return country.apis
  end
end