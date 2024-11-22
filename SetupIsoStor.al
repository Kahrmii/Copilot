// codeunit 50102 "Setup Isolated Storage"
// {
//     procedure StoreData()
//     var
//         IsolatedStorage: Codeunit "Isolated Storage";
//         Metaprompt: Text;
//     begin
//         Metaprompt := 'Your default metaprompt text here';
//         IsolatedStorage.Put('DescribeJobMetaprompt', Metaprompt);
//     end;
// }