From: "Richard Gutery" <rgutery@MentorITS.com>
Subject: (no subject)
Date: Tue, 29 Jun 2004 07:19:05 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1B5A52EE434FEB48AA4803AD84BD3FC30552E5@goliath.tngnet.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C45DDB.A722EFB0"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C45DDB.A722EFB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 I am form the Microsoft and OpenBSD world and have recently begun using =
RH7.3 for my firewall.=20
=20
I need to block an Internet Address.=20
=20
In OpenBSD I would use -> 'block out quick on ethx ...'=20
=20
I have theses two rules in my iptables file:=20
=20
$IPT -t filter -A INPUT  -p tcp -s 0/0 -d 64.246.26.185  --dport 80 -m =
limit --limit 2/minute -j $STOP=20
$IPT -t filter -A OUTPUT -p tcp -s 64.246.26.185 -d 0/0  --dport 80 -m =
limit --limit 2/minute -j $STOP=20
=20
$STOP and $IPT are macro substitutions that works for everything else,=20
so I know that's not the problem.=20
=20
What am I missing?
=20
RG

------_=_NextPart_001_01C45DDB.A722EFB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<STYLE>P.msoNormal {
	FONT-WEIGHT: normal; FONT-SIZE: 12pt; MARGIN-LEFT: 78px; COLOR: =
#cccccc; FONT-FAMILY: "Georgia", "serif"
}
LI.msoNormal {
	FONT-WEIGHT: normal; FONT-SIZE: 12pt; MARGIN-LEFT: 78px; COLOR: =
#cccccc; FONT-FAMILY: "Georgia", "serif"
}
BODY {
	FONT-SIZE: 12pt; MARGIN-LEFT: 78px; COLOR: #000000; BACKGROUND-REPEAT: =
repeat-y; FONT-FAMILY: Garamond; BACKGROUND-COLOR: #ffffff
}
A {
	COLOR: #b55a10
}
HR {
	WIDTH: 100%; COLOR: #293139; HEIGHT: 4px
}
</STYLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY=20
style=3D"FONT-SIZE: 12pt; COLOR: #000000; FONT-FAMILY: Garamond; =
BACKGROUND-COLOR: #ffffff"=20
bgColor=3D#ffffff=20
background=3D"file://C:\Documents and =
Settings\rgutery.TNGNET\Application =
Data\Microsoft\Stationery\JudgesCh.gif">
<DIV>&nbsp;<SPAN class=3D484131813-29062004>I </SPAN>am form the =
Microsoft and=20
OpenBSD world and have recently begun using RH7.3 for my firewall. =
</DIV>
<DIV>&nbsp;</DIV>
<DIV>I need to block an Internet Address. </DIV>
<DIV>&nbsp;</DIV>
<DIV>In OpenBSD I would use -&gt; 'block out quick on ethx ...' </DIV>
<DIV>&nbsp;</DIV>
<DIV>I have theses two rules in my iptables file: </DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPT -t filter -A INPUT&nbsp; -p tcp -s 0/0 -d 64.246.26.185&nbsp; =
--dport=20
80 -m limit --limit 2/minute -j $STOP <BR>$IPT -t filter -A OUTPUT -p =
tcp -s=20
64.246.26.185 -d 0/0&nbsp; --dport 80 -m limit --limit 2/minute -j $STOP =
</DIV>
<DIV>&nbsp;</DIV>
<DIV>$STOP and $IPT are macro substitutions that works for everything =
else,=20
<BR>so I know that's not the problem. </DIV>
<DIV>&nbsp;</DIV>
<DIV>What am I missing<SPAN class=3D484131813-29062004>?</SPAN></DIV>
<DIV><SPAN class=3D484131813-29062004></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D484131813-29062004>RG</SPAN></DIV></BODY></HTML>

------_=_NextPart_001_01C45DDB.A722EFB0--

