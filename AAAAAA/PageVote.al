page 71012 VotingPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = ElectionTable;
    Caption = 'Election Voting';

    layout
    {
        area(Content)
        {
            group(Voting)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Select Voting"; Rec."Select Voting")
                {
                    ApplicationArea = all;
                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'OK';
                Image = AbsenceCalendar;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // TOTALBJP := 0;
                    // TOTALAAP := 0;
                    // TOTALCONG := 0;

                    if Rec."Select Voting" = Rec."Select Voting"::BJP then begin
                        Rec.TOTALBJP += 1;
                    end;

                    if Rec."Select Voting" = Rec."Select Voting"::AAP then begin
                        Rec.TOTALAAP += 1;
                    end;
                    // if Rec."Select Voting" = Rec."Select Voting"::CONG then begin
                    //     TOTALCONG += 1;
                    // end;
                end;
            }

            action(Final)
            {
                Caption = 'Final Vote';
                Image = AbsenceCalendar;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('BJP is %1 and AAP is %2 and CONG is %3', TOTALBJP, TOTALAAP, TOTALCONG);
                end;
            }
        }
    }

    var
        myInt: Integer;
        TOTALBJP: Integer;
        TOTALAAP: Integer;
        TOTALCONG: Integer;



}