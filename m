From: Rudi Starcevic <tech@wildcash.com>
Subject: HTTP Port-forwarding
Date: Mon, 28 Feb 2005 17:09:17 -0800
Message-ID: <4223C0BD.1080804@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have these rules below to enable:

a) http port-forwarding in requests
b) masquerading rules for http replies.

It does seem to work OK but is very slow. After hours of looking I think
the problem as to why it is so slow may be in my Iptables rules.

Can you see a double up or something that may cause a problem ?
Or would you say it all looks fine and my problem is elsewhere ?

Thank you ..

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

# http requests:
# Port-Forwarding setup
$IPTABLES -t nat -A PREROUTING -i $ETH0 -p tcp --dport 80 -d 
66.xxx.xx.100 -j DNAT --to 192.168.0.10:80

# http replies:
# ENABLE NAT
echo "1" > /proc/sys/net/ipv4/ip_forward

# NAT Forwarding Setup
$IPTABLES --table nat --append POSTROUTING --out-interface $ETH0 -j 
MASQUERADE
$IPTABLES -A FORWARD -i $ETH1 -j ACCEPT
$IPTABLES -A FORWARD -i $ETH0 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT




-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.5.1 - Release Date: 27/02/2005


