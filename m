From: "Tim" <twr@bellsouth.net>
Subject: Re: forwarding (continued)
Date: Sun, 7 Jul 2002 21:54:06 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0047_01C22600.D19E4060"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0048_01C22600.D19E4060"


------=_NextPart_001_0048_01C22600.D19E4060
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Antony,

INTERNAL IP =3D 192.168.1.0/24  -- range 1 thru 11
DMZ IP =3D 172.16.1.0/24 -- range 1 thru 5

The reason I believe I know it is not forwarding....is that when I ping =
from the DMZ I get a "request time out", although come to think of it, =
it is actually giving me a response, its just not necessarily the =
response I want.

Well in any case I issue the command iptables -L -n -v and it reports =
that packets did get to the forwarding rule it just looks like I got a =
"request time out" response. So, (having some enlightenment), do I need =
to specify a rule for icmp types here?

On the files attached I use ping from a box on the DMZ to ping an =
INTERNAL box I ran the command "iptables -L -n -v -x and iptables -L -n =
-v -x -t nat" and the results are in the files Lvnx and Lvnxtnat text =
files.

I then used ping from a box from an INTERNAL box to ping a DMZ box and =
ran the same commands as mentioned and the results are in the Lvnx2 and =
Lvnxtnat2 text file. The other files are obvious.

It really goes back to the sig, routing, routing and routing......I just =
can't seem to put my finger on it. Thanks for the assist, I appreciate =
the time and patience.

Tim Rodriguez
Network Security Student
--
To me, being a student means that misconceptions and errors
are a way of learning. Frustration means that I'm learning.
Perseverance is of the utmost if one wants to learn. Having
someone to turn to ask for clarification is invaluable.

Thank you.
--


=20



------=_NextPart_001_0048_01C22600.D19E4060
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Antony,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>INTERNAL IP =3D 192.168.1.0/24&nbsp; -- =
range 1 thru=20
11</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>DMZ IP =3D 172.16.1.0/24 -- range 1 =
thru=20
5</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The reason I believe I know it is not=20
forwarding....is that when I ping from the DMZ I get a "request time =
out",=20
although come to think of it, it is actually giving me a response, its =
just not=20
necessarily the response I want.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Well in any case I issue the command =
iptables -L -n=20
-v and it reports that packets did get to the forwarding rule it just =
looks like=20
I got a "request time out" response. So, (having some enlightenment), do =
I need=20
to specify a rule for icmp types here?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On the files attached I use ping from a =
box on the=20
DMZ to ping an INTERNAL box I ran the command "iptables -L -n -v -x and =
iptables=20
-L -n -v -x -t nat" and the results are in the files Lvnx and Lvnxtnat =
text=20
files.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I then used ping from a box =
from&nbsp;an=20
INTERNAL&nbsp;box to ping a&nbsp;DMZ box and ran the same commands as =
mentioned=20
and the results are in the Lvnx2 and&nbsp;Lvnxtnat2 text file. The other =
files=20
are obvious.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>It really goes back to the sig, =
routing, routing=20
and routing......I just can't seem to put my finger on it. Thanks for =
the=20
assist, I appreciate the time and patience.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tim Rodriguez</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Network Security Student</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>To me, being a student means that =
misconceptions=20
and errors</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>are a way of learning. Frustration =
means that I'm=20
learning.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Perseverance is of the utmost if one =
wants to=20
learn. Having</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>someone to turn to ask for =
clarification is=20
invaluable.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_001_0048_01C22600.D19E4060--

------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="script.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="script.txt"

#!/bin/bash
#
# LEARNING IPTABLES SCRIPT
#
## Variables ##
EXTERNAL_NET=3D"eth0"
DMZ_NET=3D"eth1"
INTERNAL_NET=3D"eth2"
#
INTERNAL=3D"192.168.1.0/24"
DMZ=3D"172.16.1.0/24"
EXTERNAL=3D"192.168.2.0/24"
#
## Acquiring the ip address for the devices ##
INT_IP=3D`ifconfig $INTERNAL_NET | grep "inet addr" | cut -d ":" -f 2 | =
cut -d " " -f 1`
DMZ_IP=3D`ifconfig $DMZ_NET | grep "inet addr" | cut -d ":" -f 2 | cut =
-d " " -f 1`
EXT_IP=3D`ifconfig $EXTERNAL_NET | grep "inet addr" | cut -d ":" -f 2 | =
cut -d " " -f 1`

## Flush the chains ##
iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
#
## Setting policies
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#
## Enable routing ##
echo "1" > /proc/sys/net/ipv4/ip_forward
#
## Logging ##
LOG_LEVEL=3D"notice"
#
## FORWARD traffic between INTERNAL and DMZ
iptables -A FORWARD -i $INTERNAL_NET -o $DMZ_NET -j ACCEPT
iptables -A FORWARD -i $DMZ_NET -o $INTERNAL_NET -j ACCEPT
#


------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="Lnvx2.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Lnvx2.txt"

Chain INPUT (policy DROP 23 packets, 2629 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20
       0        0 ACCEPT     	all  --  eth2   eth1    0.0.0.0/0       =
0.0.0.0/0         =20
       0        0 ACCEPT    	all  --  eth1   eth2    0.0.0.0/0       =
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20


------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="Lnvxtnat.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Lnvxtnat.txt"

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source        =
destination        =20


------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="Lnvxtnat2.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Lnvxtnat2.txt"

Chain PREROUTING (policy ACCEPT 32 packets, 4647 bytes)
    pkts      bytes target     prot opt in     out     source       =
destination        =20

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source       =
destination        =20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source       =
destination        =20


------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="route.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="route.txt"

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
192.168.2.0     192.168.2.2     255.255.255.0   UG    0      0        0 =
eth0
192.168.2.0     *               255.255.255.0   U     0      0        0 =
eth0
172.16.0.0      *               255.255.255.0   U     0      0        0 =
eth1
192.168.1.0     *               255.255.255.0   U     0      0        0 =
eth2
172.16.1.0      172.16.1.1      255.255.255.0   UG    0      0        0 =
eth1
172.16.1.0      *               255.255.255.0   U     0      0        0 =
eth1
127.0.0.0       *               255.0.0.0       U     0      0        0 =
lo


------=_NextPart_000_0047_01C22600.D19E4060
Content-Type: text/plain;
	name="Lnvx.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Lnvx.txt"

Chain INPUT (policy DROP 21 packets, 2705 bytes)
    pkts      bytes target     prot opt in     out     source       	=
destination        =20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source       	=
destination        =20
       0        0 ACCEPT      all  --  eth2   eth1    0.0.0.0/0         =
0.0.0.0/0         =20
       4      240 ACCEPT      all  --  eth1   eth2    0.0.0.0/0         =
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 16 packets, 1186 bytes)
    pkts      bytes target     prot opt in     out     source       	 =
destination        =20


------=_NextPart_000_0047_01C22600.D19E4060--


