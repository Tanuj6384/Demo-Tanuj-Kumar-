pageextension 60606 VendorEXt extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        IsFieldBlankError: Label 'The Name field cannot be blank. Please fill it before closing the page.';
    begin
        if Rec.Name = '' then begin
            Error(IsFieldBlankError);
            exit(false); // Prevents the page from closing
        end;
        exit(true); // Allows the page to close
    end;


    var
        myInt: Integer;
}