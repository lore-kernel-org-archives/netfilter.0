From: "wickedsun" <wickedsun@phreaker.net>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Sat, 7 Sep 2002 11:33:36 -0400 (Eastern Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7A1C50.000001.00620@athlon1000>
References: <3D79FC89.9070001@fugmann.dhs.org>
Mime-Version: 1.0
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_08R2QL80000000000000"
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
To: afu@fugmann.dhs.org
Cc: netfilter@lists.netfilter.org


--------------Boundary-00=_08R2QL80000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ahh yes, that makes sense. It's behaving like the old ip_masq_ftp module.
Thanks for the info, again ;)=0D
=0D
Charles=0D
 =0D
-------Original Message-------=0D
 =0D
From: Anders Fugmann=0D
Date: Saturday, September 07, 2002 10:27:31 AM=0D
To: wickedsun=0D
Cc: netfilter@lists.netfilter.org=0D
Subject: Re: ftp server issue, trying to DL 1.2.7a=0D
 =0D
wickedsun wrote:=0D
> FTP Issues, round 2.=0D
> =0D
> =0D
> With further testing, I've noticed that it doesnt quite work. For some =
=0D
> unknown reason, it *seems* to work on port 21, but doesnt on other =0D
Seems or does?=0D
=0D
> ports. From what I understood in your post, you said it would work on =0D
> any port. (FTP, of course).=0D
=0D
> =0D
No. The ftp connection tracking module only monitors on port 21. Because =
=0D
it has to examine all packets beeing send though, it would simple be too =
=0D
much work to monitor any connection made. If you want it to monitor =0D
other ports also, you can compile the ftp connection tracking as a =0D
module, and then use:=0D
modprobe ip_conntrack_ftp 21,5006=0D
to let it listen on ports 21 and 5006.=0D
=0D
I do not know if there is any way to make this work with =0D
ftp_connection_tracking statically compiled in the kernel.=0D
=0D
Regards=0D
Anders Fugmann=0D
=0D
-- =0D
Author of FIAIF=0D
FIAIF Is An Intelligent Firewall=0D
http://fiaif.fugmann.dhs.org=0D
=0D
=0D
=0D
=2E=20
--------------Boundary-00=_08R2QL80000000000000
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
<DIV>Ahh yes, that makes sense.&nbsp;It's behaving like the old&nbsp;ip_m=
asq_ftp module. Thanks for the info,&nbsp;again ;)</DIV>
<DIV>&nbsp;</DIV>
<DIV>Charles<BR>&nbsp;</DIV>
<DIV id=3DIncrediOriginalMessage><I>-------Original Message-------</I></D=
IV>
<DIV>&nbsp;</DIV>
<DIV id=3Dreceivestrings>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>From:</B></I> <A href=3D"m=
ailto:afu@fugmann.dhs.org">Anders Fugmann</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Date:</B></I> Saturday, Se=
ptember 07, 2002 10:27:31 AM</DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>To:</B></I> <A href=3D"mai=
lto:wickedsun@phreaker.net">wickedsun</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Cc:</B></I> <A href=3D"mai=
lto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</A></DIV=
>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Subject:</B></I> Re: ftp s=
erver issue, trying to DL 1.2.7a</DIV></DIV>
<DIV>&nbsp;</DIV>wickedsun wrote:<BR>&gt; FTP Issues, round 2.<BR>&gt; <B=
R>&gt; <BR>&gt; With further testing, I've noticed that it doesnt quite w=
ork. For some <BR>&gt; unknown reason, it *seems* to work on port 21, but=
 doesnt on other <BR>Seems or does?<BR><BR>&gt; ports. From what I unders=
tood in your post, you said it would work on <BR>&gt; any port. (FTP, of =
course).<BR><BR>&gt; <BR>No. The ftp connection tracking module only moni=
tors on port 21. Because <BR>it has to examine all packets beeing send th=
ough, it would simple be too <BR>much work to monitor any connection made=
=2E If you want it to monitor <BR>other ports also, you can compile the f=
tp connection tracking as a <BR>module, and then use:<BR>modprobe ip_conn=
track_ftp 21,5006<BR>to let it listen on ports 21 and 5006.<BR><BR>I do n=
ot know if there is any way to make this work with <BR>ftp_connection_tra=
cking statically compiled in the kernel.<BR><BR>Regards<BR>Anders Fugmann=
<BR><BR>-- <BR>Author of FIAIF<BR>FIAIF Is An Intelligent Firewall<BR><A =
href=3D"http://fiaif.fugmann.dhs.org">http://fiaif.fugmann.dhs.org</A><BR=
><BR><BR><BR>. </TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE></BODY></HTML>
--------------Boundary-00=_08R2QL80000000000000--


