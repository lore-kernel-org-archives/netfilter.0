From: Rudi Starcevic <tech@wildcash.com>
Subject: Port-forwarding Perfomance
Date: Wed, 23 Feb 2005 17:33:56 -0800
Message-ID: <421D2F04.8090100@wildcash.com>
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

I have www port-forwarding setup and running OK.

However I wonder if they way I have configured it is not the most 
optimal for speed and performance.

I have a default policy of DROP with a total of about 30 rules.

These rules below do my www port-forwarding, can you see if there is a 
better way to do this ?

# ENABLE FORWARDING / NAT / MASQUERADING
echo "1" > /proc/sys/net/ipv4/ip_forward

# NAT Forwarding Setup
$IPTABLES --table nat --append POSTROUTING --out-interface $ETH0 -j 
MASQUERADE
$IPTABLES -A FORWARD -i $ETH1 -j ACCEPT
$IPTABLES -A FORWARD -i $ETH0 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# http Port-Forwarding setup
$IPTABLES -t nat -A PREROUTING -i $ETH0 -p tcp --dport 80 -d $MEDIA1_IP 
-j DNAT --to $MEDIA1_LO:80

Many thanks,
Kind regards
Rudi


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


