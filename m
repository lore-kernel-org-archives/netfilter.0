From: Gabriel Paues <gabriel@sics.se>
Subject: alternate tables and ipv6
Date: Tue, 04 Jun 2002 15:34:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFCC1CB.DF79783F@sics.se>
References: <20020604122434.A667@rainbow>
Reply-To: gabriel@sics.se
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.samba.org

Hello!

I want to route IPv6 packages differenlty depending on what is in the flowlabel.
I've written a flowlabel match module which works flawlessly. I have done an
experiment with IPv4 and the TOS flag, where I routed IPv4 packages differently,
depending on what was in the TOS flag. I marked packages (fwmark) depending on
the TOS flag and set everything up like this:

iptables -A PREROUTING -i eth0 -t mangle -m tos --tos 0 -j MARK --set-mark 1
ip rule add fwmark 1 table host2.out
ip route add default via 192.168.2.3 dev eth2 table host2.out

where 192.168.2.3 is different from what is default gw in the main-table.

All is working fine in the IPv6 case except the last statement (slightly altered
for IPv6):

#ip -6 route add default via fec0::192.168.2.3 dev eth2 table host2.out
RTNETLINK answers: File exists

Is this approach incompatible with IPv6 in any way? Is there any problems with
using IPv6-addresses and the "table" object?

Sincerily,

Gabriel Paues





