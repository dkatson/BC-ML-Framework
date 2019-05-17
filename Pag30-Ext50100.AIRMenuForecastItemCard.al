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

                action("AIR Train ML Model")
                {
                    Caption = 'Create My Rest. Forecast ML Model';
                    ToolTip = 'Send your data to our predictive experiment and we will prepare a predictive model for you.';
                    Image = Task;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        RestForecastTrain: Codeunit "AIR Train Rest. Forecast ML";
                    begin
                        RestForecastTrain.Train();
                    end;
                }

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

                action("AIR OpenRestHistory")
                {
                    Caption = 'Open Rest. History';
                    Image = History;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        RestSalesHistory: Record "AIR RestSalesEntry";
                    begin
                        RestSalesHistory.SetRange(menu_item_id, "No. 2");
                        Page.Run(page::"AIR RestSalesEntries", RestSalesHistory);
                    end;
                }

            }

        }
    }

}
