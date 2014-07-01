From: Patrick Hemmer <kernel@stormcloud9.net>
Subject: MASQUERADE doesn't work unless bridge is in promiscuous mode
Date: Tue, 01 Jul 2014 01:05:49 -0400
Message-ID: <53B241AD.2070907@stormcloud9.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've got a setup where I'm using network namespaces, a bridge, and
trying to masquerade traffic from the namespace.
I have a POSTROUTING rule which MASQUERADEs all traffic coming from the
namespace'd subnet. I then have a DNAT rule setup to send all traffic to
a certain port to an IP inside the namespace. Both these work perfectly
fine except when a process inside the namespace tries to use the DNAT
rule (which sends traffic back into the container). When this happens, I
can tcpdump the non-namespaced virtual interface (with promiscuous mode
off) and see the packet. But if I tcpdump the bridge, there is no such
packet. But as soon as I turn promiscuous mode on for the bridge, it
works perfectly.

Here's how you can replicate the setup:

    ip netns add brtest
    ip link add brtest0 type veth peer name brtest1
    ip link set brtest1 netns brtest
    ip link set brtest0 up
    ip netns exec brtest ip link set brtest1 up
    brctl addbr brtest
    ip link set brtest up
    brctl addif brtest brtest0
    ip addr add 169.254.0.1/29 dev brtest
    ip netns exec brtest ip addr add 169.254.0.2/29 dev brtest1
    sysctl -w net.ipv4.conf.brtest.forwarding=1
    sysctl -w net.ipv4.conf.brtest0.forwarding=1
    sysctl -w net.ipv4.conf.$(ip route get 8.8.8.8|grep -oP 'dev
\K\S+').forwarding=1
    ip netns exec brtest ip route add default via 169.254.0.1 dev
brtest1          
    iptables -t nat -I POSTROUTING -s 169.254.0.0/29 -j MASQUERADE
    iptables -t nat -I PREROUTING -m addrtype --dst-type LOCAL -p tcp
--dport 1000 -j DNAT --to-destination 169.254.0.2:3000
    iptables -t nat -I OUTPUT -m addrtype --dst-type LOCAL -p tcp
--dport 1000 -j DNAT --to-destination 169.254.0.2:3000
    while :; do ip netns exec brtest nc -v -l -p 3000; done

With that running, open another terminal and do:

    echo hello | ip netns exec brtest nc --send-only -n -v $(ip route
get 8.8.8.8|grep -oP 'src \K\S+') 1000

Notice it just hangs. However you can watch the iptables counters
increment on the DNAT rule, so the DNAT rule is matching, but not the
MASQUERADE rule.
Now try:

    ip link set brtest promisc on
    echo hello | ip netns exec brtest nc --send-only -n -v $(ip route
get 8.8.8.8|grep -oP 'src \K\S+') 1000

Notice it works now.

You also can verify the MASQUERADE and DNAT rules are working for other
traffic by the following commands

    ip link set brtest promisc off
    ip netns exec brtest ping 8.8.8.8 -c 1
    echo hello | nc --send-only -n -v $(ip route get 8.8.8.8|grep -oP
'src \K\S+') 1000


So why does the MASQUERADE from the namespace only work when promiscuous
mode is on for the bridge?


-Patrick

