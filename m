From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: marking in output mangle with route lookup
Date: 13 Jul 2003 09:39:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058081978.1379.6.camel@drs0.manchotnetworks.net>
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
To: netfilter <netfilter@lists.netfilter.org>

hello all,

i posted this to the lartc forum, and received no response, so i am hopeful
that someone here can advise.

i have come accross a curious issue:

+----------------------+            +---------------+
| eth1   192.168.1.1   |------------| 192.168.1.250 |
| eth1:1 192.168.1.101 |            |               |
+----------------------+            +---------------+


iptables --append OUTPUT --table mangle --jump MARK --set-mark 0x2
ip rule add fwmark 0x2 table 2
ip route add 192.168.1.0/24 dev eth1 src 192.168.1.101 table 2
ip route flush cache


telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.1


ip rule add to 192.168.1.250 table 2
ip route flush cache


telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.101



are there issues concerning the marking of OUTPUT packets generated on
the local box that i should be aware of?


many, many thanks

charles




