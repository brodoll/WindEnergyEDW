CREATE TABLE [dim].[Time]
(
[TimePK] INT NOT NULL CONSTRAINT PK_Time PRIMARY KEY,
[Time] NVARCHAR(11) NOT NULL,
[Time24] NVARCHAR(8) NOT NULL,
[Hour24] TINYINT NOT NULL,
[HourNumber] TINYINT NOT NULL,					--1-24
[MinuteNumber] TINYINT NOT NULL,				--1-60
[AMPM] nchar(2) NOT NULL,
[HalfHourIndicator] TINYINT NOT NULL,          --1 or 2, if it is the first or second half of the hour 
[HalfHourNumber] TINYINT NOT NULL,             --1-24, incremented at the top of each half hour for the entire day
[QuarterHourIndicator] TINYINT NOT NULL,       --1-4, for each quarter hour 
[QuarterHourNumber] TINYINT NOT NULL,          --1-48, incremented at the tope of each half hour for the entire day 
[ElapsedMinutesInDay] INT NOT NULL,
[ElapsedSecondsInDay] INT NOT NULL
)
ON SECONDARY;
 
