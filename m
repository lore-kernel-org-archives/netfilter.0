From: "adburne" <adburne@asocmedrosario.com.ar>
Subject: Re: NAT & MySQL
Date: Thu, 27 Nov 2003 11:50:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC60F28.000001.00267@adburne>
References: <3FC42019.4030704@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Type: Multipart/related;
  type="multipart/alternative";
  boundary="------------Boundary-00=_SJM0QL80000000000000"
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


--------------Boundary-00=_SJM0QL80000000000000
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_SJM0LVC0000000000000"


--------------Boundary-00=_SJM0LVC0000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 How ever, thanks; I'll be found the reason that didn't work DNAT.=0D
=0D
Don't punch me =3D)=0D
=0D
I set up, time ago, another gateway box on my mysql server (I've 2 links =
to
internet), it runs rh7.1 and network setup was setting using linuxconf. I
setup it correctly, but don't take changes.=0D
It show incorrect information about gateway ip, when I saw this because I
think in it, all was ok (in theory).=0D
=0D
Thanks, and sorry for waste your time (and my too) with this problem.=0D
=0D
Alejandro.=0D
 =0D
-------Mensaje original-------=0D
 =0D
De: Jeffrey Laramie=0D
Fecha: mi=E9rcoles 26 de noviembre de 2003 00:51:40=0D
A: netfilter@lists.netfilter.org=0D
Asunto: Re: NAT & MySQL=0D
 =0D
Mark E. Donaldson wrote:=0D
=0D
Yeah you are correct Jeff.  Don't know what I was thinking. Maybe that's =
the=0D
problem: I wasn't.=0D
=0D
  =0D
=0D
No worries. This is a tough list to answer on (just ask Antony). One need=
s
to understand inet protocols, the inner workings of netfilter, network
design, and a whole bunch of unforgiving iptables rules. And that's befor=
e
you get to POM and the bleeding edge stuff! This is why I only answer the
easy questions ;-)=0D
=0D
Anyway, the original post said that the web server worked fine yet there
aren't any rules that would allow that. If you're still following the thr=
ead
 can you post all your rules and maybe a schematic of your LAN so we can =
see
where the servers are?=0D
=0D
Jeff=0D
=0D
=20
--------------Boundary-00=_SJM0LVC0000000000000
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
<DIV>&nbsp;How ever, thanks; I'll be found the reason that didn't work DN=
AT.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Don't punch me =3D)</DIV>
<DIV>&nbsp;</DIV>
<DIV>I set up, time ago, another gateway box on my mysql server (I've 2 l=
inks to internet), it runs rh7.1 and network setup was setting using linu=
xconf. I setup it correctly, but don't take changes.</DIV>
<DIV>It&nbsp;show incorrect information about gateway ip, when I saw this=
 because I think in it, all was ok (in theory).</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks, and sorry for waste your time (and my too) with this problem=
=2E</DIV>
<DIV>&nbsp;</DIV>
<DIV>Alejandro.</DIV>
<DIV>&nbsp;</DIV>
<DIV id=3DIncrediOriginalMessage><I>-------Mensaje original-------</I></D=
IV>
<DIV>&nbsp;</DIV>
<DIV id=3Dreceivestrings>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>De:</B></I> <A href=3D"mai=
lto:JALaramie@Loudoun-Fairfax.com">Jeffrey Laramie</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Fecha:</B></I> mi=E9rcoles=
 26 de noviembre de 2003 00:51:40</DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>A:</B></I> <A href=3D"mail=
to:netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Asunto:</B></I> Re: NAT &a=
mp; MySQL</DIV></DIV>
<DIV>&nbsp;</DIV>Mark E. Donaldson wrote:<BR>
<DIV cite=3D"mid200311260256.hAQ2usiu004660@server5.bandwidthco.com" type=
=3D"cite"><PRE wrap=3D"">Yeah you are correct Jeff.  Don't know what I wa=
s thinking. Maybe that's the
problem: I wasn't.

  </PRE></DIV><BR>No worries. This is a tough list to answer on (just ask=
 Antony). One needs to understand inet protocols, the inner workings of n=
etfilter, network design, and a whole bunch of unforgiving iptables rules=
=2E And that's before you get to POM and the bleeding edge stuff! This is=
 why I only answer the easy questions ;-)<BR><BR>Anyway, the original pos=
t said that the web server worked fine yet there aren't any rules that wo=
uld allow that. If you're still following the thread, can you post all yo=
ur rules and maybe a schematic of your LAN so we can see where the server=
s are?<BR><BR>Jeff<BR>
<DIV>&nbsp;</DIV></TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE><SPAN id=3DIncrediStamp><SPAN dir=3Dltr><F=
ONT face=3D"Arial, Helvetica, sans-serif" size=3D2>______________________=
___________________________________________<BR><FONT face=3D"Comic Sans M=
S" size=3D2><A href=3D"http://www.incredimail.com/redir.asp?ad_id=3D310&a=
mp;lang=3D10"><IMG alt=3D"" hspace=3D0 src=3D"cid:277FA103-20E7-11D8-B818=
-00805F579555" align=3Dbaseline border=3D0></A>&nbsp; <I>IncrediMail</I> =
- <B>El E-mail ha evolucionado finalmente</B> - </FONT><A href=3D"http://=
www.incredimail.com/redir.asp?ad_id=3D310&amp;lang=3D10"><FONT face=3D"Ti=
mes New Roman" size=3D3><B><U>Haga clic aqu=ED</U></B></FONT></A></SPAN><=
/SPAN></FONT></BODY></HTML>
--------------Boundary-00=_SJM0LVC0000000000000--

--------------Boundary-00=_SJM0QL80000000000000
Content-Type: image/gif;
  name="IMSTP.gif"
Content-Transfer-Encoding: base64
Content-ID: <277FA103-20E7-11D8-B818-00805F579555>

R0lGODlhFAAPALMIAP9gAM9gAM8vAM9gL/+QL5AvAGAvAP9gL////wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJFAAIACwAAAAAFAAPAAAEVRDJSaudJuudrxlEKI6B
URlCUYyjKpgYAKSgOBSCDEuGDKgrAtC3Q/R+hkPJEDgYCjpKr5A8WK9OaPFZwHoPqm3366VKyeRt
E30tVVRscMHDqV/u+AgAIfkEBWQACAAsAAAAABQADwAABBIQyUmrvTjrzbv/YCiOZGmeaAQAIfkE
CRQACAAsAgABABAADQAABEoQIUOrpXIOwrsPxiQUheeRAgUA49YNhbCqK1kS9grQhXGAhsDBUJgZ
AL2Dcqkk7ogFpvRAokSn0p4PO6UIuUsQggSmFjKXdAgRAQAh+QQFCgAIACwAAAAAFAAPAAAEEhDJ
Sau9OOvNu/9gKI5kaZ5oBAAh+QQJFAAIACwCAAEAEAANAAAEShAhQ6ulcg7Cuw/GJBSF55ECBQDj
1g2FsKorWRL2CtCFcYCGwMFQmBkAvYNyqSTuiAWm9ECiRKfSng87pQi5SxCCBKYWMpd0CBEBACH5
BAVkAAgALAAAAAAUAA8AAAQSEMlJq7046827/2AojmRpnmgEADs=

--------------Boundary-00=_SJM0QL80000000000000--


