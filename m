From: "Jeroen Dille" <jeroen.dille@st.cs.kuleuven.ac.be>
Subject: policy based routing
Date: Wed, 3 Jul 2002 21:05:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <011c01c222c4$a1356280$0200a8c0@gaiothpc>
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
To: netfilter@lists.samba.org

Hello,

I'm running a home-made Debian 2.4.18 kernel with iproute2-ss010824. I have
2 cable-modems to 2 different providers. One with a transparant proxy and
one with a regular. I would like to load-balance all traffic over the 2
modems and to do this with http traffic I have to run 2 squid processes:
squid1 to act as a proxy for the provider with the transparant proxy and
squid2 that does the load-balancing between the squid1 and the regular proxy
of the other provider.

The main difficulty is to route all packets coming from the squid1 to the
right interface (eth0 in my case). I want to do this based on the user
that's running the squid process. I think this should work, but it
doesn't... What I've done:

To mark all packets coming from the squid process:
iptables -t mangle -A OUTPUT -m owner --uid-owner 23 -j MARK --set-mark 1

To send all marked packets to routing table T4:
ip rule add fwmark 1 table T4

This is my main routing table:
127.0.0.1 dev lo  scope link  src 127.0.0.1
192.168.0.0/24 dev eth2  proto kernel  scope link  src 192.168.0.15
195.130.138.0/23 dev eth1  proto kernel  scope link  src 195.x.x.x
10.4.0.0/16 dev eth0  proto kernel  scope link  src 10.4.29.11
default
        nexthop via 10.4.0.1  dev eth0 weight 1
        nexthop via 195.130.138.1  dev eth1 weight 1

This is table T4:
10.4.0.0/16 dev eth0  proto kernel  scope link  src 10.4.29.11
default via 10.4.0.1  dev eth0

The packets get marked correctly but the routing is wrong. If I put "ip rule
add fwmark 1 table default" instead of "ip rule add fwmark 1 table T4" it
works like a charm... (well, if I leave the load-balancing, only 1 in 2
pages work, if I put default via 10.4.0.1 dev eth0 in the main table it
always works)

I've tried to recreate the main table in T4 but that didn't work either...
127.0.0.1 dev lo  scope link  src 127.0.0.1
192.168.0.0/24 dev eth2  scope link  src 192.168.0.15
10.4.0.0/16 dev eth0  scope link  src 10.4.29.11
default via 10.4.0.1 dev eth0

Does anybody knows what's going wrong? What routes should be in table T4?

tia
Jeroen


