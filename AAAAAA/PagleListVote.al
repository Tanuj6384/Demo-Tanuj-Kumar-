page 71018 Electionist
{
    Caption = 'Election List';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = All;
    SourceTable = ElectionTable;

    layout
    {
        area(Content)
        {
            group(Group)
            {
             field(TOTALAAP;Rec.TOTALAAP)
             {
                ApplicationArea = All;
             }
             field(TOTALBJP;Rec.TOTALBJP)
             {
                ApplicationArea = All;
             }
             
            }
        }
        area(Factboxes)
        {

        }
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