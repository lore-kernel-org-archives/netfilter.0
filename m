From: Payal Rathod <payal-iptables@staticky.com>
Subject: hazy table rules
Date: Sun, 31 Aug 2003 17:56:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030831122629.GA1748@linux.local>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
On a firewall, the rules I am giving are like,

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DENY

$IPTABLES -t nat -A POSTROUTING -j MASQUERADE

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 20 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 21 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/24 -p udp -m udp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Still when I view through iptraf, I find that there is traffic to
few outside port 137 of remote machines.

What is the issue?

With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

