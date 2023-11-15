
' Test Szenario:
' 16 Kanäle
' Abfrage 3-Pos-Schalter
' PPM-Signal generieren
' Tiny 2313
' Version 1.0


$regfile = "ATtiny2313.DAT"

$prog &HFF , &HC2 , &HDF , &HFF                             ' 4MHz


$crystal = 4000000



$hwstack = 32                                               ' default use 32 for the hardware stack
$swstack = 10                                               ' default use 10 for the SW stack
$framesize = 40                                             ' default use 40 for the frame space



Declare Sub Ppuls()

Eing1 Alias Pinb.0                                          'Eingänge den Pins zuordnen
Pull1 Alias Portb.0
Pull1 = 1
Eing2 Alias Pinb.1
Pull2 Alias Portb.1
Pull2 = 1
Eing3 Alias Pinb.2
Pull3 Alias Portb.2
Pull3 = 1
Eing4 Alias Pinb.3
Pull4 Alias Portb.3
Pull4 = 1
Eing5 Alias Pinb.4
Pull5 Alias Portb.4
Pull5 = 1
Eing6 Alias Pinb.5
Pull6 Alias Portb.5
Pull6 = 1
Eing7 Alias Pinb.6
Pull7 Alias Portb.6
Pull7 = 1
Eing8 Alias Pinb.7
Pull8 Alias Portb.7
Pull8 = 1
Eing9 Alias Pind.5
Pull9 Alias Portd.5
Pull9 = 1
Eing10 Alias Pind.4
Pull10 Alias Portd.4
Pull10 = 1
Eing11 Alias Pind.3
Pull11 Alias Portd.3
Pull11 = 1
Eing12 Alias Pind.2
Pull12 Alias Portd.2
Pull12 = 1
Eing13 Alias Pina.0
Pull13 Alias Porta.0
Pull13 = 1
Eing14 Alias Pina.1
Pull14 Alias Porta.1
Pull14 = 1
Eing15 Alias Pind.1
Pull15 Alias Portd.1
Pull15 = 1
Eing16 Alias Pind.0
Pull16 Alias Portd.0
Pull16 = 1

Ppmout Alias Portd.6
Config Ppmout = Output


'negative Pulse
Const On = 1
Const Off = 0

'positive Pulse   die Q-X7 frisst beides
'Const On = 0
'Const Off = 1


Const Puls = 300                                            'uS
Const Pause = 7                                             'mS - min 4 mS
Const Pp1 = 1100 - Puls                                     'uS  -100%  ("puls" ist abzuziehen)
Const Pp2 = 1500 - Puls                                     'uS  0%
Const Pp3 = 1900 - Puls                                     'uS  +100%


Dim A As Byte
Dim Pp As Integer                                           'Pulslänge in uS


Dim Chan(16) As Integer


Ppmout = Off
Waitms 100




Do


'3-Pos-Schalter einlesen
'pro Eingang 100k gegen Gnd

If Eing1 = 1 Then
   Chan(1) = Pp3
   Else
   Chan(1) = Pp2
End If
If Eing2 = 1 Then
   Chan(2) = Pp3
   Else
   Chan(2) = Pp2
End If
If Eing3 = 1 Then
   Chan(3) = Pp3
   Else
   Chan(3) = Pp2
End If
If Eing4 = 1 Then
   Chan(4) = Pp3
   Else
   Chan(4) = Pp2
End If
If Eing5 = 1 Then
   Chan(5) = Pp3
   Else
   Chan(5) = Pp2
End If
If Eing6 = 1 Then
   Chan(6) = Pp3
   Else
   Chan(6) = Pp2
End If
If Eing7 = 1 Then
   Chan(7) = Pp3
   Else
   Chan(7) = Pp2
End If
If Eing8 = 1 Then
   Chan(8) = Pp3
   Else
   Chan(8) = Pp2
End If
If Eing9 = 1 Then
   Chan(9) = Pp3
   Else
   Chan(9) = Pp2
End If
If Eing10 = 1 Then
   Chan(10) = Pp3
   Else
   Chan(10) = Pp2
End If
If Eing11 = 1 Then
   Chan(11) = Pp3
   Else
   Chan(11) = Pp2
End If
If Eing12 = 1 Then
   Chan(12) = Pp3
   Else
   Chan(12) = Pp2
End If
If Eing13 = 1 Then
   Chan(13) = Pp3
   Else
   Chan(13) = Pp2
End If
If Eing14 = 1 Then
   Chan(14) = Pp3
   Else
   Chan(14) = Pp2
End If
If Eing15 = 1 Then
   Chan(15) = Pp3
   Else
   Chan(15) = Pp2
End If
If Eing16 = 1 Then
   Chan(16) = Pp3
   Else
   Chan(16) = Pp2
End If

Pull1 = 1
Pull2 = 1
Pull3 = 1
Pull4 = 1
Pull5 = 1
Pull6 = 1
Pull7 = 1
Pull8 = 1
Pull9 = 1
Pull10 = 1
Pull11 = 1
Pull12 = 1
Pull13 = 1
Pull14 = 1
Pull15 = 1
Pull16 = 1

Waitus 6                                                    'bisschen auf die Pullup's warten

If Eing1 = 0 Then
   Chan(1) = Pp1
End If
If Eing2 = 0 Then
   Chan(2) = Pp1
End If
If Eing3 = 0 Then
   Chan(3) = Pp1
End If
If Eing4 = 0 Then
   Chan(4) = Pp1
End If
If Eing5 = 0 Then
   Chan(5) = Pp1
End If
If Eing6 = 0 Then
   Chan(6) = Pp1
End If
If Eing7 = 0 Then
   Chan(7) = Pp1
End If
If Eing8 = 0 Then
   Chan(8) = Pp1
End If
If Eing9 = 0 Then
   Chan(9) = Pp1
End If
If Eing10 = 0 Then
   Chan(10) = Pp1
End If
If Eing11 = 0 Then
   Chan(11) = Pp1
End If
If Eing12 = 0 Then
   Chan(12) = Pp1
End If
If Eing13 = 0 Then
   Chan(13) = Pp1
End If
If Eing14 = 0 Then
   Chan(14) = Pp1
End If
If Eing15 = 0 Then
   Chan(15) = Pp1
End If
If Eing16 = 0 Then
   Chan(16) = Pp1
End If

Pull1 = 0
Pull2 = 0
Pull3 = 0
Pull4 = 0
Pull5 = 0
Pull6 = 0
Pull7 = 0
Pull8 = 0
Pull9 = 0
Pull10 = 0
Pull11 = 0
Pull12 = 0
Pull13 = 0
Pull14 = 0
Pull15 = 0
Pull16 = 0

For A = 1 To 16                                             'Anzahl Kanäle

   Pp = Chan(a)                                             'Schalter-Position auf Kanal ausgeben
   Call Ppuls

Next A


'PPM-Pause:
   Ppmout = On
   Waitus Puls
   Ppmout = Off
   Waitms Pause


Loop
End




Sub Ppuls()
'PPM-Puls erzeugen
   Ppmout = On
   Waitus Puls
   Ppmout = Off
   Waitus Pp

End Sub