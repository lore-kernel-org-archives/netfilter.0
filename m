From: Stephen Shirley <diamond+netfilter@skynet.ie>
Subject: conntrack broken with multiple gateways?
Date: Fri, 04 Feb 2005 04:30:39 +0000
Message-ID: <4202FA6F.5080500@skynet.ie>
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
     I have a linux box acting as a router (running debian unstable,
kernel 2.6.10, 686 dual proc) with 2 broadband connections to the net.
In my iptables, i have:

root@fluff:/proc(0)# iptables -t mangle -nvL PREROUTING
Chain PREROUTING (policy ACCEPT 44M packets, 33G bytes)
  pkts bytes target     prot opt in     out     source               destination
    26  2184 MARK       icmp --  *      *       10.85.0.147          0.0.0.0/0           MARK set 0x1
     9   444 MARK       tcp  --  *      *       10.85.0.147          0.0.0.0/0           tcp dpt:80 MARK set 0x1
root@fluff:/proc(0)# iptables -t nat -nvL POSTROUTING
Chain POSTROUTING (policy ACCEPT 16 packets, 952 bytes)
  pkts bytes target     prot opt in     out     source               destination
  326K   23M MASQUERADE  all  --  *      *       0.0.0.0/0            0.0.0.0/0

I have the following set with iproute:

root@fluff:/proc(0)# ip rule | grep fwmark
32765:  from all fwmark 0x1 lookup 1
root@fluff:/proc(0)# ip route ls table 1 | grep default
default via 192.168.1.1 dev eth1

So, this should do masqerading on all outbound traffic, normally via
dev ppp0 (the default route on the main ip route table), and via dev
eth1 for the above special cases (which are just test cases to
demonstrate the problem). However, it doesn't work. Using tcpdump on
eth1 and eth0, i can see pings going out eth1, to the correct address,
i can see replies coming back, to the correct address, but they never
appear on the local net. The output below is just after i attempted to
ping and telnet to port 80 on an external ip (136.201.105.1):

root@fluff:/proc(0)# cat net/ip_conntrack | grep 136.201.105.1
tcp      6 57 SYN_RECV src=10.85.0.147 dst=136.201.105.1 sport=50337
dport=80 packets=1 bytes=60 src=136.201.105.1 dst=192.168.1.107 sport=80
dport=50337 packets=4 bytes=240 mark=0 use=1
icmp     1 7 src=10.85.0.147 dst=136.201.105.1 type=8 code=0 id=4789
packets=6 bytes=504 [UNREPLIED] src=136.201.105.1 dst=192.168.1.107
type=0 code=0 id=4789 packets=0 bytes=0 mark=0 use=1

Note: eth1's address is 192.168.1.107.

So, have i just screwed up the conf, or is there actually a problem with
multi-gateway conntrack? I've tried this with at lesat 2.6.8 and 2.6.10
and gotten the exact same results.

Steve

