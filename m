From: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>
Subject: RE: Port forward
Date: Tue, 4 Feb 2003 11:56:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D007132BBC42D5118FD20002A52844414BCF2F@ASC01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CC3C.19AEB7E0"
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
To: 'Eric Leblond' <eleblond@init-sys.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2CC3C.19AEB7E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks a lot the error message is gone now,
after I changed the line to:
iptables -t nat -A PREROUTING -p tcp --destination-port 25 -i eth0 -j =
DNAT
--to-destination 192.168.22.6:25

But when I do iptables --list
I dont see any entrys in the chain for PREROUTING

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  192.168.32.6         anywhere           tcp dpt:ssh
ACCEPT     udp  --  192.168.32.6         anywhere           udp dpt:ssh
ACCEPT     tcp  --  192.168.22.6         anywhere           tcp dpt:ssh
ACCEPT     udp  --  192.168.22.6         anywhere           udp dpt:ssh
ACCEPT     tcp  --  thamaster.xs4all.nl  anywhere           tcp dpt:ssh
ACCEPT     udp  --  thamaster.xs4all.nl  anywhere           udp dpt:ssh
ACCEPT     tcp  --  192.168.22.0/24      anywhere           tcp dpt:www
ACCEPT     udp  --  192.168.22.0/24      anywhere           udp dpt:www
ACCEPT     tcp  --  localnet/24          anywhere           tcp dpt:www
ACCEPT     udp  --  localnet/24          anywhere           udp dpt:www
ACCEPT     all  --  anywhere             anywhere
DROP       tcp  --  anywhere             anywhere           tcp
flags:SYN,RST,ACK/SYN

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU
ACCEPT     all  --  anywhere             anywhere           state
ESTABLISHED

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU
TCPMSS     tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU

Chain PREROUTING (0 references)
target     prot opt source               destination

Regards,



Ronald Roeleveld=20
System Administrator=20

ASCINTERNATIONAL=20
Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands=20
Tel. +31 (0)70 3178400, Fax +31 (0)70 3204760
E-mail: r.roeleveld@ascinternational.nl
<mailto:r.roeleveld@ascinternational.nl> , Website:
http://www.ascinternational.nl <http://www.ascinternational.nl> =20

=20
=20
=20


-----Original Message-----
From: Eric Leblond [ mailto:eleblond@init-sys.com
<mailto:eleblond@init-sys.com> ]
Sent: dinsdag 4 februari 2003 11:49
To: ASC - Ronald Roeleveld
Subject: Re: Port forward


On Tue, 2003-02-04 at 11:31, ASC - Ronald Roeleveld wrote:
> Hi all,
>=20
> Iam trying to set up a port forward for several hours now, but I =
don't
> seem to get it working right.
> When I type the following command:
> iptables -A PREROUTING -p tcp --destination-port 25 -i eth0 -j DNAT
> --to-destination 192.168.22.6:25

you forget to specify that you work on the NAT table so add
-t nat
ou your line

--
=C9ric Leblond
courriel : eleblond@init-sys.com



------_=_NextPart_001_01C2CC3C.19AEB7E0
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<TITLE></TITLE>

<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<P><FONT size=3D2><FONT face=3DArial>Thanks a lot the error message is gone=
=20
now,<BR>after I changed the line to:<BR>iptables -t nat -A PREROUTING -p tc=
p=20
--destination-port 25 -i eth0 -j DNAT --to-destination=20
192.168.22.6:25<BR><BR>But when I do iptables --list<BR>I dont see any entr=
ys in=20
the chain for PREROUTING<BR><BR>Chain INPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
destination<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
192.168.32.6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
192.168.32.6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
192.168.22.6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
192.168.22.6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
thamaster.xs4all.nl&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
thamaster.xs4all.nl&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
dpt:ssh<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
192.168.22.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:www<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
192.168.22.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
dpt:www<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
localnet/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:www<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
localnet/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
dpt:www<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
flags:SYN,RST,ACK/SYN<BR><BR>Chain FORWARD (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
destination<BR>TCPMSS&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
flags:SYN,RST/SYN TCPMSS clamp to PMTU<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;=20
all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state =

ESTABLISHED<BR><BR>Chain OUTPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
destination<BR>TCPMSS&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
flags:SYN,RST/SYN TCPMSS clamp to PMTU<BR>TCPMSS&nbsp;&nbsp;&nbsp;&nbsp;=20
tcp&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
flags:SYN,RST/SYN TCPMSS clamp to PMTU<BR><BR>Chain PREROUTING (0=20
references)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
destination<BR><BR>Regards,<BR></FONT><BR><B><FONT face=3DArial size=3D2></=
P>
<P>Ronald Roeleveld&nbsp;<BR><FONT size=3D1>System Administrator</FONT>&nbs=
p;</P>
<P><B><FONT face=3DArial color=3D#000080 size=3D2>ASC</FONT><FONT face=3DAr=
ial=20
color=3D#808080 size=3D2>INTERNATIONAL</FONT></B> <BR><FONT face=3DArial co=
lor=3D#808080=20
size=3D1>Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands</FONT> <BR><F=
ONT=20
face=3DArial color=3D#808080 size=3D1>Tel. +31 (0)70 3178400, Fax +31 (0)70=
=20
3204760<BR></FONT><FONT face=3DArial color=3D#808080 size=3D1>E-mail: <A=20
href=3D"mailto:r.roeleveld@ascinternational.nl">r.roeleveld@ascinternationa=
l.nl</A>,=20
Website: </FONT><U><B><FONT face=3DArial color=3D#0000ff size=3D1><A=20
href=3D"http://www.ascinternational.nl"=20
target=3D_blank>http://www.ascinternational.nl</A></FONT></B></U><B></B> </=
P>
<DIV></FONT></B>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<P><BR>-----Original Message-----<BR>From: Eric Leblond [<A=20
href=3D"mailto:eleblond@init-sys.com">mailto:eleblond@init-sys.com</A>]<BR>=
Sent:=20
dinsdag 4 februari 2003 11:49<BR>To: ASC - Ronald Roeleveld<BR>Subject: Re:=
 Port=20
forward<BR><BR><BR>On Tue, 2003-02-04 at 11:31, ASC - Ronald Roeleveld=20
wrote:<BR>&gt; Hi all,<BR>&gt;&nbsp;<BR>&gt; Iam trying to set up a port fo=
rward=20
for several hours now, but I don't<BR>&gt; seem to get it working right.<BR=
>&gt;=20
When I type the following command:<BR>&gt; iptables -A PREROUTING -p tcp=20
--destination-port 25 -i eth0 -j DNAT<BR>&gt; --to-destination=20
192.168.22.6:25<BR><BR>you forget to specify that you work on the NAT table=
 so=20
add<BR>-t nat<BR>ou your line<BR><BR>--<BR>=C9ric Leblond<BR>courriel :=20
eleblond@init-sys.com<BR></P></FONT></BODY></HTML>

------_=_NextPart_001_01C2CC3C.19AEB7E0--

