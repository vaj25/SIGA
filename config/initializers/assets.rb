# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( validate/zone.js validate/activity.js validate/collection.js
                                                  validate/tree.js validate/detail_incomes.js validate/reports/income_summary.js
                                                  validate/reports/adquisition_tree.js validate/member.js validate/charge.js
                                                  validate/general_meeting.js validate/meeting.js validate/meeting_member.js
                                                  validate/diary.js validate/resource_activity_tree validate/contact.js
                                                  validate/activity_contact.js)
