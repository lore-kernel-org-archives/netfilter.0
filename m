From: "Gonzalez, Federico" <fgonzalez@goyaike.com>
Subject: RE: Filtering problem
Date: Tue, 22 Jul 2003 20:48:23 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F83365C81484D411A63A00508BAEED5A17DE9C@NT_CIRPC>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C350AB.BC970770"
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
To: 'George Vieira ' <georgev@citadelcomputer.com.au>, 'Netfilter Mailing List ' <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C350AB.BC970770
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks George very much, it worked fine !!!!

Best regards.
Federico Gonzalez

-----Mensaje original-----
De: George Vieira
Para: Gonzalez, Federico; Netfilter Mailing List
Enviado el: 22/07/2003 19:36
Asunto: RE: Filtering problem

What you need to do is:

1. DNAT the external IP address to the internal IP address when it's
comming from the internal NIC. 
2. SNAT internal clients to the EXTernal IP address.

I use this method with our websites which are held internally..

EXTDEV="eth0"
INTDEV="eth1"
EXTWEB="w.x.y.z"
INTWEB="10.0.0.9"
INTNET="10.0.0.0/24"

iptables -A PREROUTING -t nat -p tcp -d $EXTWEB --dport 80 -j DNAT --to
$INTWEB
iptables -A POSTROUTING -t nat -p tcp -s $INTNET -d $EXTWEB --dport 80
-j SNAT --to 10.0.0.254 #Firewall IP

well, something like that.. (in a rush ;) )
Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
 

-----Original Message-----
From: Gonzalez, Federico [mailto:fgonzalez@goyaike.com]
Sent: Wednesday, July 23, 2003 4:58 AM
To: Netfilter Mailing List
Subject: Filtering problem


Hello all,

   I have just installed the IPTABLES 1.2.8 on linux red hat 7.2,
Kernel 2.4.21. Everything works fine except for one problem:

I have a firewall as the entrance point to my network, it has two
interfaces eth0 pointing to the internet, static IP and eth1 pointig to
the internal network.

the following URL http://www.mycompany.com points to the firewall IP
port 80, it is DNATed to the 10.0.0.9:80, and it's working fine.

when i try tp access the webserver from a PC in the internal network
using the http://www.mycompany.com url , it doesnt work because the
firewall receives the request and forward it to the webserver DNATing
the packet, but the webserver sees the request comming not from the
firewall but from a PC in the internal network, so it sends the response
to that PC and when that PC receives the response (the ACK to the SYN)
it drops the packet because it didn't send a SYN to that machine.

I tried to SNAT the packet in the postrounting but it is not working.

Any idea about can i do ?

Thanks in advance.

My script is :

IPTABLES=/sbin/iptables
#IPTABLES=/usr/local/sbin/iptables
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe


EXTIF="eth0"
INTIF="eth1"
EXTIP="200.X.X.X"
INTIP="10.0.0.11"

echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"

$DEPMOD -a

$MODPROBE ip_tables

echo -en "ip_conntrack, "
$MODPROBE ip_conntrack

echo -en "iptable_nat, "
$MODPROBE iptable_nat

echo -e "   Done loading modules.\n"

echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

#Direcciones IP
EXCHANGE="10.0.0.2"
PROXY="10.0.0.6"
WEBSERVER="10.0.0.9"
PC_FGONZA="10.0.0.30"

echo "   Clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

#Habilito el Logging

#Libero la interface interna
$IPTABLES -A INPUT  -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT

#Habilito el ping
$IPTABLES -A INPUT   -p icmp -j ACCEPT
$IPTABLES -A OUTPUT  -p icmp -j ACCEPT
$IPTABLES -A FORWARD -p icmp -j ACCEPT

#Habilito Salir desde esta maquina
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d 10.0.0.0/24 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d 10.0.0.0/24 -j ACCEPT

$IPTABLES -A INPUT -i $INTIF -d $INTIP -j ACCEPT

echo "Habilito el servicio Telnet desde la red interna"
$IPTABLES -A INPUT -i $INTIF -p tcp --dport 23 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -m state --state ESTABLISHED,RELATED -j
ACCEPT

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $INTIF -j ACCEPT

#Salida directa a Inet.
OUTIP="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
\
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41"
for i in $OUTIP
do
  $IPTABLES -A FORWARD -i $INTIF -s 10.0.0.$i -j ACCEPT
done

echo "  Blocking invalid ICMP packets "
$IPTABLES -A INPUT   -i $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A FORWARD -i $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A OUTPUT  -o $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A FORWARD -o $EXTIF -m state -p icmp --state INVALID -j DROP

