From: ms419@freezone.co.uk
Subject: Transparent Remote Proxy Server
Date: Thu, 23 Sep 2004 14:27:41 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm setting up a transparent proxy to a remote proxy server & can't 
figure out why it doesn't work.

My gateway is tor; it's running Debian unstable, iptables 1.2.11-2, & a 
custom 2.4.27 kernel. My proxy server is wum; it's also running Debian 
unstable, squid 2.5.6-8, iptables 1.2.11-2, & a custom 2.6.7 kernel.

Physically, tor is connected by each of 3 NICs to an ADSL modem, to wum 
by a crossover cable, & to the rest of the network by a hub.

Logically, tor & wum are in 192.168.103.0/24; tor & the rest of the 
network are in 192.168.179.0/24.

The proxy server is working; clients can be configured to use wum as a 
web proxy. Transparent proxying was also working, using DNAT & 
MASQUERADE targets on tor. I'm now setting up a more general solution, 
using policy routing.

All web traffic, except web traffic from wum to external networks, 
should be routed through wum. All other traffic, except traffic between 
local networks, should be masqueraded. To this end, I'm using the 
following rules on tor:

ip route add default via wum table 2

ip rule add fwmark 3 table 2

iptables -t filter -F

iptables -t mangle -F

iptables -t mangle -A PREROUTING -s 192.168.103.0/24 -d 
192.168.103.0/24 -j ACCEPT
iptables -t mangle -A PREROUTING -s 192.168.103.0/24 -d 
192.168.179.0/24 -j ACCEPT
iptables -t mangle -A PREROUTING -s 192.168.179.0/24 -d 
192.168.103.0/24 -j ACCEPT
iptables -t mangle -A PREROUTING -s 192.168.179.0/24 -d 
192.168.179.0/24 -j ACCEPT
iptables -t mangle -A PREROUTING -s wum -j ACCEPT
iptables -t mangle -A PREROUTING -s 192.168.103.0/24 -p tcp --dport 
http -j MARK --set-mark 3
iptables -t mangle -A PREROUTING -s 192.168.179.0/24 -p tcp --dport 
http -j MARK --set-mark 3

iptables -t nat -F

iptables -t nat -A POSTROUTING -s 192.168.103.0/24 -d 192.168.103.0/24 
-j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.103.0/24 -d 192.168.179.0/24 
-j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.179.0/24 -d 192.168.103.0/24 
-j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.179.0/24 -d 192.168.179.0/24 
-j ACCEPT
iptables -t nat -A POSTROUTING -m mark --mark 3 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.103.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.179.0/24 -j MASQUERADE

To pass web traffic to the proxy server, I'm using the following rules 
on wum:

iptables -t filter -F

iptables -t mangle -F

iptables -t nat -F

iptables -t nat -A PREROUTING -s 192.168.103.0/24 -d 192.168.103.0/24 
-j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.103.0/24 -d 192.168.179.0/24 
-j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.179.0/24 -d 192.168.103.0/24 
-j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.179.0/24 -d 192.168.179.0/24 
-j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.103.0/24 -p tcp --dport http 
-j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -s 192.168.179.0/24 -p tcp --dport http 
-j REDIRECT --to-port 3128

Unfortunately, I can't figure out why it doesn't work. Clients 
configured to do so can still use wum as a web proxy, but otherwise, 
they can't access the web.

Running tcpdump on wum seemingly confirms that web traffic is being 
routed through it:

09:37:51.732695 IP 192.168.179.43.60313 > 209.197.112.171.80: S 
1595892543:1595892543(0) win 65535 <mss 1460,nop,wscale 
0,nop,nop,timestamp 1791956815 0>
09:37:51.735092 IP 209.197.112.171.80 > 192.168.179.43.60313: S 
3071158741:3071158741(0) ack 1595892544 win 5792 <mss 
1460,nop,nop,timestamp 500666180 1791956815,nop,wscale 0>

But squid's logs report no activity & clients can't access the web.

Can anyone else suggest what might be wrong with this configuration?

Thanks for your help!

Jack


