From: Vincent Blondel <vincent.blondel@chello.be>
Subject: FTP Connection problems.
Date: Tue, 24 Aug 2004 15:07:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093352834.1894.16.camel@lbedlbxl.dev.xtra-net.org>
Reply-To: vincent.blondel@chello.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I a trying to initiate ftp connections to some of my servers but it
doesn't work. You can find below a schema representing my three
machines, client, firewall and ftp server. There is no NAT at the moment
and the script I use on my firewall.

---

 ftp server                   eth1 fw eth0                 client 
192.168.125.1      192.168.125.240    192.168.124.240    192.168.124.1

---

#!/bin/sh
#

fw="/sbin/iptables"
nat="$fw -t nat"
mangle="$fw -t mangle"

CONN_TRACK="1" 				# Connection Tracking
UNPRIVPORTS="1024:65535" 		# unprivileged port range

# Remove any existing rules from all chains
$fw --flush
$nat --flush
$mangle --flush

# Unlimited traffic on the loopback interface
$fw -A INPUT  -i lo -j ACCEPT
$fw -A OUTPUT -o lo -j ACCEPT

# Set the default policy to drop
$fw --policy INPUT   DROP
$fw --policy OUTPUT  DROP
$fw --policy FORWARD DROP

$nat --policy PREROUTING  DROP
$nat --policy OUTPUT      DROP
$nat --policy POSTROUTING DROP

$mangle --policy PREROUTING  DROP
$mangle --policy OUTPUT      DROP

# Remove any pre-existing user-defined chains
$fw --delete-chain
$nat --delete-chain
$mangle --delete-chain

if [ "$CONN_TRACK" = "1" ]; then
	$fw -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	$fw -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	$fw -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# Incoming FTP requests
iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 192.168.124.1 --sport
$UNPRIVPORTS -d 192.168.125.1 --dport 21 -m state --state NEW -j ACCEPT

# Port Mode Data Channel Responses
iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 192.168.124.1 --sport 20
--dport $UNPRIVPORTS -m state --state NEW -j ACCEPT

Thanks to help me ...
Vincent



