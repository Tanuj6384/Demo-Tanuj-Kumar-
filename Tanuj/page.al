page 70094 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = mytable;
    Caption = 'Lulu Malls';

    layout
    {
        area(Content)
        {

            group(GroupName)
            {
                usercontrol(HTMLControl; HTMLControlAddIn)
                {
                    ApplicationArea = All;
                    trigger Ready()
                    begin
                        CurrPage.HTMLControl.embedHomePage();
                    end;
                }

                field("Enter First Digit"; Rec."Enter First Digit")
                {
                    ApplicationArea = all;
                }
                field("Enter Second Digit"; Rec."Enter Second Digit")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    // actions
    // {
    // area(Processing)
    // {
    //     action(ActionName)
    //     {
    //         Caption = 'LULU';
    //         Promoted = true;
    //         ApplicationArea = all;
    //         PromotedIsBig = true;

    //         trigger OnAction()


    //         begin
    //             // Example logic: Retrieve the values entered
    //             if Rec
    //             myInt := Rec."Enter First Digit" + Rec."Enter Second Digit";
    //             Message('The sum of the digits is: %1', myInt);
    //         end;

    // }
    // }
    // }

    var
        myInt: Integer;
}