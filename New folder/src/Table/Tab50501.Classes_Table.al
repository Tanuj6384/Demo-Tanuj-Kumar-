table 50501 Class
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Active; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Mode; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Live","On-Demand";
            OptionCaption = ',Live,On-Demand';
        }
        field(5; Fee; Decimal)
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