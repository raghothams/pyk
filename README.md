# Pyk
Standard library of commonly reused functions across all Pykih Projects.

---------------------------------------

## Pyk::User

###### Check if admin by email ID 
> Pyk::User.is_admin?(current_user.email)

---------------------------------------

## Pyk::Url

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Pyk::String

---------------------------------------

## Pyk::Spreadsheet

###### If date is coming from MS Excel then it needs processing.
> Pyk::Spreadsheet.process_date_from_xls(d)

###### Is a file a Spreadsheet File?
> Pyk::Spreadsheet.is_excel?(data_file_name)

###### Open an Excel File
> Pyk::Spreadsheet.open(url, name, domain)

###### Find all to-process ExcelService files
> Pyk::Spreadsheet.to_process

---------------------------------------

## Pyk::Regex

> Pyk::Regex::EMAIL
> Pyk::Regex::PASSWORD
> Pyk::Regex::URL

---------------------------------------

## Pyk::Number

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Pyk::Gravatar

###### Image
> Pyk::Gravatar.dp(email, size)

###### Profile
> Pyk::Gravatar.profile(email)

---------------------------------------

## Pyk::Float

---------------------------------------

## Pyk::Dj (Delayed Job methods for investigation)

###### Find all delayed jobs which have errored out
> Pyk::Dj.bug
> Pyk::Dj.bug_count

###### Find all delayed jobs which have not errored out
> Pyk::Dj.ok
> Pyk::Dj.ok_count

###### Find all delayed jobs which are running right now
> Pyk::Dj.active
> Pyk::Dj.active_count

###### Readable status
> Pyk::Dj.status(d)

---------------------------------------

## Pyk::DateTime

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Pyk::Date

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Pyk::Api

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Pyk::Address

###### Clean up URL
> Pyk::Url.clean(link)

---------------------------------------

## Helpers

###### Clean up URL
> Pyk::Url.clean(link)
