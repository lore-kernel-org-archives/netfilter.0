From: "Sharon Tal" <shatal@websplanet.com>
Subject: UNTRACKED packets are identified as INVALID
Date: Wed, 26 Mar 2008 15:29:53 +0200
Message-ID: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi there,
I have 2 web servers behind an iptables based load-balancer, and I'm trying
to setup a graphics web server on the load-balancer, so that if a simple
static file is requested it will be able to respond instead of forwarding
the request to the web servers.
 
I've been trying to do that by matching packets at the raw table, setting
them to be UNTRACKED and leaving them on the LB.
The problem is that all UNTRACKED packets are identified as INVALID as soon
as they get to the mangle chain and dropped.
 
Here's my configuration (NS1, NS2 - the web servers, LB - the load balancer,
INTFACE/EXTFACE - internal/external interface)
<<--------------------------------------------------------------------------
---------------->>
echo 1 > /proc/sys/net/ipv4/ip_forward
 
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -F OUTPUT
$IPTABLES -t raw  -F
$IPTABLES -t mangle -F
$IPTABLES -t nat -F
$IPTABLES -Z

# Drop invalid packets
$IPTABLES -t mangle -A PREROUTING -m state --state INVALID -j DROP
$IPTABLES -t mangle -A PREROUTING -p tcp ! --syn -m state --state NEW -j
DROP
 
# Prevent Spoofing
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -s 192.168.0.0/24 -p ! ICMP -j
DROP
 
# Prevent Smurf Attacks
$IPTABLES -t mangle -A PREROUTING -p icmp -i $EXTFACE -d 192.168.0.255 -j
DROP
 
# Prevent Syn-Flood, Ping-O-Death & Fast Port Scanning
$IPTABLES -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
$IPTABLES -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPTABLES -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# Limit number of new connections/second from a single IP to a single port
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m state
--state NEW -m recent --name HTTP --set
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m state
--state NEW -m recent --name HTTP --update --seconds 2 --hitcount 100 -j
DROP

# Forward traffic from internal servers to the internet
$IPTABLES -t nat -A POSTROUTING -o $EXTFACE -j SNAT --to-source
192.168.100.153

# JPG requests should be answered by LB
$IPTABLES -t raw -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m string
--algo bm --string "GET /" -m string --algo bm --string ".jpg HTTP/1." -j
NOTRACK
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m state
--state UNTRACKED -j MARK --set-mark 0x11

# HTTP (25:75 Marking 1X)
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m mark
--mark 0x0 -m statistic --mode nth --every 4 -j MARK --set-mark 0x12
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m mark
--mark 0x0 -j MARK --set-mark 0x13
$IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -j RETURN
$IPTABLES -t nat -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m mark --mark
0x12 -j DNAT --to-destination $NS1IP:80
$IPTABLES -t nat -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m mark --mark
0x13 -j DNAT --to-destination $NS2IP:80
$IPTABLES -t nat -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m mark --mark
0x0 -j DNAT --to-destination $NS2IP:80
$IPTABLES -t nat -A PREROUTING -i $EXTFACE -p tcp --dport 80 -j RETURN
<<--------------------------------------------------------------------------
---------------->>
 
Any ideas on how to make this happen or what am I doing wrong?
 
Thanks!
 
Cheers!

