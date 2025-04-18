report 90000 Tanuj
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Demo Tanuj Report';
    // ProcessingOnly = true;
    DefaultLayout = RDLC;
    RDLCLayout = 'tanuj.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(cDate; cDate) { }
            column(CTime; CTime) { }
            column(DateTimem; DateTimem) { }

            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(No_; "No.")
            {

            }
            trigger OnAfterGetRecord()
            begin

                CalculateBalanceDate;

                cDate := Today;
                CTime := Time;
                DateTimem := CurrentDateTime;
            end;
        }

    }

    requestpage
    {
        // AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(DateRange)
                {
                    // field(StartDate; StartDate)
                    // {
                    //     ApplicationArea = All;
                    // }
                    // field(EndDate; EndDate)
                    // {
                    //     ApplicationArea = all;
                    // }

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }
    trigger OnPreReport()
    var
        pos: Integer;
        DaysBetween: Integer;

    begin
        // DateRange := "Sales Header".GetFilter("Posting Date");
        // pos := StrPos(DateRange, '.');
        // if pos > 0 then
        //     DateFilterStart := CopyStr(DateRange, 1, pos - 1);
        // DateFilterEnd := CopyStr(DateRange, pos + 2, StrLen(DateRange));

        // DaysBetween := EndDate - StartDate;

        // Message('The number of days between %1 and %2 is %3.', StartDate, EndDate, DaysBetween);
    end;

    procedure CalculateBalanceDate()
    var
        StockBalanceForMonth: Decimal;
        newmonth: Integer;
        newdays: Integer;
        TodayDate: Date;
        BalanceDates: Date;
        MonthFind: Text;
        MonthLengthtext: Text;
        Pos: Integer;

    begin
        StockBalanceForMonth := 4.67;
        // Convert 04-03-2025 

        Pos := StrPos(MonthLengthtext, '.');
        if pos > 0 then
            MonthLengthtext := Format(StockBalanceForMonth);
        MonthFind := CopyStr(MonthLengthtext, 1, Pos - 1);

        // Example value (4.67)
        // StockBalanceForMonth := 4.67;
       TodayDate := 20250403D;

        // Extract integer and decimal parts
        Evaluate(newmonth, MonthFind);
        // newmonth := (newmonth); // 4
        newdays := Round((StockBalanceForMonth - newmonth) * 30); // 20

        // Calculate Balance Date
        BalanceDates := CalcDate(Format(newmonth) + 'M', TodayDate);

    end;

    var
        myInt: Integer;
        DateRange: Text;
        DateFilterStart: Text;
        DateFilterEnd: Text;
        StartDate: Date;
        EndDate: Date;
        POSTINGDATE: DATE;
        cDate: date;
        CTime: time;
        DateTimem: DateTime;
}