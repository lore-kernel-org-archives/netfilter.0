From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: (no subject)
Date: Fri, 30 Apr 2004 17:10:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405010010.i410AG2v029967@server5.bandwidthco.com>
References: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2B1C@ftrdmel2.rd.francetelecom.fr>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002D_01C42ED6.03067390"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2B1C@ftrdmel2.rd.francetelecom.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'zze-KHOURY Jad FTRD/DMI/CAE' <jad.khoury@rd.francetelecom.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_002D_01C42ED6.03067390
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=20

  _____ =20

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of zze-KHOURY Jad
FTRD/DMI/CAE
Sent: Friday, April 30, 2004 1:33 AM
To: netfilter@lists.netfilter.org
Subject: (no subject)



Hi,=20
 I'm having some problems finding how to log ONLY iptable log messages =
to
another file other than messages. So I made some changes in the
"sylsog.conf" file by adding: kern.warning /var/log/firewall since the
Default log level entry is" warning". But I still reveive some message =
other
than the packets, from the kernel itself!

 how can I limit the input messages to only Netfilter packets?=20
What should I change in the syslog.conf file If I don't want to receive
Netfilter messages in this file?=20
 =20

regards=20
Jad =20

=20

           To isolate firewall log messages into a separate or dedicated
file. By default, netfilter logs to the kern.info syslog facility. This
places all the firewall log messages into /var/log/messages along with =
all
other kernel messages. This behavior is not exceedingly friendly for
firewall log parsing and analysis. However, since the Linux kernel logs =
very
little by default at the =93debug=94 level, there is an easy solution. =
Follow
these steps:

=20

=A7         Set logging level to =93debug=94 in the firewall script:

=20

LOG_LEVEL=3D"debug"

=20

=A7         Place the LOG_LEVEL variable in rule sets for all packets to =
be
logged:

=20

-j LOG --log-level $LOG_LEVEL

=20

=A7         Tell syslog to log only kernel.debug messages to the =
firewall log
file:

=20

kern.=3Ddebug
/var/log/iptables/iptables.log

=20

=A7         Tell syslog not to place firewall messages into =
/var/log/messages:

=20

*.*;kern.!=3Ddebug        /var/log/messages

=20

=A7         Restart syslog: ./etc/init.d/syslog restart

=20


------=_NextPart_000_002D_01C42ED6.03067390
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of =
</B>zze-KHOURY Jad=20
FTRD/DMI/CAE<BR><B>Sent:</B> Friday, April 30, 2004 1:33 =
AM<BR><B>To:</B>=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> (no=20
subject)<BR></FONT><BR></DIV>
<DIV></DIV><!-- Converted from text/rtf format -->
<P><FONT face=3DArial size=3D2>Hi,</FONT> <BR><FONT face=3DArial =
size=3D2>&nbsp;I'm=20
having some problems finding how to log ONLY iptable log messages to =
another=20
file other than messages. So I made some changes in the "sylsog.conf" =
file by=20
adding:<B> kern.warning /var/log/firewall</B> since the Default log =
level entry=20
is" warning". But I still reveive some message other than the packets, =
from the=20
kernel itself!</FONT></P>
<P><FONT face=3DArial size=3D2>&nbsp;how can I limit the input messages =
to only=20
Netfilter packets?</FONT> <BR><FONT face=3DArial size=3D2>What should I =
change in=20
the syslog.conf file If I don't want to receive Netfilter messages in =
this=20
file?</FONT> <BR><FONT face=3DArial size=3D2>&nbsp;</FONT> </P>
<P><FONT face=3DArial size=3D2>regards</FONT> <BR><FONT =
face=3DArial><FONT=20
size=3D2>Jad&nbsp;<SPAN class=3D122060900-01052004><FONT=20
color=3D#0000ff>&nbsp;</FONT></SPAN></FONT></FONT></P>
<P><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D122060900-01052004></SPAN></FONT></FONT>&nbsp;</P><FONT =
face=3DArial><FONT=20
size=3D2><SPAN class=3D122060900-01052004>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 0.5in; TEXT-INDENT: -0.5in; TEXT-ALIGN: =
justify; mso-list: l0 level1 lfo1; tab-stops: list .5in left 1.0in 1.5in =
2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><FONT size=3D3><SPAN=20
class=3D122060900-01052004>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;To=20
i</SPAN>solate firewall log messages into a separate or dedicated file. =
By=20
default, netfilter logs to the <B style=3D"mso-bidi-font-weight: =
normal">kern.info=20
</B>syslog facility. This places all the firewall log messages into=20
/var/log/messages along with all other kernel messages. This behavior is =
not=20
exceedingly friendly for firewall log parsing and analysis. However, =
since the=20
Linux kernel logs very little by default at the =93debug=94 level, there =
is an easy=20
solution. Follow these steps:<?xml:namespace prefix =3D o ns =3D=20
"urn:schemas-microsoft-com:office:office" =
/><o:p></o:p></FONT></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt; TEXT-ALIGN: justify; tab-stops: 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 0.75in; TEXT-INDENT: -0.25in; TEXT-ALIGN: =
justify; mso-list: l2 level1 lfo2; tab-stops: list .75in left 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black; FONT-FAMILY: Wingdings; mso-fareast-font-family: =
Wingdings; mso-bidi-font-family: Wingdings"><SPAN=20
style=3D"mso-list: Ignore"><FONT size=3D3>=A7</FONT><SPAN=20
style=3D"FONT: 7pt 'Times New =
Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN style=3D"COLOR: black"><FONT size=3D3>Set =
logging level=20
to =93debug=94 in the firewall script:<o:p></o:p></FONT></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt; TEXT-ALIGN: justify; tab-stops: 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 1in; TEXT-ALIGN: justify; tab-stops: 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-SIZE: 11pt; COLOR: =
black">LOG_LEVEL=3D"debug"</SPAN></B><SPAN=20
style=3D"FONT-SIZE: 11pt; COLOR: black"><o:p></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt; TEXT-ALIGN: justify; tab-stops: 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 0.75in; TEXT-INDENT: -0.25in; TEXT-ALIGN: =
justify; mso-list: l4 level1 lfo3; tab-stops: list .75in left 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black; FONT-FAMILY: Wingdings; mso-fareast-font-family: =
Wingdings; mso-bidi-font-family: Wingdings"><SPAN=20
style=3D"mso-list: Ignore"><FONT size=3D3>=A7</FONT><SPAN=20
style=3D"FONT: 7pt 'Times New =
Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN style=3D"COLOR: black"><FONT size=3D3>Place =
the LOG_LEVEL=20
variable in rule sets for all packets to be logged:<B=20
style=3D"mso-bidi-font-weight: normal"><o:p></o:p></B></FONT></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 0.5in; TEXT-ALIGN: justify; tab-stops: =
1.0in 1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN =

