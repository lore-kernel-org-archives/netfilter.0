From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Problem Found! - Firewall Rule
Date: Fri, 6 Jun 2003 07:56:08 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012001c32bbe$08915a30$fd00a8c0@homes>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_011D_01C32C01.1689B9A0"
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

------=_NextPart_000_011D_01C32C01.1689B9A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Folks, its me again :(

Below is my config. My problem is, I can connect to VPN but for some =
reason, I cannot see machines inside the network after being connected. =
Can somebody give me the simpliest firewall rule on this? just for me to =
see the machines inside the network.

Thanks!
/JP



PC1 (192.168.0.20) ----> gateway(LinuxServer) <-------------------> =
internet <--------------------> VPN Server
                                   eth0 : 1.1.1.1                        =
                                                eth0 : 2.2.2.2
                                   eth1 : 192.168.0.1                    =
                                             local ip: 192.168.0.10
                                                                         =
                                                     remote ip: =
192.168.0.180-200 =20

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

PC1 is already connected to the VPN server. PC1 ip now becomes;

Ethernet adapter Local Area Connection:

        Connection-specific DNS Suffix  . :=20
        IP Address. . . . . . . . . . . . : 192.168.0.253
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 192.168.0.10

PPP adapter Sytes.Net:

        Connection-specific DNS Suffix  . :
        IP Address. . . . . . . . . . . . : 192.168.0.180
        Subnet Mask . . . . . . . . . . . : 255.255.255.255
        Default Gateway . . . . . . . . . : 192.168.0.180

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

route -n

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
202.163.246.1   0.0.0.0         255.255.255.255 UH    0      0        0 =
ppp0
192.168.0.180   0.0.0.0         255.255.255.255 UH    0      0        0 =
ppp1
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         202.163.246.1   0.0.0.0         UG    0      0        0 =
ppp0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

------=_NextPart_000_011D_01C32C01.1689B9A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#edfefc>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hello Folks, its me again =
:(</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Below is my config. My problem is, I can connect to VPN but for =
some=20
reason, I cannot see machines inside the network after being connected. =
Can=20
somebody give me&nbsp;the simpliest&nbsp;firewall rule on this? just for =
me to=20
see the machines inside the network.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks!</DIV>
<DIV>/JP</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>PC1&nbsp;(192.168.0.20) ----&gt;=20
gateway(LinuxServer) &lt;-------------------&gt; internet=20
&lt;--------------------&gt; VPN Server</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0=20
:&nbsp;1.1.1.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
eth0 : 2.2.2.2</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
eth1=20
:=20
192.168.0.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;local=20
ip: 192.168.0.10</FONT></DIV>
<DIV>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;remote ip:=20
192.168.0.180-200&nbsp; </DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>PC1 is already connected to the VPN=20
server.&nbsp;PC1 ip now becomes;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ethernet adapter Local Area=20
Connection:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Connection-specific DNS Suffix&nbsp; . :&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP=20
Address. . . . . . . . . . . . :=20
192.168.0.253<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subnet Mask =
. . . .=20
. . . . . . . : =
255.255.255.0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Default Gateway . . . . . . . . . : 192.168.0.10</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>PPP adapter Sytes.Net:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Connection-specific DNS Suffix&nbsp; .=20
:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP Address. . . . . . . =
. . . .=20
. : 192.168.0.180<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subnet =
Mask . .=20
. . . . . . . . . :=20
255.255.255.255<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Default =
Gateway .=20
. . . . . . . . : 192.168.0.180</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</DIV>
<DIV>&nbsp;</DIV>
<DIV>route -n</DIV>
<DIV>&nbsp;</DIV>
<DIV>Kernel IP routing table<BR>Destination&nbsp;&nbsp;&nbsp;&nbsp;=20
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric=20
Ref&nbsp;&nbsp;&nbsp; Use Iface<BR>202.163.246.1&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.255=20
UH&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 =
ppp0<BR>192.168.0.180&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.255=20
UH&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ppp1<BR>192.168.0.0&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
202.163.246.1&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ppp0<BR></DIV>
<DIV>
<DIV>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</DIV></DIV></FONT></DIV></BODY></HTML=
>

------=_NextPart_000_011D_01C32C01.1689B9A0--


