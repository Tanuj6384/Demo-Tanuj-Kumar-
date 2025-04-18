table 71011 ElectionTable
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; Name; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Select Voting"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "",BJP,AAP,CONG;

        }
        field(3; TOTALBJP; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; TOTALAAP; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Name)
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