From: "CN LIOU" <cnliou@graffiti.net>
Subject: How To Enable A Server Waiting For Connections From Internet
Date: Wed, 26 Feb 2003 19:37:32 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226113732.29044.qmail@graffiti.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi!

The Linux box running netfilter/iptables is connected to Internet by ADSL via PPPoE. It dynamically obtains one IP address from ISP. Let's call this Linux box as "router".

I have a Win98 server program listening on port 6000. This program is expecting connections from any host on Internet. Once the connection is established, there will be data transfer between this server program and the hosts on Internet.

There will be a web server in private network 192.168.0, too.

The IP's are:

eth0 of router=192.168.0.1 assigned by rc.inet1
eth0:1 of router=192.168.0.9 assigned by PPPoE
Win98=192.168.0.4
eth0 of web server=192.168.0.5


I copied rc.firewall from
http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/firewall-examples.html#RC.FIREWALL-2.4.X
and modified it for my case as follows. Could any guru correct it for me so that I can use it as my beginner's tutorial?

Thank you in advance!

CN
------------------------
EXTIF="ppp0"
INTIF="eth0"
WIN98IF="192.168.0.4"
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,NEW,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
$IPTABLES -A FORWARD -p tcp --dport 6000 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -p tcp --dport 6000 -i $INIF -j DNAT --to $WIN98IF:6000
-- 
_______________________________________________
Get your free email from http://www.graffiti.net

Powered by Outblaze

