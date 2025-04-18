table 71010 Vowels
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Enter Word"; Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Enter Word For Counnt"; Code[5])
        {
            DataClassification = ToBeClassified;
        }
     
    }

    keys
    {
        // key(Key1; MyField)
        // {
        //     Clustered = true;
        // }
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