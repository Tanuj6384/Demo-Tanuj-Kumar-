pageextension 50001 StudentNoseries extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Customer Nos.")
        {
            field("No Series Add"; Rec."No Series Add")
            {
                ApplicationArea = all;
            }
            field("Posting Date"; (DMY2Date(Rec."Default Posting Date")))
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}


 


