codeunit 50110 "AIR RestForecast Install"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    begin
    end;

    trigger OnInstallAppPerCompany()
    begin
        if not isEvaluationCompany() then
            exit;

        EnableWebServicesCallsInTheSandbox();
        LoadDemoData();
    end;

    local procedure EnableWebServicesCallsInTheSandbox()
    var
        NavAppSetting: Record "NAV App Setting";
        EnvironmentInfo: Codeunit "Environment Information";
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);

        If EnvironmentInfo.IsSandbox() Then begin
            NavAppSetting."App ID" := AppInfo.Id();
            NavAppSetting."Allow HttpClient Requests" := true;
            if not NavAppSetting.Insert() then
                NavAppSetting.Modify();
        end;
    end;

    local procedure isEvaluationCompany(): Boolean
    var
        Company: Record Company;
    begin
        Company.Get(CompanyName());
        exit(Company."Evaluation Company");
    end;

    local procedure LoadDemoData()
    var
        MFLoadDemoData: Codeunit "AIR Rest. Load Demo Data";
    begin
        MFLoadDemoData.LoadDemoData();
    end;

}