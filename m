From: "K.A.Rochstad" <karochstad@broadpark.no>
Subject: miscellaneous questions (iptables v1.2.6a)
Date: Wed, 4 Dec 2002 19:35:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c29bc3$ddeb2b60$0200000a@design>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C29BCC.3F8E28B0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C29BCC.3F8E28B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

=20

I have 2 questions about this edition of netfilter. (iptables 1.2.6)

=20

When I use:

Iptables -A OUTPUT -o $INTERNET -p tcp -s $IPADDR -sport $UNPRIVPORTS =
-dport 113 -j ACCEPT=20

=20

I get this error:

Iptables v.1.2.6a: invalid TCP port/service '-d' specified.

Try 'iptables -h' or 'iptables -help' for more information.

=20

I get this error in connection to -dport 53 too. (With -p UDP)

=20

Q1:=20

Is it not possible to make more restrictions between the SOA DNS and a =
client?

Now I is all protocols allowed all on all ports because -sport and =
-dport not was permitted in connection to port 53.

=20

On the other hand is it no problem to make rules for s local DNS forward =
Server on port 53.

=20

Q2:

How to configure correct rules for these ports?

=20

Thank you for your time and advice.

=20

Karl

------=_NextPart_000_000D_01C29BCC.3F8E28B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><?xml:namespace =
prefix =3D st1 ns =3D=20
"schemas-ifinger-com/smarttag" /><st1:data language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"Hello.&#13;"><SPAN lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Hello.</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"><?xml:namespace prefix =
=3D o ns =3D=20
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. (iptables =
1.2.6)&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">I</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"3"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">have</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =
2=20
</SPAN><st1:data language=3D0 STARTPOS=3D"10"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">questions</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"20"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">about</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"26"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">this</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"31"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">edition</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"39"=20
CONTEXT=3D"I have 2 questions about this edition of netfilter. I =
&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">of</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

netfilter. (iptables 1.2.6)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"When =
?????????????????????????????????????????????????????????????????????????=
??????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">When</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"6"=20
CONTEXT=3D"When I =
?????????????????????????????????????????????????????????????????????????=
????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">I</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"8" CONTEXT=3D"When I =
use:&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">use:</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Iptables=20
</SPAN><st1:data language=3D0 STARTPOS=3D"10"=20
CONTEXT=3D"Iptables =96A =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96A</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"13"=20
CONTEXT=3D"Iptables =96A OUTPUT =
?????????????????????????????????????????????????????????????????????????=
????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">OUTPUT</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"20"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96o</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =
$INTERNET=20
</SPAN><st1:data language=3D0 STARTPOS=3D"33"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o $INTERNET =96p =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96p</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =
tcp=20
</SPAN><st1:data language=3D0 STARTPOS=3D"40"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o $INTERNET =96p tcp =96s =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96s</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =
$IPADDR=20
</SPAN><st1:data language=3D0 STARTPOS=3D"51"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o $INTERNET =96p tcp =96s $IPADDR =
=96sport =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96sport</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

$UNPRIVPORTS =96dport 113 </SPAN><st1:data language=3D0 STARTPOS=3D"82"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o $INTERNET =96p tcp =96s $IPADDR =
=96sport $UNPRIVPORTS =96dport 113 =96j =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">=96j</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

</SPAN><st1:data language=3D0 STARTPOS=3D"85"=20
CONTEXT=3D"Iptables =96A OUTPUT =96o $INTERNET =96p tcp =96s $IPADDR =
=96sport $UNPRIVPORTS =96dport 113 =96j ACCEPT =
?????????????????????????????????????????????????????????????????????????=
????????????????????????????????????????????????&#13;"><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">ACCEPT</SPAN></st1:data><SPAN=20
lang=3DEN-GB=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: EN-GB"> =

<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"I "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">I</SPAN></st1:data><SPAN lang=3DEN-GB =

