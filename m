From: "wickedsun" <wickedsun@phreaker.net>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Thu, 5 Sep 2002 18:00:25 -0400 (Eastern Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D77D3F9.000003.00568@athlon1000>
References: <200209051832.g85IWIv01221@vulcan.rissington.net>
Mime-Version: 1.0
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_PSJZG6G0000000000000"
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


--------------Boundary-00=_PSJZG6G0000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've had this issue back in the ipchains days. :)=0D
Its quite simple. If you make iptables change your destination IP for a
certain port (like the module for FTP used to do in 2.2) well passive doe=
s
not work because it changes your IP address on the fly. If you have made =
a
port work for active, passive will not work on that same port.=0D
=0D
I dont think there is any workaround (yet). It is a pain, because if you
want to FTP and FXP from a port X, you'll have to stay in passive mode.=0D
=0D
 =0D
-------Original Message-------=0D
 =0D
From: Antony Stone=0D
Date: Thursday, September 05, 2002 14:56:10=0D
To: netfilter@lists.netfilter.org=0D
Subject: Re: ftp server issue, trying to DL 1.2.7a=0D
 =0D
On Thursday 05 September 2002 6:29 pm, Rob wrote:=0D
=0D
> Anyone else having this problem?=0D
>=0D
>=0D
> Connected to ftp.iptables.org (62.128.28.62).=0D
> 220 ProFTPD 1.2.5rc1 Server (netfilter/iptables FTP site) [kashyyyk]=0D
> Name (ftp.iptables.org:root): anonymous=0D
> 331 Anonymous login ok, send your complete email address as your passwo=
rd.=0D
> Password:=0D
> 230 Anonymous access granted, restrictions apply.=0D
> Remote system type is UNIX.=0D
> Using binary mode to transfer files.=0D
> ftp> dir=0D
> 227 Entering Passive Mode (62,128,28,62,182,53).=0D
=0D
Works fine for me in active mode:=0D
=0D
drwxr-xr-x 2 ftpuser ftpgroup 4096 Jul 22 14:45 incoming=0D
drwxr-xr-x 7 ftpuser ftpgroup 4096 Jul 24 07:36 pub=0D
=0D
But like you, I can't get a listing in passive mode.....=0D
=0D
Antony.=0D
=0D
-- =0D
=0D
This email was created using 100% recycled electrons.=0D
=0D
=0D
=2E=20
--------------Boundary-00=_PSJZG6G0000000000000
Content-Type: Text/HTML;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-=
1">
<META content=3D"IncrediMail 1.0" name=3DGENERATOR>
<!--IncrdiXMLRemarkStart>
<IncrdiX-Info>
<X-FID>FLAVOR00-NONE-0000-0000-000000000000</X-FID>
<X-FVER></X-FVER>
<X-CNT>;</X-CNT>
</IncrdiX-Info>
<IncrdiXMLRemarkEnd-->
</HEAD>
<BODY style=3D"BACKGROUND-POSITION: 0px 0px; FONT-SIZE: 12pt; MARGIN: 5px=
 10px 10px; FONT-FAMILY: Arial" bgColor=3D#ffffff background=3D"" scroll=3D=
yes ORGYPOS=3D"0" X-FVER=3D"3.0">
<TABLE id=3DINCREDIMAINTABLE cellSpacing=3D0 cellPadding=3D2 width=3D"100=
%" border=3D0>
<TBODY>
<TR>
<TD id=3DINCREDITEXTREGION style=3D"FONT-SIZE: 12pt; CURSOR: auto; FONT-F=
AMILY: Arial" width=3D"100%">
<DIV>I've had this issue back in the ipchains days. :)</DIV>
<DIV>Its quite simple. If you make iptables change your destination IP fo=
r a certain port (like the module for FTP used to do in 2.2) well passive=
 does not work because it changes your IP address on the fly. If you have=
 made a port work for active, passive will not work on that same port.</D=
IV>
<DIV>&nbsp;</DIV>
<DIV>I dont think there is any workaround (yet). It is a pain, because if=
 you want to FTP and FXP from a port X, you'll have to stay in passive mo=
de.</DIV>
<DIV><BR>&nbsp;</DIV>
<DIV id=3DIncrediOriginalMessage><I>-------Original Message-------</I></D=
IV>
<DIV>&nbsp;</DIV>
<DIV id=3Dreceivestrings>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>From:</B></I> <A href=3D"m=
ailto:Antony@Soft-Solutions.co.uk">Antony Stone</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Date:</B></I> Thursday, Se=
ptember 05, 2002 14:56:10</DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>To:</B></I> <A href=3D"mai=
lto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</A></DIV=
>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Subject:</B></I> Re: ftp s=
erver issue, trying to DL 1.2.7a</DIV></DIV>
<DIV>&nbsp;</DIV>On Thursday 05 September 2002 6:29 pm, Rob wrote:<BR><BR=
>&gt; Anyone else having this problem?<BR>&gt;<BR>&gt;<BR>&gt; Connected =
to ftp.iptables.org (62.128.28.62).<BR>&gt; 220 ProFTPD 1.2.5rc1 Server (=
netfilter/iptables FTP site) [kashyyyk]<BR>&gt; Name (ftp.iptables.org:ro=
ot): anonymous<BR>&gt; 331 Anonymous login ok, send your complete email a=
ddress as your password.<BR>&gt; Password:<BR>&gt; 230 Anonymous access g=
ranted, restrictions apply.<BR>&gt; Remote system type is UNIX.<BR>&gt; U=
sing binary mode to transfer files.<BR>&gt; ftp&gt; dir<BR>&gt; 227 Enter=
ing Passive Mode (62,128,28,62,182,53).<BR><BR>Works fine for me in activ=
e mode:<BR><BR>drwxr-xr-x 2 ftpuser ftpgroup 4096 Jul 22 14:45 incoming<B=
R>drwxr-xr-x 7 ftpuser ftpgroup 4096 Jul 24 07:36 pub<BR><BR>But like you=
, I can't get a listing in passive mode.....<BR><BR>Antony.<BR><BR>-- <BR=
><BR>This email was created using 100% recycled electrons.<BR><BR><BR>. <=
/TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE></BODY></HTML>
--------------Boundary-00=_PSJZG6G0000000000000--


