From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: Bad argument `53'
Date: Wed, 9 Oct 2002 21:17:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002a01c27003$2c9d14e0$0201a8c0@com>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0027_01C26FD9.42B2DDC0"
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

------=_NextPart_000_0027_01C26FD9.42B2DDC0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Everyone



By reading New Riders =93Linux Firewalls=94 by Robert L. Ziegler I=92m =
just starting to study iptables.  I have a stand-alone firewall offline =
and off the local network running RHL 7.3 with Kernel 2.4.18-3 and =
iptables 1.2.5.

=20

I=92ve just started writing the script to allow DNS Loopkups as a client =
with the following:

=20

if [ "$CONNECTION_TRACKING" =3D "1" ]; then

    iptables -A OUTPUT -o $INTERNET -p udp \

             -s $IPADDR --sport $UNPRIVPORTS \

             -d $NAMESERVER --dport 53 \

             -m state --state NEW -j ACCEPT

fi

=20

iptables -A OUTPUT -o $INTERNET -p udp \

         -s $IPADDR --sport $UNPRIVPORTS \

         -d $NAMESERVER --dport 53 -j ACCEPT

=20

iptables -A INPUT  -i $INTERNET -p udp \

         -s $NAMESERVER --sport 53 \

         -d $IPADDR --dport $UNPRIVPORTS -j ACCEPT

=20

When I execute the script with sh /etc/rc.d/rc.firewalls I receive Bad =
argument `53' for every instance of either  --dport 53 or --sport 53.  =
I=92ve also tried --destination-port and --source-port with out any =
success.

=20

Can anyone shed some light on my problem?

Dave
------=_NextPart_000_0027_01C26FD9.42B2DDC0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DArial =
size=3D2>Hello=20
Everyone</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DArial=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT size=3D2>By=20
reading New Riders =93Linux Firewalls=94 by Robert L. Ziegler I=92m just =
starting to=20
study iptables.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>I have a=20
stand-alone firewall offline and off the local network running RHL 7.3 =
with=20
Kernel 2.4.18-3 and iptables 1.2.5.</FONT></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
size=3D2>&nbsp;<?xml:namespace prefix =3D o ns =3D=20
"urn:schemas-microsoft-com:office:office" =
/><o:p></o:p></FONT></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DArial =
size=3D2>I=92ve just=20
started writing the script to allow DNS Loopkups as a client with the=20
following:</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
size=3D2>&nbsp;<o:p></o:p></FONT></FONT></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial>if [=20
"$CONNECTION_TRACKING" =3D "1" ]; then<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT =
-o=20
$INTERNET -p udp \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-s $IPADDR --sport $UNPRIVPORTS \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-d $NAMESERVER --dport 53 \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-m state --state NEW -j ACCEPT<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
face=3DArial>fi<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial>iptables -A=20
OUTPUT -o $INTERNET -p udp \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>-s $IPADDR --sport $UNPRIVPORTS \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>-d $NAMESERVER --dport 53 -j ACCEPT<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial>iptables -A=20
INPUT<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>-i $INTERNET -p udp =

\<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>-s $NAMESERVER --sport 53 \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>-d $IPADDR --dport $UNPRIVPORTS -j =
ACCEPT<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DArial =
size=3D2>When I=20
execute the script with sh /etc/rc.d/rc.firewalls I receive Bad argument =
`53'=20
for every instance of either<SPAN style=3D"mso-spacerun: yes">&nbsp;=20
--</SPAN>dport 53 or --sport 53.<SPAN style=3D"mso-spacerun: yes">&nbsp; =

</SPAN>I=92ve also tried --destination-port and --source-port with out =
any=20
success.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
size=3D2>&nbsp;<o:p></o:p></FONT></FONT></P>
<DIV><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
face=3DArial size=3D2>Can anyone shed some light on my =
problem?</FONT></SPAN></DIV>
<DIV><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
face=3DArial size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
face=3DArial size=3D2>Dave</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0027_01C26FD9.42B2DDC0--