echo " Anti spoofing "

$IPTABLES -A INPUT -i $EXTIF -s 10.0.0.0/8  -j DROP
$IPTABLES -A INPUT -i $EXTIF -s 127.0.0.0/8 -j DROP

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

#F.Gonzalez
$IPTABLES -A FORWARD -m state --state NEW -d $PC_FGONZA -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 8080 \
          -j DNAT --to $PC_FGONZA:80

$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 8000 \
          -j DNAT --to $PC_FGONZA:8080

#Web server
$IPTABLES -A FORWARD -m state --state NEW -d $WEBSERVER -j ACCEPT
#  WWW
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 80 \
          -j DNAT --to $WEBSERVER:80
# HTTPS

$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 443 \
          -j DNAT --to $WEBSERVER:443

#Mail server
$IPTABLES -A FORWARD -m state --state NEW -d $EXCHANGE -j ACCEPT
#  SMTP
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 25 \
          -j DNAT --to $EXCHANGE:25
#  IMAP
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 143 \
          -j DNAT --to $EXCHANGE:143
#  POP3
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 110 \
          -j DNAT --to $EXCHANGE:110


$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP --dport 7000 \
          -j DNAT --to 10.0.0.4:27960

$IPTABLES -A INPUT   -j DROP
$IPTABLES -A OUTPUT  -j DROP
$IPTABLES -A FORWARD -j DROP


------_=_NextPart_001_01C350AB.BC970770
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Filtering problem</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Thanks George very much, it worked fine !!!!</FONT>
</P>

<P><FONT SIZE=3D2>Best regards.</FONT>
<BR><FONT SIZE=3D2>Federico Gonzalez</FONT>
</P>

<P><FONT SIZE=3D2>-----Mensaje original-----</FONT>
<BR><FONT SIZE=3D2>De: George Vieira</FONT>
<BR><FONT SIZE=3D2>Para: Gonzalez, Federico; Netfilter Mailing =
List</FONT>
<BR><FONT SIZE=3D2>Enviado el: 22/07/2003 19:36</FONT>
<BR><FONT SIZE=3D2>Asunto: RE: Filtering problem</FONT>
</P>

<P><FONT SIZE=3D2>What you need to do is:</FONT>
</P>

<P><FONT SIZE=3D2>1. DNAT the external IP address to the internal IP =
address when it's</FONT>
<BR><FONT SIZE=3D2>comming from the internal NIC. </FONT>
<BR><FONT SIZE=3D2>2. SNAT internal clients to the EXTernal IP =
address.</FONT>
</P>

<P><FONT SIZE=3D2>I use this method with our websites which are held =
internally..</FONT>
</P>

<P><FONT SIZE=3D2>EXTDEV=3D&quot;eth0&quot;</FONT>
<BR><FONT SIZE=3D2>INTDEV=3D&quot;eth1&quot;</FONT>
<BR><FONT SIZE=3D2>EXTWEB=3D&quot;w.x.y.z&quot;</FONT>
<BR><FONT SIZE=3D2>INTWEB=3D&quot;10.0.0.9&quot;</FONT>
<BR><FONT SIZE=3D2>INTNET=3D&quot;10.0.0.0/24&quot;</FONT>
</P>

<P><FONT SIZE=3D2>iptables -A PREROUTING -t nat -p tcp -d $EXTWEB =
--dport 80 -j DNAT --to</FONT>
<BR><FONT SIZE=3D2>$INTWEB</FONT>
<BR><FONT SIZE=3D2>iptables -A POSTROUTING -t nat -p tcp -s $INTNET -d =
$EXTWEB --dport 80</FONT>
<BR><FONT SIZE=3D2>-j SNAT --to 10.0.0.254 #Firewall IP</FONT>
</P>

<P><FONT SIZE=3D2>well, something like that.. (in a rush ;) )</FONT>
<BR><FONT SIZE=3D2>Thanks,</FONT>
<BR><FONT SIZE=3D2>____________________________________________</FONT>
<BR><FONT SIZE=3D2>George Vieira</FONT>
<BR><FONT SIZE=3D2>Systems Manager</FONT>
<BR><FONT SIZE=3D2>georgev@citadelcomputer.com.au</FONT>
</P>

