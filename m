From: "Christian Gmeiner" <christian@visual-page.de>
Subject: Problem with passiv FTP
Date: Wed, 25 Feb 2004 22:00:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c3fbe2$6306b330$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C3FBEA.C3F94C40"
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

------=_NextPart_000_0012_01C3FBEA.C3F94C40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi people.

I got active FTP working, but i also need the passive one.

Here is my stuff:

    # Port 21

    iptables -A INPUT     -p tcp --sport 21 -m state --state ESTABLISHED =
-j ACCEPT=20
    iptables -A OUTPUT -p tcp --dport 21 -m state --state =
NEW,ESTABLISHED -j ACCEPT=20

    # aktiv - works
    iptables -A INPUT     -p tcp --sport 20 -m state --state =
ESTABLISHED,RELATED -j ACCEPT=20
    iptables -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j =
ACCEPT=20

    # passiv
    iptables -A INPUT     -p tcp --sport ${UNPRIVPORTS} --dport =
${UNPRIVPORTS}  -m state --state ESTABLISHED -j ACCEPT=20
    iptables -A OUTPUT -p tcp --sport ${UNPRIVPORTS} --dport =
${UNPRIVPORTS}  -m state --state ESTABLISHED,RELATED -j ACCEPT=20

I have everything set to drop and i am alowing this protocols and ports:

# TCP in+out
#
#
TCP_IN_OUT=3D"ssh"

# TCP out
#
# 5190 =3D ICQ
#
TCP_OUT=3D"5190 http https 25 ftp ftp-data pop3 smtp"

# TCP in
#
TCP_IN=3D""

# UDP in+out
#
UDP_IN_OUT=3D"domain ssh"

# UDP out
#
#
UDP_OUT=3D"https"

# UDP in
#
UDP_IN=3D""

UNPRIVPORTS=3D"1024:65535"

So.. i must now allow the UNPRIVPORTS, but how i am doing this?

Thanks, Christian Gmeiner
------=_NextPart_000_0012_01C3FBEA.C3F94C40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi people.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I got active FTP working, but i also =
need the=20
passive one.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is my stuff:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # Port =
21</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -A=20
INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport 21 -m state --state =
ESTABLISHED -j=20
ACCEPT <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --dport 21 -m =
state=20
--state NEW,ESTABLISHED -j ACCEPT </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # aktiv -=20
works<BR>&nbsp;&nbsp;&nbsp; iptables -A INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p =
tcp=20
--sport 20 -m state --state ESTABLISHED,RELATED -j ACCEPT =
<BR>&nbsp;&nbsp;&nbsp;=20
iptables -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j =
ACCEPT=20
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # =
passiv<BR>&nbsp;&nbsp;&nbsp;=20
iptables -A INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport ${UNPRIVPORTS} =
--dport=20
${UNPRIVPORTS}&nbsp; -m state --state ESTABLISHED -j ACCEPT=20
<BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --sport ${UNPRIVPORTS} =
--dport=20
${UNPRIVPORTS}&nbsp; -m state --state ESTABLISHED,RELATED -j ACCEPT=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have everything set to drop and i am =
alowing this=20
protocols and ports:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># TCP=20
in+out<BR>#<BR>#<BR>TCP_IN_OUT=3D"ssh"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># TCP out<BR>#<BR># 5190 =3D=20
ICQ<BR>#<BR>TCP_OUT=3D"5190 http https 25 ftp ftp-data pop3 =
smtp"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># TCP =
in<BR>#<BR>TCP_IN=3D""</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># UDP =
in+out<BR>#<BR>UDP_IN_OUT=3D"domain=20
ssh"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># UDP =
out<BR>#<BR>#<BR>UDP_OUT=3D"https"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># UDP =
in<BR>#<BR>UDP_IN=3D""</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>UNPRIVPORTS=3D"1024:65535"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So.. i must now allow the UNPRIVPORTS, =
but how i am=20
doing this?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks, Christian=20
Gmeiner</FONT></DIV></BODY></HTML>

------=_NextPart_000_0012_01C3FBEA.C3F94C40--



