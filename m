From: "Manny G. Fernandez" <mfernandez@itsecur.com>
Subject: Logging Questions
Date: Thu, 12 Aug 2004 20:43:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FB92A0C3C659594FA37C4DA4124DA5F6059A54@pollux.itsecur.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C480CE.94E355C7"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

------_=_NextPart_001_01C480CE.94E355C7
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good day,
=20
I have been running netfilter for a few years now.  Right now I am pullin=
g my logs into an application called Sawmill (www.sawmill.net) it underst=
ands native iptables logs.  This application, like other parsers, can onl=
y report on info that is in the log.  I would like to be able to pull rep=
orts with protocol breakdown and amount of certain traffic, e.g. how much=
 SMTP went out vs. how much came in.
=20
I use a custom made webmin module to configure rules, if I edit the iptab=
les file this is what I see for logging:=20
=20
-log-prefix RULE_1:ACCEPT:
-log-prefix RULE_10:DROP:
=20
Is there a way to log more information about the traffic as stated above =
by adding to these lines or do I need another package to do this.
=20
Checkpoint FW-1 has a 'log' option and a 'accounting'. Accounting gives m=
ore information regarding traffic stats.
=20
I read on the lists that people have created a new chain and logged it th=
at way, but I am not sure what can be done.
=20
Thanks in advance
=20
Manny
=20
    =20
*************************************************************************=
*************************
The contents of this email and any attachments are confidential.
They are intended for the named recipient(s) only.
If you have received this email in error please notify the system manager=
 or  the=20
sender immediately and do not disclose the contents to anyone or make cop=
ies.

** eSafe scanned this email for viruses, vandals and malicious content. *=
*
*************************************************************************=
*************************
------_=_NextPart_001_01C480CE.94E355C7
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><HTML DIR=3D=
ltr><HEAD><META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=
=3Diso-8859-1"></HEAD><BODY>
<DIV id=3DidOWAReplyText84704 dir=3Dltr>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">Good=20
day,</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">I have =
been=20
running netfilter for a few years now.&nbsp; Right now I am pulling my lo=
gs into=20
an application called Sawmill (<A=20
href=3D"/exchweb/bin/redir.asp?URL=3Dhttp://www.sawmill.net"=20
target=3D_blank>www.sawmill.net</A>) it understands native iptables logs.=
&nbsp;=20
This application, like other parsers, can only report on info that is in =
the=20
log.&nbsp; I would like to be able to pull reports with protocol breakdow=
n and=20
amount of certain traffic, e.g. how much SMTP went out vs. how much came=20
in.</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">I use a=
 custom=20
made webmin module to configure rules, if I edit the&nbsp;iptables file t=
his is=20
what I see for logging:&nbsp;</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">-log-pr=
efix=20
RULE_1:ACCEPT:</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">-log-pr=
efix=20
RULE_10:DROP:</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">Is ther=
e a way=20
to log more information about the traffic as stated above by adding to th=
ese=20
lines or do I need another package to do=20
this.</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">Checkpo=
int FW-1=20
has a 'log' option and a 'accounting'. Accounting gives more information=20
regarding traffic stats.</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">I read =
on the=20
lists that people have created a new chain and logged it that way, but I =
am not=20
sure what can be done.</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">Thanks =
in=20
advance</SPAN></FONT></SPAN></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial"></SPAN>=
</FONT></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DA=
rial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT face=3DArial size=3D2=
><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-STYLE: italic; FONT-FAMILY: Arial">Manny</=
SPAN></FONT></DIV></SPAN></FONT></FONT></FONT></DIV>
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;<=
/DIV></DIV>
<DIV id=3DidSignature30522 dir=3Dltr>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>
<DIV class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><STRONG>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;</STRONG></SPAN></FONT></DIV></FONT></DIV></DIV>
<FONT SIZE=3D3 COLOR=3DBLUE><PRE>
*************************************************************************=
*************************
The contents of this email and any attachments are confidential.
They are intended for the named recipient(s) only.
If you have received this email in error please notify the system manager=
 or  the=20
sender immediately and do not disclose the contents to anyone or make cop=
ies.

** eSafe scanned this email for viruses, vandals and malicious content. *=
*
*************************************************************************=
*************************
</PRE></FONT>
</BODY></HTML>
------_=_NextPart_001_01C480CE.94E355C7--