style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"3"=20
CONTEXT=3D"I get "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">get</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"7"=20
CONTEXT=3D"I get this "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">this</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"12"=20
CONTEXT=3D"I get this error:&#13;"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">error:</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Iptables v.1.2.6a: </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"20" CONTEXT=3D"Iptables v.1.2.6a: invalid "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">invalid</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> TCP port/service =91-d=92 =
</SPAN><st1:data=20
language=3D0 STARTPOS=3D"50"=20
CONTEXT=3D"Iptables v.1.2.6a: invalid TCP port/service =91-d=92 =
specified.&#13;"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">specified.</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"Try "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Try</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> =91iptables </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"15"=20
CONTEXT=3D"Try =91iptables =
=96h=92??????????????????????????????????????????????????????????????????=
?????????????????????????????????????????????????????????????? or =
iptables =96help=92"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">=96h=92</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"18" CONTEXT=3D"Try =91iptables =96h or "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">or</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> =91iptables </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"32" CONTEXT=3D"Try =91iptables =96h=92 or =91iptables =
=96help=92 "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">=96help=92</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"39"=20
CONTEXT=3D"Try =91iptables =96h=92 or =91iptables =96help=92 for "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">for</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"43"=20
CONTEXT=3D"Try =91iptables =96h=92 or =91iptables =96help=92 for more =
"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">more</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"48"=20
CONTEXT=3D"Try =91iptables =96h=92 or =91iptables =96help=92 for more =
information.&#13;"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">information.</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"I "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">I</SPAN></st1:data><SPAN lang=3DEN-GB =

style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"3"=20
CONTEXT=3D"I get "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">get</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"7"=20
CONTEXT=3D"I get this "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">this</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"12"=20
CONTEXT=3D"I get this error "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">error</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"18"=20
CONTEXT=3D"I get this error in "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">in</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"21"=20
CONTEXT=3D"I get this error in connection "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">connection</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"32"=20
CONTEXT=3D"I get this error in connection to "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">to</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> =96dport 53 </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"45" CONTEXT=3D"I get this error in connection to =96dport 53 =
too. "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">too.</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"50"=20
CONTEXT=3D"I get this error in connection to =96dport 53 too. (With =
"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">(With</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"56"=20
CONTEXT=3D"I get this error in connection to =96dport 53 too. (With =96p =
?????????????????????????????????????????????????????????????????????????=
???????????????????????????????????????????????????????UDP)"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">=96p</SPAN></st1:data><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> UDP)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Q1: <o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"Is "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Is</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"4"=20
CONTEXT=3D"Is it "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">it</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"7"=20
CONTEXT=3D"Is it not "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">not</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"11"=20
CONTEXT=3D"Is it not possible "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">possible</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"20"=20
CONTEXT=3D"Is it not possible to "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">to</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"23"=20
CONTEXT=3D"Is it not possible to make "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">make</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"28"=20
CONTEXT=3D"Is it not possible to make more "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">more</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"33"=20
CONTEXT=3D"Is it not possible to make more restrictions "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">restrictions</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"46"=20
CONTEXT=3D"Is it not possible to make more restrictions between "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">between</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"54"=20
CONTEXT=3D"Is it not possible to make more restrictions between the =
"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">the</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> SOA </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"62"=20
CONTEXT=3D"Is it not possible to make more restrictions between the SOA =
DNS "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">DNS</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"66"=20
CONTEXT=3D"Is it not possible to make more restrictions between the SOA =
DNS and "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">and</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"70"=20
CONTEXT=3D"Is it not possible to make more restrictions between the SOA =
DNS and a "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB">a</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"72"=20
CONTEXT=3D"Is it not possible to make more restrictions between the SOA =
DNS and a client?&#13;"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">client</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB">?<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"Now "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Now</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"5"=20
CONTEXT=3D"Now I "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">I</SPAN></st1:data><SPAN lang=3DEN-GB =

