From: Ashley Maher <ashley.maher@didymodesigns.com.au>
Subject: inconsistant behaviour
Date: Thu, 25 Sep 2003 15:05:17 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F72778D.2080207@didymodesigns.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

G'day,

I've built a firewall-gateway for a Uni.

The initial script sets up:

IPTABLES=/sbin/iptables

EXTIF="eth1"
INTIF="eth0"

echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -N ACCT
$IPTABLES -F ACCT
$IPTABLES -N ALLOW
$IPTABLES -P ALLOW DROP
$IPTABLES -F ALLOW

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -j ACCT
$IPTABLES -I FORWARD -d 202.129.z.y -j ACCEPT
$IPTABLES -A FORWARD -s 203.220.a.0/22 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
$IPTABLES -A FORWARD -s 203.220.b.0/24 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
$IPTABLES -A FORWARD -s 203.221.c.0/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
$IPTABLES -A FORWARD -s 203.220.d.0/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
$IPTABLES -A FORWARD -s 203.220.e.128/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW

When a student logs on this instruction is given:

/sbin/iptables -A ALLOW -s $IP/32 -d 0.0.0.0/0 -o $EXTIF -j ACCEPT
/sbin/iptables -A ACCT -s 0.0.0.0/0 -d $IP/32 -i $EXTIF

This works well.

When a student logs off these instructions are given:

/sbin/iptables -D ALLOW -s $IP/32 -d 0.0.0.0/0 -o $EXTIF -j ACCEPT
/sbin/iptables -D ACCT -s 0.0.0.0/0 -d $IP/32 -i $EXTIF

Now this works fairly well. Less than 1% of the time it fails to remove 
the entry from the ALLOW chain and very rearly it fails to remove from 
the ACCT chain.

Where can I look to find this error. Though rare the 1% ends up being a 
significant number given the load is high.

Also msn messagenger packets do not seam to be counted by the iptables 
chain?? This is an observation from the help desk as students are 
complaining they are being logged off for inactivity and they are using 
messanger. When I hand check packets using iptables there appears to be 
no packet count. Whe they do a download there is.

I'm not an iptables guru so hints and or suggestions appreciated.

thanks

Ashley




