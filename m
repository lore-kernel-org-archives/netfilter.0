From: =?ISO-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: forwarding
Date: Tue, 18 May 2004 17:33:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FEF7@smtp.retecal.es>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C43CED.7D241950"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C43CED.7D241950
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


HI!

if you add

iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 8080 \
    -j DNAT --to-destination 192.168.0.2:80

you need=20

iptables -t nat -A POSTROUTING -s 192.168.0.2 -p tcp --dport 80 -j SNAT =
--to
192.168.0.1:8080

you can test the conections with tcpdump=20

Un saludo

David Carde=F1osa

-----Mensaje original-----
De: alucard@kanux.com [mailto:alucard@kanux.com]
Enviado el: martes, 18 de mayo de 2004 17:13
Para: netfilter@lists.netfilter.org
Asunto: Re: forwarding



> Although it probably did, are you sure nmap scanned port 8080? How =
about
> nmap -sT -p 8080 10.73.219.156
>
> I would then trace both the wire and the iptables rules to find out
> where it is breaking - John

Yes, it filters now but now it seems that the problem is in the 2nd =
server
because I try to telnet to server 1's 8080 port and I get no response. =
Is
it any missconfiguration on the router? take a look at this:
----
root@mail:~# nmap -sT -p 8080 10.73.219.156

Starting nmap 3.48 ( http://www.insecure.org/nmap/ ) at 2004-05-18 =
11:06 VET
Interesting ports on mail.aeropostal.com.ve (10.73.219.156):
PORT     STATE    SERVICE
8080/tcp filtered http-proxy
----

the webserver in server 2 is working perfectly but im not able to reach =
it
from server one, look at this in server 2, maybe im doing something =
wrong

[root@linserv root]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.0.0     *               255.255.255.0   U     0      0        0 =
eth1
10.73.216.0     *               255.255.252.0   U     0      0        0 =
eth0
169.254.0.0     *               255.255.0.0     U     0      0        0 =
eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 =
lo
default         192.168.0.1     0.0.0.0         UG    0      0        0 =
eth1


Thanx a lot for this great help
Juan





------_=_NextPart_001_01C43CED.7D241950
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DISO-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: forwarding</TITLE>
</HEAD>
<BODY>
<BR>

<P><FONT SIZE=3D2>HI!</FONT>
</P>

<P><FONT SIZE=3D2>if you add</FONT>
</P>

<P><FONT SIZE=3D2>iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp =
--dport 8080 \</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; -j DNAT --to-destination =
192.168.0.2:80</FONT>
</P>

<P><FONT SIZE=3D2>you need </FONT>
</P>

<P><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -s 192.168.0.2 -p tcp =
--dport 80 -j SNAT --to 192.168.0.1:8080</FONT>
</P>

<P><FONT SIZE=3D2>you can test the conections with tcpdump </FONT>
</P>

<P><FONT SIZE=3D2>Un saludo</FONT>
</P>

<P><FONT SIZE=3D2>David Carde=F1osa</FONT>
</P>

<P><FONT SIZE=3D2>-----Mensaje original-----</FONT>
<BR><FONT SIZE=3D2>De: alucard@kanux.com [<A =
HREF=3D"mailto:alucard@kanux.com">mailto:alucard@kanux.com</A>]</FONT>
<BR><FONT SIZE=3D2>Enviado el: martes, 18 de mayo de 2004 17:13</FONT>
<BR><FONT SIZE=3D2>Para: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Asunto: Re: forwarding</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>&gt; Although it probably did, are you sure nmap =
scanned port 8080? How about</FONT>
<BR><FONT SIZE=3D2>&gt; nmap -sT -p 8080 10.73.219.156</FONT>
<BR><FONT SIZE=3D2>&gt;</FONT>
<BR><FONT SIZE=3D2>&gt; I would then trace both the wire and the =
iptables rules to find out</FONT>
<BR><FONT SIZE=3D2>&gt; where it is breaking - John</FONT>
</P>

<P><FONT SIZE=3D2>Yes, it filters now but now it seems that the problem =
is in the 2nd server</FONT>
<BR><FONT SIZE=3D2>because I try to telnet to server 1's 8080 port and =
I get no response. Is</FONT>
<BR><FONT SIZE=3D2>it any missconfiguration on the router? take a look =
at this:</FONT>
<BR><FONT SIZE=3D2>----</FONT>
<BR><FONT SIZE=3D2>root@mail:~# nmap -sT -p 8080 10.73.219.156</FONT>
</P>

<P><FONT SIZE=3D2>Starting nmap 3.48 ( <A =
HREF=3D"http://www.insecure.org/nmap/" =
TARGET=3D"_blank">http://www.insecure.org/nmap/</A> ) at 2004-05-18 =
11:06 VET</FONT>
<BR><FONT SIZE=3D2>Interesting ports on mail.aeropostal.com.ve =
(10.73.219.156):</FONT>
<BR><FONT SIZE=3D2>PORT&nbsp;&nbsp;&nbsp;&nbsp; STATE&nbsp;&nbsp;&nbsp; =
SERVICE</FONT>
<BR><FONT SIZE=3D2>8080/tcp filtered http-proxy</FONT>
<BR><FONT SIZE=3D2>----</FONT>
</P>

<P><FONT SIZE=3D2>the webserver in server 2 is working perfectly but im =
not able to reach it</FONT>
<BR><FONT SIZE=3D2>from server one, look at this in server 2, maybe im =
doing something wrong</FONT>
</P>

<P><FONT SIZE=3D2>[root@linserv root]# route</FONT>
<BR><FONT SIZE=3D2>Kernel IP routing table</FONT>
<BR><FONT SIZE=3D2>Destination&nbsp;&nbsp;&nbsp;&nbsp; =
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric =
Ref&nbsp;&nbsp;&nbsp; Use Iface</FONT>
<BR><FONT SIZE=3D2>192.168.0.0&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</FONT>
<BR><FONT SIZE=3D2>10.73.216.0&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 255.255.252.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0</FONT>
<BR><FONT SIZE=3D2>169.254.0.0&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 255.255.0.0&nbsp;&nbsp;&nbsp;&nbsp; =
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0</FONT>
<BR><FONT SIZE=3D2>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 lo</FONT>
<BR><FONT =
SIZE=3D2>default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
192.168.0.1&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Thanx a lot for this great help</FONT>
<BR><FONT SIZE=3D2>Juan</FONT>
</P>
<BR>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C43CED.7D241950--

