/////////////////////////////////////////////////////////////////////////////
{
    Unit Format
    Criação: 99 Coders (Heber Stein Mazutti - heber@99coders.com.br)
    Versão: 1.2
}
/////////////////////////////////////////////////////////////////////////////

unit uFormat;

interface

uses System.SysUtils, FMX.Edit, Classes, System.MaskUtils;

type
    TFormato = (CNPJ, CPF, InscricaoEstadual, CNPJorCPF, TelefoneFixo, Celular, Personalizado,
                Valor, Money, CEP, Dt, Peso);

procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');
function SomenteNumero(str : string) : string;

implementation

function SomenteNumero(str : string) : string;
var
    x : integer;
begin
    Result := '';
    for x := 0 to Length(str) - 1 do
        if (str.Chars[x] In ['0'..'9']) then
            Result := Result + str.Chars[x];

     SomenteNumero := Result;
end;

function FormataValor(str : string) : string;
begin
    if Str = '' then
        Str := '0';

    try
        Result := FormatFloat('#,##0.00', strtofloat(str) / 100);
    except
        Result := FormatFloat('#,##0.00', 0);
    end;
end;

function FormataPeso(str : string) : string;
begin
    if Str.IsEmpty then
        Str := '0';

    try
        Result := FormatFloat('#,##0.000', strtofloat(str) / 1000);
    except
        Result := FormatFloat('#,##0.000', 0);
    end;
end;

function Mask(Mascara, Str : string) : string;
var
    x, p : integer;
begin
    p := 0;
    Result := '';

    if Str.IsEmpty then
        exit;

    for x := 0 to Length(Mascara) - 1 do
    begin
        if Mascara.Chars[x] = '#' then
        begin
            Result := Result + Str.Chars[p];
            inc(p);
        end
        else
            Result := Result + Mascara.Chars[x];

        if p = Length(Str) then
            break;
    end;
end;

function FormataIE(Num, UF: string): string;
var
    Mascara : string;
begin
    Mascara := '';
    IF UF = 'AC' Then Mascara := '##.###.###/###-##';
    IF UF = 'AL' Then Mascara := '#########';
    IF UF = 'AP' Then Mascara := '#########';
    IF UF = 'AM' Then Mascara := '##.###.###-#';
    IF UF = 'BA' Then Mascara := '######-##';
    IF UF = 'CE' Then Mascara := '########-#';
    IF UF = 'DF' Then Mascara := '###########-##';
    IF UF = 'ES' Then Mascara := '#########';
    IF UF = 'GO' Then Mascara := '##.###.###-#';
    IF UF = 'MA' Then Mascara := '#########';
    IF UF = 'MT' Then Mascara := '##########-#';
    IF UF = 'MS' Then Mascara := '#########';
    IF UF = 'MG' Then Mascara := '###.###.###/####';
    IF UF = 'PA' Then Mascara := '##-######-#';
    IF UF = 'PB' Then Mascara := '########-#';
    IF UF = 'PR' Then Mascara := '########-##';
    IF UF = 'PE' Then Mascara := '##.#.###.#######-#';
    IF UF = 'PI' Then Mascara := '#########';
    IF UF = 'RJ' Then Mascara := '##.###.##-#';
    IF UF = 'RN' Then Mascara := '##.###.###-#';
    IF UF = 'RS' Then Mascara := '###/#######';
    IF UF = 'RO' Then Mascara := '###.#####-#';
    IF UF = 'RR' Then Mascara := '########-#';
    IF UF = 'SC' Then Mascara := '###.###.###';
    IF UF = 'SP' Then Mascara := '###.###.###.###';
    IF UF = 'SE' Then Mascara := '#########-#';
    IF UF = 'TO' Then Mascara := '###########';

    Result := Mask(mascara, Num);
end;

function FormataData(str : string): string;
begin
    str := Copy(str, 1, 8);

    if Length(str) < 8 then
        Result := Mask('##/##/####', str)
    else
    begin
        try
            str := Mask('##/##/####', str);
            strtodate(str);
            Result := str;
        except
            Result := '';
        end;
    end;
end;

procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');
var
    texto : string;
begin
    TThread.Queue(Nil, procedure
    begin
        if obj is TEdit then
            texto := TEdit(obj).Text;

        // Telefone Fixo...
        if formato = TelefoneFixo then
            texto := Mask('(##) ####-####', SomenteNumero(texto));

        // Celular...
        if formato = Celular then
            texto := Mask('(##) #####-####', SomenteNumero(texto));

        // CNPJ...
        if formato = CNPJ then
            texto := Mask('##.###.###/####-##', SomenteNumero(texto));

        // CPF...
        if formato = CPF then
            texto := Mask('###.###.###-##', SomenteNumero(texto));

        // Inscricao Estadual (IE)...
        if formato = InscricaoEstadual then
            texto := FormataIE(SomenteNumero(texto), Extra);

        // CNPJ ou CPF...
        if formato = CNPJorCPF then
            if Length(SomenteNumero(texto)) <= 11 then
                texto := Mask('###.###.###-##', SomenteNumero(texto))
            else
                texto := Mask('##.###.###/####-##', SomenteNumero(texto));

        // Personalizado...
        if formato = Personalizado then
            texto := Mask(Extra, SomenteNumero(texto));

        // Valor...
        if Formato = Valor then
            texto := FormataValor(SomenteNumero(texto));

        // Money (com simbolo da moeda)...
        if Formato = Money then
        begin
            if Extra = '' then
                Extra := 'R$';

            texto := Extra + ' ' + FormataValor(SomenteNumero(texto));
        end;

        // CEP...
        if Formato = CEP then
            texto := Mask('##.###-###', SomenteNumero(texto));

        // Data...
        if formato = Dt then
            texto := FormataData(SomenteNumero(texto));

        // Peso...
        if Formato = Peso then
            texto := FormataPeso(SomenteNumero(texto));


        if obj is TEdit then
        begin
            TEdit(obj).Text := texto;
            TEdit(obj).CaretPosition := TEdit(obj).Text.Length;
        end;

    end);

end;

end.
