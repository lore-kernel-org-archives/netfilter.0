From: Michiel Brandenburg <michielb@stack.nl>
Subject: Transparent Bridge DNAT Strangeness
Date: Sun, 20 Jun 2004 22:48:01 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040620224731.H114@toad.stack.nl>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I was wondering if anyone could help me with the following:

I'm running kernel 2.6.7 on unstable debian with bridging.
Now the bridge works and I can block + accept traffic on the bridge with
no problems.  Bridge has an ip number + a default route is set.  IP
forwarding is activated and the bridge is between my internal network and
my router (that will masq for my network and send all incomming
connections to the ip number of my bridge).

I can connect from internet to all running services on my firewall.  Now
the problem starts when I want to DNAT some traffic to other computers
within my internal net.

iptables -t nat -I PREROUTING -m physdev --physdev-in eth1 \
    -p tcp -d 192.168.1.51 -s ! 192.168.0.0/16 \
    --dport 41111 -j DNAT --to 192.168.1.101:41111

As soon as this dnat rule is set I can connect from internet to 41111 and
get dnatted.  But all other connections to the bridge will fail. Even to
ports that worked before the dnat rule.

I added the relevant part of ip_conntrack below.  I can see the packets
pass the bridge but they no reply is generated.
tcp      6 47 TIME_WAIT src=x.x.x.x dst=192.168.1.51 sport=43823
    dport=41111 src=192.168.1.101 dst=x.x.x.x sport=41111 dport=43823
    [ASSURED] use=1
tcp      6 92 SYN_SENT src=x.x.x.x dst=192.168.1.51 sport=43833 dport=22
    [UNREPLIED] src=192.168.1.51 dst=x.x.x.x sport=22 dport=43833 use=1
tcp      6 45 SYN_SENT src=x.x.x.x dst=192.168.1.51 sport=43832 dport=25
    [UNREPLIED] src=192.168.1.51 dst=x.x.x.x sport=25 dport=43832 use=1

If I read the ip_conntrack correctly I assume that the new incomming
connection is replied but I can not find the return packet on any
interface.

Can someone point out what is going wrong, if more information is needed
please tell me.

Michiel Brandenburg.

