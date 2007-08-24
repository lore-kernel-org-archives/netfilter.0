From: "Robert Ferney" <rob@cv-w.com>
Subject: Routing to DMZ with multiple ISP's
Date: Thu, 23 Aug 2007 19:37:39 -0600
Message-ID: <731f49cb0708231837o7ef8f511u6ce95ab5f9fe9751@mail.gmail.com>
References: <731f49cb0708231836l17371645yfa4567be170ec0ae@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <731f49cb0708231836l17371645yfa4567be170ec0ae@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok, I'm hitting my head on a brick wall of my ignorance here.

I have 10 DSL routers with associated internet connections.
They are all configured to DNAT all traffic on their external
interface to one internal Router.

I'm trying to DNAT all web traffic to a webserver at 192.168.7.4
It is working for the first connection, but it fails on the remainder
What am I missing?

Each DSL router is configured with a private subnet with a matching
configuration on the router..
 dsl1: 192.168.4.1/30
 dsl2: 192.168.4.5/30
 dsl3: 192.168.4.9/30
 .... and so forth..

Rather than try to explain my configuration further, I'll just give
the stripped down version of the configuration outputs from my router.

r1:~ # ip addr
2: eth1: <BROADCAST,MULTICAST,UP,10000> mtu 1500 qdisc pfifo_fast qlen 1000
    inet 192.168.6.1/24 brd 192.168.6.255 scope global eth1
3: eth2: <BROADCAST,MULTICAST,UP,10000> mtu 1500 qdisc pfifo_fast qlen 1000
     inet 192.168.4.2/30 brd 192.168.4.3 scope global eth2
    inet 192.168.4.6/30 brd  192.168.4.7 scope global eth2:d2
    inet 192.168.4.10/30 brd 192.168.4.11 scope global eth2:d3
4: eth0: <BROADCAST,MULTICAST,UP,10000> mtu 1500 qdisc pfifo_fast qlen 1000
    inet 192.168.7.1/24 brd 192.168.7.255 scope global eth0

r1:~ # ip rule list
0:      from all lookup local
10001:  from  192.168.4.2 lookup dsl1
10002:  from 192.168.4.6 lookup dsl2
10003:  from 192.168.4.10 lookup dsl3
32766:  from all lookup main
32767:  from all lookup default

r1:~ # ip route list table dsl1
192.168.4.0/30 dev eth2  scope link  src 192.168.4.2
192.168.4.4/30 dev eth2  scope link  src  192.168.4.6
192.168.4.8/30 dev eth2  scope link  src 192.168.4.10
192.168.7.0/24  dev eth0  scope link  src 192.168.7.1
192.168.6.0/24 dev eth1  scope link  src 192.168.6.1
 127.0.0.0/8 dev lo  scope link
default via 192.168.4.1 dev eth2

r1:~ # ip route list table dsl2
 192.168.4.0/30 dev eth2  scope link  src 192.168.4.2
 192.168.4.4/30 dev eth2  scope link  src 192.168.4.6
 192.168.4.8/30 dev eth2  scope link  src 192.168.4.10
 192.168.7.0/24 dev eth0  scope link  src 192.168.7.1
 192.168.6.0/24 dev eth1  scope link  src 192.168.6.1
 127.0.0.0/8 dev lo  scope link
 default via 192.168.4.5 dev eth2

 r1:~ # ip route list table dsl3
 192.168.4.0/30 dev eth2  scope link  src 192.168.4.2
 192.168.4.4/30 dev eth2  scope link  src 192.168.4.6
 192.168.4.8/30 dev eth2  scope link  src 192.168.4.10
 192.168.7.0/24 dev eth0  scope link  src 192.168.7.1
 192.168.6.0/24 dev eth1  scope link  src 192.168.6.1
 127.0.0.0/8 dev lo  scope link
 default via 192.168.4.9 dev eth2

r1:~ # iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  0.0.0.0/0             192.168.6.1         tcp
dpt:80 to:192.168.7.4
DNAT       tcp  --  0.0.0.0/0            192.168.4.2         tcp
dpt:80 to: 192.168.7.4
DNAT       tcp  --  0.0.0.0/0            192.168.4.6         tcp
dpt:80 to:192.168.7.4
DNAT       tcp  --  0.0.0.0/0            192.168.4.10        tcp
dpt:80 to:192.168.7.4

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