<P><FONT SIZE=3D2>Citadel Computer Systems Pty Ltd</FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://www.citadelcomputer.com.au" =
TARGET=3D"_blank">http://www.citadelcomputer.com.au</A></FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Gonzalez, Federico [<A =
HREF=3D"mailto:fgonzalez@goyaike.com">mailto:fgonzalez@goyaike.com</A>]<=
/FONT>
<BR><FONT SIZE=3D2>Sent: Wednesday, July 23, 2003 4:58 AM</FONT>
<BR><FONT SIZE=3D2>To: Netfilter Mailing List</FONT>
<BR><FONT SIZE=3D2>Subject: Filtering problem</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hello all,</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp; I have just installed the IPTABLES 1.2.8 =
on linux red hat 7.2,</FONT>
<BR><FONT SIZE=3D2>Kernel 2.4.21. Everything works fine except for one =
problem:</FONT>
</P>

<P><FONT SIZE=3D2>I have a firewall as the entrance point to my =
network, it has two</FONT>
<BR><FONT SIZE=3D2>interfaces eth0 pointing to the internet, static IP =
and eth1 pointig to</FONT>
<BR><FONT SIZE=3D2>the internal network.</FONT>
</P>

<P><FONT SIZE=3D2>the following URL <A =
HREF=3D"http://www.mycompany.com" =
TARGET=3D"_blank">http://www.mycompany.com</A> points to the firewall =
IP</FONT>
<BR><FONT SIZE=3D2>port 80, it is DNATed to the 10.0.0.9:80, and it's =
working fine.</FONT>
</P>

<P><FONT SIZE=3D2>when i try tp access the webserver from a PC in the =
internal network</FONT>
<BR><FONT SIZE=3D2>using the <A HREF=3D"http://www.mycompany.com" =
TARGET=3D"_blank">http://www.mycompany.com</A> url , it doesnt work =
because the</FONT>
<BR><FONT SIZE=3D2>firewall receives the request and forward it to the =
webserver DNATing</FONT>
<BR><FONT SIZE=3D2>the packet, but the webserver sees the request =
comming not from the</FONT>
<BR><FONT SIZE=3D2>firewall but from a PC in the internal network, so =
it sends the response</FONT>
<BR><FONT SIZE=3D2>to that PC and when that PC receives the response =
(the ACK to the SYN)</FONT>
<BR><FONT SIZE=3D2>it drops the packet because it didn't send a SYN to =
that machine.</FONT>
</P>

<P><FONT SIZE=3D2>I tried to SNAT the packet in the postrounting but it =
is not working.</FONT>
</P>

<P><FONT SIZE=3D2>Any idea about can i do ?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance.</FONT>
</P>

<P><FONT SIZE=3D2>My script is :</FONT>
</P>

<P><FONT SIZE=3D2>IPTABLES=3D/sbin/iptables</FONT>
<BR><FONT SIZE=3D2>#IPTABLES=3D/usr/local/sbin/iptables</FONT>
<BR><FONT SIZE=3D2>DEPMOD=3D/sbin/depmod</FONT>
<BR><FONT SIZE=3D2>MODPROBE=3D/sbin/modprobe</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>EXTIF=3D&quot;eth0&quot;</FONT>
<BR><FONT SIZE=3D2>INTIF=3D&quot;eth1&quot;</FONT>
<BR><FONT SIZE=3D2>EXTIP=3D&quot;200.X.X.X&quot;</FONT>
<BR><FONT SIZE=3D2>INTIP=3D&quot;10.0.0.11&quot;</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;&nbsp;&nbsp; External Interface:&nbsp; =
$EXTIF&quot;</FONT>
<BR><FONT SIZE=3D2>echo &quot;&nbsp;&nbsp; Internal Interface:&nbsp; =
$INTIF&quot;</FONT>
</P>

<P><FONT SIZE=3D2>$DEPMOD -a</FONT>
</P>

<P><FONT SIZE=3D2>$MODPROBE ip_tables</FONT>
</P>

<P><FONT SIZE=3D2>echo -en &quot;ip_conntrack, &quot;</FONT>
<BR><FONT SIZE=3D2>$MODPROBE ip_conntrack</FONT>
</P>

<P><FONT SIZE=3D2>echo -en &quot;iptable_nat, &quot;</FONT>
<BR><FONT SIZE=3D2>$MODPROBE iptable_nat</FONT>
</P>

<P><FONT SIZE=3D2>echo -e &quot;&nbsp;&nbsp; Done loading =
modules.\n&quot;</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;&nbsp;&nbsp; Enabling =
forwarding..&quot;</FONT>
<BR><FONT SIZE=3D2>echo &quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_forward</FONT>
</P>

