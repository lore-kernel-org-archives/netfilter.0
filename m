From: "kaiwen" <cal_kaiwen@hotmail.com>
Subject: Re: Match packet mark with --set-mark to ip rule fwmark
Date: Wed, 7 Jan 2004 13:35:38 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LAW11-OE14FjwUbowDp0001e8e9@hotmail.com>
References: <Law11-OE68Dt3HvoFOA00000021@hotmail.com> <3FFB927B.4010208@snapgear.com>
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Hi,

My new configurations:-

Network Diagram:
--- 192.168.250.197 (eth0) Linux Box (eth1)
192.168.8.88 -------------192.168.8.122 (eth0) Windows XP Client

Configuration A
(1) [root@g root]# ip ru
0:      from all lookup local
32765:  from all fwmark        5 lookup test2
32766:  from all lookup main
32767:  from all lookup 253

(2)[root@g root]# ip ro show table test2
prohibit 192.168.8.88
prohibit 192.168.250.197

(3) [root@g root]# iptables -t mangle -L
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x5

(4) [root@g root]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.250.0   0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.8.0     0.0.0.0         255.255.255.0   U     0      0        0 br0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.250.254 0.0.0.0         UG    0      0        0 eth0

Ping from 192.168.8.122 to 192.168.250.197 is still successful. :|

Take a look at ip rule, the first rule route all packet to table local,
which has a route for 192.168.8.0/24. Is it true that once there is one rule
which match for the packet, it will route according to it. If so, I remove
the route from table local and put it at table test2, which is
Configurations B.

Configurations B

(1) [root@g root]# ip ru
0:      from all lookup local
32765:  from all fwmark        5 lookup test2
32766:  from all lookup main
32767:  from all lookup 253

(2) [root@g root]# ip ro show table test2
prohibit 192.168.8.88
prohibit 192.168.250.197
192.168.8.0/24 via 192.168.8.88 dev br0

(3) [root@g root]# iptables -t mangle -L
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x5

(4) [root@g root]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.250.0   0.0.0.0         255.255.255.0   U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.250.254 0.0.0.0         UG    0      0        0 eth0

Yet, Ping from 192.168.8.122 to 192.168.250.197 is still successful.

Please advice :)


----- Original Message -----
From: "Philip Craig" <philipc@snapgear.com>
To: "kaiwen" <cal_kaiwen@hotmail.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 07, 2004 1:00 PM
Subject: Re: Match packet mark with --set-mark to ip rule fwmark


> kaiwen wrote:
> > (3) [root@g webauth]# ip ro show table test2
> > prohibit 192.168.8.122
> >
> > I expect ping from 192.168.8.122 to 192.168.250.197 to be drop, BUT is
is
> > successful. Why?
> > Did I miss out anything? Please advice.
>
> prohibit specifies the destination address, not the source.  So the ping
> from 192.168.8.122 to 192.168.250.197 will get through.  Additionally,
> the reply goes through OUTPUT, not PREROUTING, so it won't be marked and
> dropped either.  If you add your mark rule to the OUTPUT chain, then you
> should see the reply being dropped.
>
> I assume you are just using prohibit for testing: there is no point
> marking a packet with iptables and then dropping it iproute2, when you
> could just drop it with iptables in the first place.
>
> --
> Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com
>
>