style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"7"=20
CONTEXT=3D"Now I is "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">is</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"10"=20
CONTEXT=3D"Now I is all "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">all</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"14"=20
CONTEXT=3D"Now I is all protocols "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">protocols</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"24"=20
CONTEXT=3D"Now I is all protocols allowed "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">allowed</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"32"=20
CONTEXT=3D"Now I is all protocols allowed all "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">all</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"36"=20
CONTEXT=3D"Now I is all protocols allowed all on "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">on</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"39"=20
CONTEXT=3D"Now I is all protocols allowed all on all "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">all</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"43"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">ports</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"49"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">because</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"57"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport?????????????????????????????????????????????????????????????????=
?????????????????????????????????????????????????????????? and =
dport"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">=96sport</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"65"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sports and "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">and</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> =96dport =
</SPAN><st1:data language=3D0=20
STARTPOS=3D"75"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">not</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"79"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not was "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">was</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"83"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not was permitted "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">permitted</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"93"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not was permitted in "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">in</SPAN></st1:data><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> connection </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"107"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not was permitted in conncetion to "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">to</SPAN></st1:data><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"110"=20
CONTEXT=3D"Now I is all protocols allowed all on all ports because =
=96sport and =96dport not was permitted in conncetion to port "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">port</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> =
53.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"on the other hand"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">On</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"4"=20
CONTEXT=3D"on the other hand"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">the</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"8"=20
CONTEXT=3D"on the other hand"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">other</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"14"=20
CONTEXT=3D"On the other hand "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">hand</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"19"=20
CONTEXT=3D"On the other hand is "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">is</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"22"=20
CONTEXT=3D"On the other hand is it "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">it</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"25"=20
CONTEXT=3D"On the other hand is it no "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">no</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"28"=20
CONTEXT=3D"On the other hand is it no problem "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">problem</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"36"=20
CONTEXT=3D"On the other hand is it no problem to "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">to</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"39"=20
CONTEXT=3D"On the other hand is it no problem to make "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">make</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"44"=20
CONTEXT=3D"On the other hand is it no problem to make rules "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">rules</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"50"=20
CONTEXT=3D"On the other hand is it no problem to make rules for "><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">for</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"54"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s =
"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB">s</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"56"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">local</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"62"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
DNS "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">DNS</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"66"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
DNS forward "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">forward</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"74"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
DNS forward Server "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">Server</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"81"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
DNS forward Server on "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">on</SPAN></st1:data><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"84"=20
CONTEXT=3D"On the other hand is it no problem to make rules for s local =
DNS forward Server on port "><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">port</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> =
53.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">Q2:<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"How "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">How</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"5"=20
CONTEXT=3D"How to "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">to</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"8"=20
CONTEXT=3D"How to configure "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">configure</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"18"=20
CONTEXT=3D"How to configure correct "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">correct</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"26"=20
CONTEXT=3D"How to configure correct rules "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">rules</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"32"=20
CONTEXT=3D"How to configure correct rules for "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">for</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"36"=20
CONTEXT=3D"How to configure correct rules for these "><SPAN lang=3DEN-GB =

style=3D"mso-ansi-language: EN-GB">these</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"42"=20
CONTEXT=3D"How to configure correct rules for these ports?&#13;"><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">ports</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">?<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><st1:data =
language=3D0 STARTPOS=3D"1"=20
CONTEXT=3D"Thank =
?????????????????????????????????????????????????????????????????????????=
?????????????????????????????????????????????????????? for your time and =
advice.&#13;"><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: =
EN-GB">Thank</SPAN></st1:data><SPAN=20
lang=3DEN-GB style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data =
language=3D0=20
STARTPOS=3D"7" CONTEXT=3D"Thank you for your time and =
advice.&#13;"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">you</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"11"=20
CONTEXT=3D"Thank you for your time and advice.&#13;"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">for</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"12"=20
CONTEXT=3D"Thanks for your "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">your</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"17"=20
CONTEXT=3D"Thanks for your time "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">time</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"22"=20
CONTEXT=3D"Thanks for your time and "><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">and</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"> </SPAN><st1:data language=3D0 =
STARTPOS=3D"26"=20
CONTEXT=3D"Thanks for your time and advice.&#13;"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB">advice.</SPAN></st1:data><SPAN =
lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: EN-GB"><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DEN-GB=20
style=3D"mso-ansi-language: =
EN-GB">Karl<o:p></o:p></SPAN></P></DIV></DIV></BODY></HTML>

------=_NextPart_000_000D_01C29BCC.3F8E28B0--