style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 1in; TEXT-ALIGN: justify; tab-stops: 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-SIZE: 11pt; COLOR: black">-j LOG --log-level=20
$LOG_LEVEL<o:p></o:p></SPAN></B></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt; TEXT-ALIGN: justify; tab-stops: .5in 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt 0.75in; TEXT-INDENT: -0.25in; TEXT-ALIGN: =
justify; mso-list: l1 level1 lfo4; tab-stops: list .75in left 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black; FONT-FAMILY: Wingdings; mso-fareast-font-family: =
Wingdings; mso-bidi-font-family: Wingdings"><SPAN=20
style=3D"mso-list: Ignore"><FONT size=3D3>=A7</FONT><SPAN=20
style=3D"FONT: 7pt 'Times New =
Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN style=3D"COLOR: black"><FONT size=3D3>Tell =
syslog to log=20
only kernel.debug messages to the firewall log=20
file:<o:p></o:p></FONT></SPAN></P>
<P class=3DStyle0=20
style=3D"MARGIN: 0in 0in 0pt; TEXT-ALIGN: justify; tab-stops: .5in 1.0in =
1.5in 2.0in 2.5in 3.0in 3.5in 4.0in 4.5in 5.0in 5.5in 6.0in"><SPAN=20
style=3D"COLOR: black"><o:p><FONT =
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt 1in; mso-layout-grid-align: none"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Arial; mso-bidi-font-family: =
'Times New Roman'">kern.=3Ddebug<SPAN=20
style=3D"mso-tab-count: =
4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
</SPAN>/var/log/iptables/iptables.log<o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-FAMILY: Arial; mso-bidi-font-family: 'Times New =
Roman'"><o:p><FONT=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt 0.75in; TEXT-INDENT: -0.25in; mso-list: l5 =
level1 lfo5; tab-stops: list .75in; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-FAMILY: Wingdings; mso-fareast-font-family: Wingdings; =
mso-bidi-font-family: Wingdings"><SPAN=20
style=3D"mso-list: Ignore"><FONT size=3D3>=A7</FONT><SPAN=20
style=3D"FONT: 7pt 'Times New =
Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D"FONT-FAMILY: Arial; mso-bidi-font-family: 'Times New =
Roman'"><FONT=20
size=3D3>Tell syslog not to place firewall messages into=20
/var/log/messages:<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt; =
mso-layout-grid-align: none"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-FAMILY: Arial; mso-bidi-font-family: 'Times New =
Roman'"><o:p><FONT=20
size=3D3>&nbsp;</FONT></o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt 1in; mso-layout-grid-align: none"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Arial; mso-bidi-font-family: =
'Times New Roman'">*.*;kern.!=3Ddebug<SPAN=20
style=3D"mso-tab-count: 1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>/var/log/messages<o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt; =
mso-layout-grid-align: none"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D"FONT-SIZE: 8pt; FONT-FAMILY: Arial; mso-bidi-font-family: =
'Times New Roman'; mso-bidi-font-size: =
12.0pt"><o:p>&nbsp;</o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt 0.75in; TEXT-INDENT: -0.25in; mso-list: l3 =
level1 lfo6; tab-stops: list .75in; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-FAMILY: Wingdings; mso-fareast-font-family: Wingdings; =
mso-bidi-font-family: Wingdings"><SPAN=20
style=3D"mso-list: Ignore"><FONT size=3D3>=A7</FONT><SPAN=20
style=3D"FONT: 7pt 'Times New =
Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D"FONT-FAMILY: Arial; mso-bidi-font-family: 'Times New =
Roman'"><FONT=20
size=3D3>Restart syslog:<B style=3D"mso-bidi-font-weight: normal">=20
./etc/init.d/syslog restart<o:p></o:p></B></FONT></SPAN></P>
<P>&nbsp;</SPAN></FONT></FONT></P></BODY></HTML>

------=_NextPart_000_002D_01C42ED6.03067390--



