From: "wickedsun" <wickedsun@phreaker.net>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Sat, 7 Sep 2002 08:38:08 -0400 (Eastern Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D79F330.000001.00620@athlon1000>
References: <3D7877D3.6040608@fugmann.dhs.org>
Mime-Version: 1.0
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_K3J2QL80000000000000"
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
To: afu@fugmann.dhs.org, rwideman@austin.rr.com
Cc: netfilter@lists.netfilter.org


--------------Boundary-00=_K3J2QL80000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

FTP Issues, round 2.=0D
=0D
=0D
With further testing, I've noticed that it doesnt quite work. For some
unknown reason, it *seems* to work on port 21, but doesnt on other ports.
=46rom what I understood in your post, you said it would work on any port=
=2E
(FTP, of course).=0D
=0D
9/7/2002 8:31:12 AM PORT 192,168,0,1,4,131=0D
9/7/2002 8:31:12 AM 200-FXP transfer: from 208.58.49.10 to 192.168.0.1=0D
9/7/2002 8:31:12 AM 200 PORT command successful=0D
9/7/2002 8:31:12 AM LIST=0D
9/7/2002 8:31:13 AM 425 Could not open data connection to port 1155: No
route to host=0D
=0D
The address does not get filtered (that FTP has automatic FXP detection..=
 if
the IP in the PORT command differs from the IP of the person that connect=
ed
to the FTP, it assumes its a FXP transfer.)=0D
=0D
That was on port 8989.=0D
=0D
On the other hand, port 21 is fine:=0D
=0D
9/7/2002 8:35:11 AM PORT 192,168,0,1,4,137=0D
9/7/2002 8:35:11 AM 200 PORT command successful.=0D
9/7/2002 8:35:11 AM LIST=0D
9/7/2002 8:35:11 AM Data Connection opened.=0D
9/7/2002 8:35:11 AM 150 Opening ASCII mode data connection for file list.=
=0D
9/7/2002 8:35:11 AM 226-Transfer complete.=0D
9/7/2002 8:35:11 AM 370 bytes transferred in 00:00:00, 370 bytes/sec=0D
=0D
=0D
Any ideas?=0D
=0D
=0D
Charles=0D
=0D
=0D
-------Original Message-------=0D
 =0D
From: Anders Fugmann=0D
Date: Friday, September 06, 2002 6:30:59 AM=0D
To: Rob=0D
Cc: netfilter@lists.netfilter.org=0D
Subject: Re: ftp server issue, trying to DL 1.2.7a=0D
 =0D
Rob wrote:=0D
> ftp> dir=0D
> 227 Entering Passive Mode (62,128,28,62,182,53).=0D
> =0D
As alot of others replies the problem is when ftp enters passive mode,=0D
the server initiates a dataconnection to your machine.=0D
=0D
Fortunatly, is a "port" command is send first over the command channel,=0D
in order to let the client and server know how and where this new =0D
connection will be established.=0D
=0D
This can be caught by the netfilter code, and netfilter can allow this =0D
connection to be accepted from the server in a quite clever way, because =
=0D
netfilter is _statefull_. ipchans was not, and hence this was not possibl=
e.=0D
=0D
The following gives an example of how netfilter can handle this:=0D
Lets assume that you are sittin behind a iptables firewall doing nat,=0D
and all you want is to allow users from the inside (eth0) to conenct to =0D
the internet through the external link (ppp0)=0D
=0D
# First load the heper modules for the ftp protocol connection tracking.=0D
# Delete these lines, if the modules are compiled statically into the=0D
# kernel.=0D
modprobe ip_conntrack_ftp=0D
# And the nat part for the ftp protocol.=0D
modprobe ip_nat_ftp=0D
=0D
# Set default policies.=0D
iptables -P INPUT drop=0D
iptables -P FORWARD drop=0D
iptables -P OUTPUT accept=0D
=0D
# NAT all connections=0D
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUEADE=0D
=0D
# Allow the mashine to make any kind of connections.=0D
iptables -A INPUT -m state --state ESTABLISHED,RELATED \=0D
-j ACCEPT=0D
=0D
# Allow the same for machines located behind the firewall.=0D
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT=0D
iptables -A FORWARD -o eth0 -i ppp0 -m state \=0D
--state ESTABLISHED,RELATED -j ACCEPT=0D
=0D
=0D
And we are all done. The trick is to use the 'state' match. The RELATED=0D
state will match the first packet in the data-connection from the =0D
ftp-server in passive mode. Any packets hereafter will be in the =0D
ESTABLISHED state.=0D
=0D
As you might have noticed, there is no protocol speicifer. So this also =0D
works for e.g. DNS lookups (udp) and ICMP packets related to an already =0D
esablished connection. Statefull firewalling is just sooo great.=0D
=0D
There is no reason for you to patch the kernel in order to do this,=0D
this has been possible for a long time.=0D
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
--------------Boundary-00=_K3J2QL80000000000000
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
<DIV>FTP Issues, round 2.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>With further testing, I've noticed that it doesnt quite work. For so=
me unknown reason, it&nbsp;*seems* to work on port 21, but doesnt on othe=
r ports. From what I understood&nbsp;in your post, you said it would work=
 on any port. (FTP, of course).</DIV>
<DIV>&nbsp;</DIV>
<DIV>9/7/2002 8:31:12 AM PORT 192,168,0,1,4,131<BR>9/7/2002 8:31:12 AM 20=
0-FXP transfer: from 208.58.49.10 to 192.168.0.1<BR>9/7/2002 8:31:12 AM 2=
00 PORT command successful<BR>9/7/2002 8:31:12 AM LIST<BR>9/7/2002 8:31:1=
3 AM 425 Could not open data connection to port 1155: No route to host<BR=
></DIV>
<DIV>The address does not get filtered (that FTP has automatic FXP detect=
ion.. if the IP in the PORT command differs from the IP of the person tha=
t connected to the FTP, it assumes its a FXP transfer.)</DIV>
<DIV>&nbsp;</DIV>
<DIV>That was on port 8989.</DIV>
<DIV>&nbsp;</DIV>
<DIV>On the other hand, port 21 is fine:</DIV>
<DIV>&nbsp;</DIV>
<DIV>9/7/2002 8:35:11 AM PORT 192,168,0,1,4,137<BR>9/7/2002 8:35:11 AM 20=
0 PORT command successful.<BR>9/7/2002 8:35:11 AM LIST<BR>9/7/2002 8:35:1=
1 AM Data Connection opened.<BR>9/7/2002 8:35:11 AM 150 Opening ASCII mod=
e data connection for file list.<BR>9/7/2002 8:35:11 AM 226-Transfer comp=
lete.<BR>9/7/2002 8:35:11 AM 370 bytes transferred in 00:00:00, 370 bytes=
/sec<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>Any ideas?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Charles</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV id=3DIncrediOriginalMessage><I>-------Original Message-------</I></D=
IV>
<DIV>&nbsp;</DIV>
<DIV id=3Dreceivestrings>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>From:</B></I> <A href=3D"m=
ailto:afu@fugmann.dhs.org">Anders Fugmann</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Date:</B></I> Friday, Sept=
ember 06, 2002 6:30:59 AM</DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>To:</B></I> <A href=3D"mai=
lto:rwideman@austin.rr.com">Rob</A></DIV>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Cc:</B></I> <A href=3D"mai=
lto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</A></DIV=
>
<DIV dir=3Dltr style=3D"FONT-SIZE: 11pt" <i><B>Subject:</B></I> Re: ftp s=
erver issue, trying to DL 1.2.7a</DIV></DIV>
<DIV>&nbsp;</DIV>Rob wrote:<BR>&gt; ftp&gt; dir<BR>&gt; 227 Entering Pass=
ive Mode (62,128,28,62,182,53).<BR>&gt; <BR>As alot of others replies the=
 problem is when ftp enters passive mode,<BR>the server initiates a datac=
onnection to your machine.<BR><BR>Fortunatly, is a "port" command is send=
 first over the command channel,<BR>in order to let the client and server=
 know how and where this new <BR>connection will be established.<BR><BR>T=
his can be caught by the netfilter code, and netfilter can allow this <BR=
>connection to be accepted from the server in a quite clever way, because=
 <BR>netfilter is _statefull_. ipchans was not, and hence this was not po=
ssible.<BR><BR>The following gives an example of how netfilter can handle=
 this:<BR>Lets assume that you are sittin behind a iptables firewall doin=
g nat,<BR>and all you want is to allow users from the inside (eth0) to co=
nenct to <BR>the internet through the external link (ppp0)<BR><BR># First=
 load the heper modules for the ftp protocol connection tracking.<BR># De=
lete these lines, if the modules are compiled statically into the<BR># ke=
rnel.<BR>modprobe ip_conntrack_ftp<BR># And the nat part for the ftp prot=
ocol.<BR>modprobe ip_nat_ftp<BR><BR># Set default policies.<BR>iptables -=
P INPUT drop<BR>iptables -P FORWARD drop<BR>iptables -P OUTPUT accept<BR>=
<BR># NAT all connections<BR>iptables -t nat -A POSTROUTING -o ppp0 -j MA=
SQUEADE<BR><BR># Allow the mashine to make any kind of connections.<BR>ip=
tables -A INPUT -m state --state ESTABLISHED,RELATED \<BR>-j ACCEPT<BR><B=
R># Allow the same for machines located behind the firewall.<BR>iptables =
-A FORWARD -i eth0 -o ppp0 -j ACCEPT<BR>iptables -A FORWARD -o eth0 -i pp=
p0 -m state \<BR>--state ESTABLISHED,RELATED -j ACCEPT<BR><BR><BR>And we =
are all done. The trick is to use the 'state' match. The RELATED<BR>state=
 will match the first packet in the data-connection from the <BR>ftp-serv=
er in passive mode. Any packets hereafter will be in the <BR>ESTABLISHED =
state.<BR><BR>As you might have noticed, there is no protocol speicifer. =
So this also <BR>works for e.g. DNS lookups (udp) and ICMP packets relate=
d to an already <BR>esablished connection. Statefull firewalling is just =
sooo great.<BR><BR>There is no reason for you to patch the kernel in orde=
r to do this,<BR>this has been possible for a long time.<BR><BR>Regards<B=
R>Anders Fugmann<BR><BR>-- <BR>Author of FIAIF<BR>FIAIF Is An Intelligent=
 Firewall<BR><A href=3D"http://fiaif.fugmann.dhs.org">http://fiaif.fugman=
n.dhs.org</A><BR><BR><BR><BR>. </TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE></BODY></HTML>
--------------Boundary-00=_K3J2QL80000000000000--