<P><FONT SIZE=3D2>#Direcciones IP</FONT>
<BR><FONT SIZE=3D2>EXCHANGE=3D&quot;10.0.0.2&quot;</FONT>
<BR><FONT SIZE=3D2>PROXY=3D&quot;10.0.0.6&quot;</FONT>
<BR><FONT SIZE=3D2>WEBSERVER=3D&quot;10.0.0.9&quot;</FONT>
<BR><FONT SIZE=3D2>PC_FGONZA=3D&quot;10.0.0.30&quot;</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;&nbsp;&nbsp; Clearing any existing rules =
and setting default policy..&quot;</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -P INPUT DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -F INPUT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -P OUTPUT DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -F OUTPUT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -P FORWARD DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -F FORWARD</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -t nat -F</FONT>
</P>

<P><FONT SIZE=3D2>#Habilito el Logging</FONT>
</P>

<P><FONT SIZE=3D2>#Libero la interface interna</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A INPUT&nbsp; -i lo -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT -o lo -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>#Habilito el ping</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A INPUT&nbsp;&nbsp; -p icmp -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT&nbsp; -p icmp -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -p icmp -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>#Habilito Salir desde esta maquina</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d =
10.0.0.0/24 -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d =
10.0.0.0/24 -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A INPUT -i $INTIF -d $INTIP -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;Habilito el servicio Telnet desde la red =
interna&quot;</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A INPUT -i $INTIF -p tcp --dport 23 -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT -o $INTIF -m state --state =
ESTABLISHED,RELATED -j</FONT>
<BR><FONT SIZE=3D2>ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state =
--state</FONT>
<BR><FONT SIZE=3D2>ESTABLISHED,RELATED -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A FORWARD -i $INTIF -o $INTIF -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>#Salida directa a Inet.</FONT>
<BR><FONT SIZE=3D2>OUTIP=3D&quot;1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 =
17 18 19 20 21 22 23 24 25</FONT>
<BR><FONT SIZE=3D2>\</FONT>
<BR><FONT SIZE=3D2>26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 =
41&quot;</FONT>
<BR><FONT SIZE=3D2>for i in $OUTIP</FONT>
<BR><FONT SIZE=3D2>do</FONT>
<BR><FONT SIZE=3D2>&nbsp; $IPTABLES -A FORWARD -i $INTIF -s 10.0.0.$i =
-j ACCEPT</FONT>
<BR><FONT SIZE=3D2>done</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;&nbsp; Blocking invalid ICMP packets =
&quot;</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A INPUT&nbsp;&nbsp; -i $EXTIF -m state -p =
icmp --state INVALID -j DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -i $EXTIF -m state -p icmp =
--state INVALID -j DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT&nbsp; -o $EXTIF -m state -p icmp =
--state INVALID -j DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -o $EXTIF -m state -p icmp =
--state INVALID -j DROP</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot; Anti spoofing &quot;</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A INPUT -i $EXTIF -s 10.0.0.0/8&nbsp; -j =
DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A INPUT -i $EXTIF -s 127.0.0.0/8 -j =
DROP</FONT>
</P>

<P><FONT SIZE=3D2>echo &quot;&nbsp;&nbsp; Enabling SNAT (MASQUERADE) =
functionality on $EXTIF&quot;</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT =
--to $EXTIP</FONT>
</P>

<P><FONT SIZE=3D2>#F.Gonzalez</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -m state --state NEW -d =
$PC_FGONZA -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 8080 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $PC_FGONZA:80</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 8000 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $PC_FGONZA:8080</FONT>
</P>

<P><FONT SIZE=3D2>#Web server</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -m state --state NEW -d =
$WEBSERVER -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>#&nbsp; WWW</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 80 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $WEBSERVER:80</FONT>
<BR><FONT SIZE=3D2># HTTPS</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 443 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $WEBSERVER:443</FONT>
</P>

<P><FONT SIZE=3D2>#Mail server</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -m state --state NEW -d =
$EXCHANGE -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>#&nbsp; SMTP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 25 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $EXCHANGE:25</FONT>
<BR><FONT SIZE=3D2>#&nbsp; IMAP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 143 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $EXCHANGE:143</FONT>
<BR><FONT SIZE=3D2>#&nbsp; POP3</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP =
--dport 110 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to $EXCHANGE:110</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP =
--dport 7000 \</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j DNAT =
--to 10.0.0.4:27960</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -A INPUT&nbsp;&nbsp; -j DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A OUTPUT&nbsp; -j DROP</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -A FORWARD -j DROP</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C350AB.BC970770--

