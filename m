From: Payal Rathod <payal-iptables@staticky.com>
Subject: default policy
Date: Tue, 26 Aug 2003 14:05:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826083534.GA1573@linux.local>
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
I am trying a routing firewall which will route internal machines to
internet as well as redirect machines from outside to 1 ftp server
inside.

But I am not able to get even the first part working.
I use policy as default on FORWARD and,


$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

$IPTABLES -t nat -A POSTROUTING -j MASQUERADE

$IPTABLES -A INPUT -p tcp -s 0/0  --dport 21 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0  --dport 25 -j ACCEPT
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT

$IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 21 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p icmp --icmp-type 0 -j ACCEPT

When I make FORWARD POLICY as ACCEPT it works, but not when I make it
to DROP? Is there any bad rule anywhere?
Is the MASQUERADE rule ok? (Traffic is coming form 2 interfaces).
Is the ESTABLISHED,RELATED rule ok and at right position?

Please help me in this.
Thanks a lot and bye.
With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

