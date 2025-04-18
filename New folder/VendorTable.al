tableextension 60606 VendorEx extends Vendor
{
    fields
    {
        // Add changes to table fields here
        modify(Blocked)
        {
            trigger OnAfterValidate()
            begin
                if Rec.Blocked <> Rec.Blocked::All then
                Rec.TestField(Name);
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}