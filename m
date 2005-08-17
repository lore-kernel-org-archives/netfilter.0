From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: cant connect to port 80
Date: Wed, 17 Aug 2005 19:48:40 +0200
Message-ID: <43037878.8070404@eccotours.dyndns.org>
Mime-Version: 1.0
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi list

I have my routing rules as so

/sbin/ip route add 196.36.10.113 dev eth0 src 196.36.10.114 table IS
/sbin/ip route add default via 196.36.10.113 table IS

/sbin/ip route add 192.168.10.200 dev eth2 src 192.168.10.100 table TELKOM
/sbin/ip route add default via 192.168.10.200 table TELKOM

/sbin/ip route add 196.36.10.113 dev eth0 src 196.36.10.114
/sbin/ip route add 192.168.10.200 dev eth2 src 192.168.10.100

/sbin/ip route add default via 196.36.10.113

/sbin/ip rule add from 196.36.10.114 table IS
/sbin/ip rule add from 192.168.10.100 table TELKOM

/sbin/ip rule add fwmark 1 table TELKOM

apart from the rest of my firewall ruleset

I have an entry as :

$IPT -t nat -A PREROUTING -i eth1 -t mangle -p tcp --dport 80 -j MARK --set-mark 1
$IPT -t filter -A FORWARD -i eth1 -o eth2 -m multiport -p tcp --dport 80,443 -m state --state NEW -j ACCEPT

My browser cant seem to  connect to a webserver.

Probally a routing issue, as I see that I dont get any messages in syslog of FORWARD complaining.

If anyone could help, it would be most appreciated.

Kind Regards
Brent Clark

