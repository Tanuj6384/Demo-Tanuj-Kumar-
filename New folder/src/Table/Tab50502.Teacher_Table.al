table 50502 Teacher
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Work Phone No."; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(4; "Personal Phone No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Website URL"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(6; "e-mail"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
            
        }
        field(7; Active; Boolean)
        {
            DataClassification = ToBeClassified;
            
        }
    }


    keys
    {
        key(PK; ID)
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