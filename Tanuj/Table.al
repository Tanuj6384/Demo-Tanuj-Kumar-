table 70000 mytable
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Enter First Digit"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Enter Second Digit"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Enter First Digit")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}