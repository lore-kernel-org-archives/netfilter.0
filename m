From: Dan Barron <dbarron@ddive.com>
Subject: Re: RTSP & RTP w/ Darwin Thru iptables
Date: Thu, 22 Jul 2004 08:19:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040721171320.03983e78@arctictern.ddive.com>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407212150.39176.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_171331343==.ALT"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407212150.39176.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407212150.39176.Antony@Soft-Solutions.co.uk>
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

--=====================_171331343==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

 >> I have been struggling with setting up my iptables firewall to allow for
 >> RTSP & RTP connections to a Darwin Streaming Server.

 >What protocols does this use?   TCP?   UDP?   Something else?

TCP/UDP Ports 554 & 7070 (RTSP) and UDP ports 6790:6999 (RTP) - the way I 
believe it to work is that the stream is asked for and controlled using the 
TCP port then the video is streamed over the UDP port.


 >> I have a firewall with a public Internet connection and a DMZ and private
 >> LAN.  The Darwin server lives on its own server in the DMZ.

 >Does Darwin claim to operate across nat (which it sounds as though you are
 >using)?   Does Darwin specifically state it will not work across nat?

No and No, I can find little discussion on it, though it does pose problems 
from what I can find.  All my searching has only found small amounts of 
information talking about it.

 >What netfilter rules do you have at present, in the non-working setup, and
 >what packets are being dropped or unreplied (if you don't know the answer to
 >this last part, add some LOGging rules to find out what packets are not
 >either reaching their destination, or being replied to).

After more configuration tries, I am seeing that the RTSP TCP packets on 
port 7070 get DNAT'd fine to the Darwin Server - but it never responds back 
with either a TCP packet or a UDP packet.  To make sure the Darwin Server 
Linux box allows for Darwin to work properly,  the Darwin server has two 
eth ports, one on the DMZ, and one on the private LAN, and if I use its 
private LAN ip addr in quicktime viewer the Darwin server works fine and 
answers back with streaming media no problems.  So, this tells me that I 
have a firewall issue of some kind.


(internet) ------ firewall ------ (DMZ) ----- Darwin Server
                      |                     |
                  (Private LAN)             +- Web Server
                      |
                    W2K PC

Here is my current set of relevant rules.

#~~~ Additional udp_packets Chain ~~~

$IPTABLES -N udp_packets

$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 554 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 7070 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 6970:6999 -j ACCEPT

#~~~ INPUT Chain ~~~

$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p UDP -i $DMZ_IFACE -j udp_packets

#~~~ FORWARD Chain ~~~

$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \
   -d $DMZ_STREAMING --dport 554 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \
   -d $DMZ_STREAMING --dport 7070 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
   -d $DMZ_STREAMING --dport 554 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
   -d $DMZ_STREAMING --dport 7070 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
   -d $DMZ_STREAMING --dport 6970:6999 -j ACCEPT

$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 6970:6999 -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 7070 -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 554 -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 6970:6999  -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 7070 -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
   --dport 554 -j ACCEPT

#~~~ PREROUTING ~~~

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp \
   --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p tcp \
   --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp \
   --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \
   --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \
   --dport 6970:6999 -j DNAT \
   --to-destination $DMZ_STREAMING:6970-6999


And here's my log rules and what I see when trying to connect via my 
private LAN pc and the public domain address pointing to my public IP.

#~~~ LOG EVERYTHING ~~~

$IPTABLES -A INPUT -i $INET_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT INPUT INET_IFACE: "
$IPTABLES -A INPUT -i $DMZ_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT INPUT DMZ_IFACE: "
$IPTABLES -A INPUT -i $LAN_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT INPUT LAN_IFACE: "

$IPTABLES -A FORWARD -i $INET_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT FORWARD INET_IFACE: "
$IPTABLES -A FORWARD -i $DMZ_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT FORWARD DMZ_IFACE: "
$IPTABLES -A FORWARD -i $LAN_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT FORWARD LAN_IFACE: "

$IPTABLES -A OUTPUT -o $INET_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT OUTPUT INET_IFACE: "
$IPTABLES -A OUTPUT -o $DMZ_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT OUTPUT DMZ_IFACE: "
$IPTABLES -A OUTPUT -o $LAN_IFACE -j LOG \
   --log-level DEBUG --log-prefix "IPT OUTPUT LAN_IFACE: "

Jul 22 08:06:02 pygmy kernel: IPT FORWARD LAN_IFACE: IN=eth0 OUT=eth3 
SRC=192.168.11.10 DST=10.10.1.80 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=11016 
PROTO=TCP SPT=1024 DPT=7070 WINDOW=0 RES=0x00 RST URGP=0
Jul 22 08:06:02 pygmy kernel: New not syn:IN=eth0 OUT=eth3 
SRC=192.168.11.10 DST=10.10.1.80 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=11016 
PROTO=TCP SPT=1024 DPT=7070 WINDOW=0 RES=0x00 RST URGP=0

