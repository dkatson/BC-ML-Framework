pageextension 50100 "AIR MenuForecastItemCard" extends "Item Card" //30
{
    layout
    {

    }

    actions
    {

        addafter(AdjustInventory)
        {
            group("AIR Restaurant")
            {
                Image = Forecast;

                action("AIR UpdateForecast")
                {
                    Caption = 'Update Rest. Forecast';
                    Image = Forecast;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        RestForecastCalculate: Codeunit "AIR Calculate Rest. Forecast";
                    begin
                        RestForecastCalculate.CalculateRestForecast(Rec);
                    end;
                }
                action("AIR OpenEvents")
                {
                    Caption = 'Open Events Schedule';
                    Image = Calendar;
                    ApplicationArea = All;
                    RunObject = page "AIR MF Event Schedule List";
                }

            }

        }
    }

}
