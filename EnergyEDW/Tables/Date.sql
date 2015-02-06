CREATE TABLE [dim].[Date]
(
  [Date_PK] [int] NOT NULL CONSTRAINT PK_Date PRIMARY KEY
, [FullDate] [datetime] NOT NULL
, [Day] [tinyint] NOT NULL
, [DaySuffix] [varchar](4) NOT NULL
, [DayOfWeek] [varchar](9) NOT NULL
, [DayOfWeekNumber] [int] NOT NULL
, [DayOfWeekInMonth] [tinyint] NOT NULL
, [DayOfYearNumber] [int] NOT NULL
, [RelativeDays] int NOT NULL
, [WeekOfYearNumber] [tinyint] NOT NULL
, [WeekOfMonthNumber] [tinyint] NOT NULL
, [RelativeWeeks] int NOT NULL
, [CalendarMonthNumber] [tinyint] NOT NULL
, [CalendarMonthName] [varchar](9) NOT NULL
, [CalendarYearMonth] as (case when [CalendarMonthNumber] < 10 then cast ([CalendarYearNumber] as varchar(7)) + '-0' + cast([CalendarMonthNumber] as varchar(7)) else cast ([CalendarYearNumber] as varchar(7)) + '-' + cast([CalendarMonthNumber] as varchar(7))  end)
, [RelativeMonths] int NOT NULL
, [CalendarQuarterNumber] [tinyint] NOT NULL
, [CalendarQuarterName] [varchar](6) NOT NULL
, [RelativeQuarters] int NOT NULL
, [CalendarYearNumber] int NOT NULL
, [RelativeYears] int NOT NULL
, [StandardDate] [varchar](10) NULL
, [WeekDayFlag] bit NOT NULL 
, [HolidayFlag] bit NOT NULL
, [OpenFlag] bit NOT NULL
, [FirstDayOfCalendarMonthFlag] bit NOT NULL
, [LastDayOfCalendarMonthFlag] bit NOT NULL
, [HolidayText] [varchar](50) NULL
)
ON SECONDARY;