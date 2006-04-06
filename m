From: "Matthew Clark" <mjclark1@gmail.com>
Subject: Routing directed broadcast
Date: Fri, 7 Apr 2006 08:32:57 +1000
Message-ID: <780c228e0604061532va42dac9qcba87516672ae045@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi List,
I am wondering if there is any way to route directed broadcast packets
through a linux box using iptables.

So far I have tried (through a friends suggestion) to mark the packet
in the mangle table of the PREROUTING chain, change the packet to be a
packet that will route and then change it back to a broadcast on the
OUTPUT chain.
i.e.
Broadcasting to 10.200.172.255
Packets are coming in to eth0 (10.14.172.250/24)
Packets need to go out eth1 (10.200.172.250/24)
Have tried
iptables -t mangle -A PREROUTING -i eth0 -d 10.200.172.255  -j MARK
--set-mark 0x10
iptables -t nat -A PREROUTING -i eth0 -d 10.200.172.255 -j DNAT
--to-dest 10.200.172.254
iptables -v -t nat -A OUTPUT -d 10.200.172.254 --match mark --mark
0x10 -j DNAT --to-dest 10.200.172.255

But the problem I find is that whilst matching in the mangle table
Chain PREROUTING (policy ACCEPT 246K packets, 35M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
79687   19M MARK       all  --  eth0   *       0.0.0.0/0
10.200.172.255      MARK set 0x10

The packets don't make it to the nat table
Chain PREROUTING (policy ACCEPT 9014 packets, 567K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
  0     0 DNAT       all  --  eth0   *       0.0.0.0/0
10.200.172.255      to:10.200.172.254

Why are the packets not making to the nat PREROUTING chain?

Is there a better way of doing this?

Thanks in advance,
Matt.

Apologies if this email arrived twice, but I received an email saying
my first post failed because my source email address was not from a
subscribed member (rectified).

