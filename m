From: Torben Nielsen <m@l4l.dk>
Subject: problem with "-m owner" in kernel 2.4.20
Date: Thu, 05 Dec 2002 19:45:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7a7vuu078d02e40u64231r4vpfgrvespap@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Can anyone tell why the below shown line fails when running kernel =
version 2.4.20 but not when
running  kernel 2.4.19.

/usr/local/sbin/iptables -A OUTPUT -o eth0 -m owner --uid-owner root -j =
ACCEPT
iptables: Invalid argument


Regards=20

Torben



+ SafeConfig
+ trap '' 1 2 3 13 15
+ trap 0
+ set +e
+ ClearAllTables
+ /usr/local/sbin/iptables -P INPUT DROP
+ /usr/local/sbin/iptables -P OUTPUT DROP
+ /usr/local/sbin/iptables -P FORWARD DROP
+ /usr/local/sbin/iptables -t filter -F
+ /usr/local/sbin/iptables -t filter -X
+ /usr/local/sbin/iptables -t nat -F
+ /usr/local/sbin/iptables -t nat -X
+ /usr/local/sbin/iptables -t mangle -F
+ /usr/local/sbin/iptables -t mangle -X
+ echo 'The netfilter rules and counters were reset at'
+ date
+ /usr/local/sbin/iptables -A INPUT -i eth0 -j ACCEPT
+ /usr/local/sbin/iptables -A INPUT -i lo -j ACCEPT
+ /usr/local/sbin/iptables -A INPUT -j LOG --log-prefix 'Bad input =
packet: '
+ /usr/local/sbin/iptables -A OUTPUT -o lo -j ACCEPT
+ /usr/local/sbin/iptables -A OUTPUT -o eth0 -m state --state =
ESTABLISHED,RELATED -j ACCEPT
+ /usr/local/sbin/iptables -A OUTPUT -o eth0 -m state --state INVALID -j =
DROP
+ /usr/local/sbin/iptables -A OUTPUT -o eth0 -m owner --uid-owner root -j=
 ACCEPT
    iptables: Invalid argument
+ /usr/local/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 6000:6019 -m =
owner --uid-owner tn -j
ACCEPT
iptables: Invalid argument
+ /usr/local/sbin/iptables -A OUTPUT -j LOG --log-prefix 'Bad output =
packet: '
+ /usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix 'Bad forward =
packet: '
+ logger -s -p user.crit 'Error setting up packet filtering: using safe =
configuration'
root: Error setting up packet filtering: using safe configuration
+ exit 1





