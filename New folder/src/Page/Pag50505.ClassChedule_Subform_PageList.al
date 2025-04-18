page 50505 "Teacher Class Schedule Subform"
{
    Caption = 'Class Schedule Subform List page';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Class Schedule";
    AutoSplitKey = true;// line no auto incrememnt & primary key set auto

    layout
    {
        area(Content)
        {
            repeater(classSchedule)
            {
                Caption = 'Class Schedule';

                field("Teacher ID"; Rec."Teacher ID")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Class ID"; Rec."Class ID")
                {
                    ApplicationArea = All;
                }
                field("Schedule Day"; Rec."Schedule Day")
                {
                    ApplicationArea = All;
                }
                field("Schedule Date"; Rec."Schedule Date")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        ScheduleDateTime: DateTime;
                        ScheduleEndDateTime: DateTime;
                        DurationInHours: Decimal;
                    begin
                        /*
                        //Data and Time coversion Start
                        //-----------------------------------------------------------------
                        // Convert Schedule Date to DateTime (start of the day at midnight)
                        ScheduleDateTime := CreateDateTime(Rec."Schedule Date", 000000T);

                        // Assume Rec.Duration is the number of hours (e.g., 32)
                        DurationInHours := Rec.Duration;

                        // Add duration in hours converted to milliseconds
                        ScheduleEndDateTime := ScheduleDateTime + (DurationInHours * 3600 * 1000); // 3600 seconds in an hour * 1000 milliseconds

                        // Store the resulting Date part in "Schedule End Date"
                        Rec."Schedule End Date" := DT2DATE(ScheduleEndDateTime);
                        // ---------------------------------------------------------------
                        //Data and Time coversion Start
                        */
                    end;
                }
                field("Scheduled Start Time"; Rec."Scheduled Start Time")
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        ScheduleDateTime: DateTime;
                        ScheduleEndDateTime: DateTime;
                        DurationInHours: Decimal;
                        DurationInMilliseconds: Decimal;
                    begin
                        Rec."Scheduled End Time" := Rec."Scheduled Start Time" + Rec.Duration * 3600000;
                        //1 HR = 3600000 ms

                        //Data and Time coversion Start
                        //-----------------------------------------------------------------
                        // Convert Schedule Date to DateTime (start of the day at midnight)
                        ScheduleDateTime := CreateDateTime(Rec."Schedule Date", 000000T);

                        // Assume Rec.Duration is the number of hours (e.g., 32)
                        DurationInHours := Rec.Duration;

                        // Add duration in hours converted to milliseconds
                        ScheduleEndDateTime := ScheduleDateTime + (DurationInHours * 3600 * 1000 * 1.0); // 3600 seconds in an hour * 1000 milliseconds

                        // Store the resulting Date part in "Schedule End Date"
                        Rec."Schedule End Date" := DT2DATE(ScheduleEndDateTime);
                        // ---------------------------------------------------------------
                        //Data and Time coversion End


                    end;
                }
                field("Scheduled End Time"; Rec."Scheduled End Time")
                {
                    ApplicationArea = All;
                }
                field("Schedule End Date"; Rec."Schedule End Date")
                {
                    ApplicationArea = all;
                }
                field("Teacher Name"; Rec."Teacher Name")
                {
                    ApplicationArea = All;
                }
                field("Class Name"; Rec."Class Name")
                {
                    ApplicationArea = All;
                }

            }
        }
        // area(Factboxes)
        // {

        // }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}