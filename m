From: "wickedsun" <wickedsun@phreaker.net>
Subject: Re: Is iptables kickin' that much?
Date: Fri, 6 Sep 2002 22:12:16 -0400 (Eastern Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D796080.000001.00644@athlon1000>
References: <3D793DE4.2060504@fugmann.dhs.org>
Mime-Version: 1.0
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_G4Q1QL80000000000000"
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
Cc: netfilter <netfilter@lists.netfilter.org>


--------------Boundary-00=_G4Q1QL80000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

DC++ is a Direct Connect client. You can use either Passive or Active mod=
e.
It's just like FTP. In passive you get the search responces from the serv=
er
where as Active, the users send you the responces directly thru port 1412=
=2E I
used to have to map the ports, but after flushing my forwards and adding
your rules to my IPtables, it worked.=0D
=0D
Look on sourceforge for DC++.=0D
 =0D
-------Original Message-------=0D
 =0D
From: Anders Fugmann=0D
Date: Friday, September 06, 2002 7:52:52 PM=0D
To: wickedsun=0D
Cc: netfilter=0D
Subject: Re: Is iptables kickin' that much?=0D
 =0D
wickedsun wrote:=0D
> thing to say, it works. =0D
Great.=0D
=0D
> Now the question is, will this work with any=0D
> protocol? (ftp, irc, etc). =0D
as of today, only ftp and IRC is implemented in the vanilla tree. POM =0D
may have connection tracking for other protocols.=0D
=0D
A protocol that requests something and then receives an answer is =0D
handled by basic connection tracking (Which is why you dont need =0D
connection tracking modules for e.g. http and pop, since no new =0D
connection are established). It is the RELATED packets that are hard to =0D
find.=0D
=0D
>The thing is scary me a bit. I read in your email=0D
> that you have to load up a FTP module (which I have compiled in the
kernel)=0D
> and it seems to me that it works with other protocol as well. (I was ab=
le
to=0D
> enable Active in DC++ without having to forward manually each ports lik=
e I=0D
> used to do).=0D
Active DC++???? Never heard of it.=0D
=0D
> =0D
> This was of a huge help for the iptables newbies (including me) and tha=
nks
=0D
No problem.=0D
=0D
Regards=0D
Anders Fugmann=0D
=0D
--=0D
Author of FIAIF=0D
FIAIF Is An Intelligent Firewall=0D
http://fiaif.fugmann.dhs.org=0D
=0D
=0D
=0D
=2E=20
--------------Boundary-00=_G4Q1QL80000000000000
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
<DIV>DC++ is a Direct Connect client. You can use&nbsp;either Passive or =
Active mode.&nbsp;It's just like FTP.&nbsp;In passive you get the search&=
nbsp;responces from the server where as Active, the users send you the re=
sponces directly thru port 1412. I used to have to map the ports,&nbsp;bu=
t after flushing my forwards and adding your rules to my IPtables, it wor=
ked.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Look on sourceforge for DC++.<BR>&nbsp;</DIV>
<DIV id=3DIncrediOriginalMessage><I>-------Original Message-------</I></D=
IV>
<DIV>&nbsp;</DIV>
<DIV id=3Dreceivestrings>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>From:</B></I> <A href=3D"m=
ailto:afu@fugmann.dhs.org">Anders Fugmann</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Date:</B></I> Friday, Sept=
ember 06, 2002 7:52:52 PM</DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>To:</B></I> <A href=3D"mai=
lto:wickedsun@phreaker.net">wickedsun</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Cc:</B></I> <A href=3D"mai=
lto:netfilter@lists.netfilter.org">netfilter</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Subject:</B></I> Re: Is ip=
tables kickin' that much?</DIV></DIV>
<DIV>&nbsp;</DIV>wickedsun wrote:<BR>&gt; thing to say, it works. <BR>Gre=
at.<BR><BR>&gt; Now the question is, will this work with any<BR>&gt; prot=
ocol? (ftp, irc, etc). <BR>as of today, only ftp and IRC is implemented i=
n the vanilla tree. POM <BR>may have connection tracking for other protoc=
ols.<BR><BR>A protocol that requests something and then receives an answe=
r is <BR>handled by basic connection tracking (Which is why you dont need=
 <BR>connection tracking modules for e.g. http and pop, since no new <BR>=
connection are established). It is the RELATED packets that are hard to <=
BR>find.<BR><BR>&gt;The thing is scary me a bit. I read in your email<BR>=
&gt; that you have to load up a FTP module (which I have compiled in the =
kernel)<BR>&gt; and it seems to me that it works with other protocol as w=
ell. (I was able to<BR>&gt; enable Active in DC++ without having to forwa=
rd manually each ports like I<BR>&gt; used to do).<BR>Active DC++???? Nev=
er heard of it.<BR><BR>&gt; <BR>&gt; This was of a huge help for the ipta=
bles newbies (including me) and thanks.<BR>No problem.<BR><BR>Regards<BR>=
Anders Fugmann<BR><BR>--<BR>Author of FIAIF<BR>FIAIF Is An Intelligent Fi=
rewall<BR><A href=3D"http://fiaif.fugmann.dhs.org">http://fiaif.fugmann.d=
hs.org</A><BR><BR><BR><BR>. </TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE></BODY></HTML>
--------------Boundary-00=_G4Q1QL80000000000000--