--=====================_171331343==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
<tt>&gt;&gt; I have been struggling with setting up my iptables firewall
to allow for<br>
&gt;&gt; RTSP &amp; RTP connections to a Darwin Streaming Server.
<br><br>
&gt;What protocols does this use?&nbsp;&nbsp; TCP?&nbsp;&nbsp;
UDP?&nbsp;&nbsp; Something else?<br><br>
TCP/UDP Ports 554 &amp; 7070 (RTSP) and UDP ports 6790:6999 (RTP) - the
way I believe it to work is that the stream is asked for and controlled
using the TCP port then the video is streamed over the UDP port.
<br><br>
<br>
&gt;&gt; I have a firewall with a public Internet connection and a DMZ
and private<br>
&gt;&gt; LAN.&nbsp; The Darwin server lives on its own server in the
DMZ.<br><br>
&gt;Does Darwin claim to operate across nat (which it sounds as though
you are <br>
&gt;using)?&nbsp;&nbsp; Does Darwin specifically state it will not work
across nat?<br><br>
No and No, I can find little discussion on it, though it does pose
problems from what I can find.&nbsp; All my searching has only found
small amounts of information talking about it.<br><br>
&gt;What netfilter rules do you have at present, in the non-working
setup, and <br>
&gt;what packets are being dropped or unreplied (if you don't know the
answer to <br>
&gt;this last part, add some LOGging rules to find out what packets are
not <br>
&gt;either reaching their destination, or being replied to).<br><br>
After more configuration tries, I am seeing that the RTSP TCP packets on
port 7070 get DNAT'd fine to the Darwin Server - but it never responds
back with either a TCP packet or a UDP packet.&nbsp; To make sure the
Darwin Server Linux box allows for Darwin to work properly,&nbsp; the
Darwin server has two eth ports, one on the DMZ, and one on the private
LAN, and if I use its private LAN ip addr in quicktime viewer the Darwin
server works fine and answers back with streaming media no
problems.&nbsp; So, this tells me that I have a firewall issue of some
kind.<br><br>
<br>
(internet) ------ firewall ------ (DMZ) ----- Darwin Server<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
|<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
(Private
LAN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
+- Web Server<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
|<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
W2K PC<br><br>
Here is my current set of relevant rules.<br><br>
#~~~ Additional udp_packets Chain ~~~<br><br>
$IPTABLES -N udp_packets<br><br>
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 554 -j
ACCEPT<br>
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 7070 -j
ACCEPT<br>
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 6970:6999 -j
ACCEPT<br><br>
#~~~ INPUT Chain ~~~<br><br>
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets<br>
$IPTABLES -A INPUT -p UDP -i $DMZ_IFACE -j udp_packets<br><br>
#~~~ FORWARD Chain ~~~<br><br>
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \<br>
&nbsp; -d $DMZ_STREAMING --dport 554 -j ACCEPT<br>
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \<br>
&nbsp; -d $DMZ_STREAMING --dport 7070 -j ACCEPT<br>
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \<br>
&nbsp; -d $DMZ_STREAMING --dport 554 -j ACCEPT<br>
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \<br>
&nbsp; -d $DMZ_STREAMING --dport 7070 -j ACCEPT<br>
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \<br>
&nbsp; -d $DMZ_STREAMING --dport 6970:6999 -j ACCEPT<br><br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 6970:6999 -m state --state NEW -j ACCEPT<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 7070 -m state --state NEW -j ACCEPT<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 554 -m state --state NEW -j ACCEPT<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 6970:6999&nbsp; -j ACCEPT<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 7070 -j ACCEPT<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \<br>
&nbsp; --dport 554 -j ACCEPT<br><br>
#~~~ PREROUTING ~~~<br><br>
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp \<br>
&nbsp; --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554<br>
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p tcp \ <br>
&nbsp; --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070<br>
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp \<br>
&nbsp; --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554<br>
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \&nbsp; <br>
&nbsp; --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070<br>
$IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \<br>
&nbsp; --dport 6970:6999 -j DNAT \<br>
&nbsp; --to-destination $DMZ_STREAMING:6970-6999<br><br>
<br>
And here's my log rules and what I see when trying to connect via my
private LAN pc and the public domain address pointing to my public
IP.<br><br>
#~~~ LOG EVERYTHING ~~~<br><br>
$IPTABLES -A INPUT -i $INET_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT INPUT INET_IFACE:
&quot;<br>
$IPTABLES -A INPUT -i $DMZ_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT INPUT DMZ_IFACE:
&quot;<br>
$IPTABLES -A INPUT -i $LAN_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT INPUT LAN_IFACE:
&quot;<br><br>
$IPTABLES -A FORWARD -i $INET_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT FORWARD INET_IFACE:
&quot;<br>
$IPTABLES -A FORWARD -i $DMZ_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT FORWARD DMZ_IFACE:
&quot;<br>
$IPTABLES -A FORWARD -i $LAN_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT FORWARD LAN_IFACE:
&quot;<br><br>
$IPTABLES -A OUTPUT -o $INET_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT OUTPUT INET_IFACE:
&quot;<br>
$IPTABLES -A OUTPUT -o $DMZ_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT OUTPUT DMZ_IFACE:
&quot;<br>
$IPTABLES -A OUTPUT -o $LAN_IFACE -j LOG \<br>
&nbsp; --log-level DEBUG --log-prefix &quot;IPT OUTPUT LAN_IFACE:
&quot;<br><br>
Jul 22 08:06:02 pygmy kernel: IPT FORWARD LAN_IFACE: IN=eth0 OUT=eth3
SRC=192.168.11.10 DST=10.10.1.80 LEN=40 TOS=0x00 PREC=0x00 TTL=127
ID=11016 PROTO=TCP SPT=1024 DPT=7070 WINDOW=0 RES=0x00 RST URGP=0 <br>
Jul 22 08:06:02 pygmy kernel: New not syn:IN=eth0 OUT=eth3
SRC=192.168.11.10 DST=10.10.1.80 LEN=40 TOS=0x00 PREC=0x00 TTL=127
ID=11016 PROTO=TCP SPT=1024 DPT=7070 WINDOW=0 RES=0x00 RST URGP=0 <br>
</body>
</html>

--=====================_171331343==.ALT--


