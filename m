From: "jesse.linux" <jdelima@inq7.net>
Subject: Re: IPTables not available
Date: Wed, 26 Jun 2002 10:32:02 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <004601c21cb9$a9482400$2400a8c0@inq7.net>
References: <20020625174406.9A4D9489B@lists.samba.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0043_01C21CFC.B59E9340"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org
Cc: dcurry@cariocas.com

This is a multi-part message in MIME format.

------=_NextPart_000_0043_01C21CFC.B59E9340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Date: Tue, 25 Jun 2002 08:20:43 -0700
From: "Daniel Curry" <dcurry@cariocas.com>
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>

On fresh RH7.2 and RH7.3 installs  IPTables executables are installed,
but will not execute.  I get Kernel errors.  Can someone please direct
me to a listing of what steps and option I need to enable this?  I wish
to put firewalling with NAT services on a machine running an Apache web
server, with PHP and Perl scripts connecting to a localhosted MySQL DB,
as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN
services.  Or a compatible ipchains script for this would also be
appreciated.

Thanks

Daniel Curry
IT Manager
Cariocas
625 Second Street=3D20
Suite 201
San Francisco, CA 94107=3D20
ph: 415-348-6516
fx: 415-348-6505=3D20
cell: 510-579-6680

"If A equals success, then the formula is: A =3D3D X + Y + Z,=3D20
X is work. Y is play. Z is keep your mouth shut."=3D20
  - Albert Einstein

maybe ipchains is your problem.....
try to unload ipchains then execute your iptables rules......



------=_NextPart_000_0043_01C21CFC.B59E9340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4912.300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff><FONT face=3DArial size=3D2></FONT>
<DIV><BR>Date: Tue, 25 Jun 2002 08:20:43 -0700<BR>From: "Daniel Curry" =
&lt;<A=20
href=3D"mailto:dcurry@cariocas.com">dcurry@cariocas.com</A>&gt;<BR>To: =
"Netfilter=20
(E-mail)" &lt;<A=20
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A>&g=
t;<BR><BR>On=20
fresh RH7.2 and RH7.3 installs&nbsp; IPTables executables are =
installed,<BR>but=20
will not execute.&nbsp; I get Kernel errors.&nbsp; Can someone please=20
direct<BR>me to a listing of what steps and option I need to enable =
this?&nbsp;=20
I wish<BR>to put firewalling with NAT services on a machine running an =
Apache=20
web<BR>server, with PHP and Perl scripts connecting to a localhosted =
MySQL=20
DB,<BR>as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP=20
VPN<BR>services.&nbsp; Or a compatible ipchains script for this would =
also=20
be<BR>appreciated.<BR><BR>Thanks<BR><BR>Daniel Curry<BR>IT=20
Manager<BR>Cariocas<BR>625 Second Street=3D20<BR>Suite 201<BR>San =
Francisco, CA=20
94107=3D20<BR>ph: 415-348-6516<BR>fx: 415-348-6505=3D20<BR>cell:=20
510-579-6680<BR><BR>"If A equals success, then the formula is: A =3D3D X =
+ Y +=20
Z,=3D20<BR>X is work. Y is play. Z is keep your mouth =
shut."=3D20<BR>&nbsp; - Albert=20
Einstein</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>maybe ipchains is your =
problem.....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>try to unload ipchains then execute =
your iptables=20
rules......</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><BR>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0043_01C21CFC.B59E9340--


