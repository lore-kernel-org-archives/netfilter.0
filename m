From: "Rimas" <rmocius@auste.elnet.lt>
Subject: Re: IP MASQ and IPROUTE2?
Date: Tue, 15 Oct 2002 13:11:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01d201c27444$113613b0$6e69690a@rimas>
References: <001101c273f5$fc2c5220$c300a8c0@COMPAQ>
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
To: netfilter@lists.netfilter.org
Cc: Sean Oh <oh@storageone.co.kr>

Sean,

You need to both eth cards.
Like this:

iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_1 -j MASQUERADE
iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_2 -j MASQUERADE

Rimas




----- Original Message -----
From: "Sean Oh" <oh@storageone.co.kr>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, October 15, 2002 3:53 AM
Subject: IP MASQ and IPROUTE2?


> Hi
>
> I am having a little problem with IP MASQ and IPROUTE2.
> I am using RedHat 7.3 with IPTABLES.
>
> I have a linux gateway server with 3 NICs.
> The environment is as follows:
>
>
> Local Network      +------------+ eth1(218.x.x.20) --> ISP1
> (192.168.0.x) --- | Linux Server |--------
>                 eth0   |                    |
>       192.168.0.1  |                    |--------
>                          +-------------+ eth2(211.x.x.155) -->ISP2
>
>
> The eth1 and eth2 are the links to internet. I  have 2 providers to
Internet
> and I would like to use eth2 as the default route to internet from Local
> Network(192.168.0.x) and eth1 as for the servers(DNS, mail, web) that
people from external Internet
> to access. The reason behind that is that provider ISP2 are not
> allowing me to run servers on that link, so I had to setup another link
for
> servers(eth1).
>
> The IP masqurading is used and ip forwarding is turned on.
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> /sbin/ip route add 211.x.x.128 dev eth2 src 211.x.x.155 table SI
> /sbin/ip route add default via 211.x.x.129 table SI
> /sbin/ip route add 218.x.x.0 dev eth1 src 218.x.x.20 table KT
> /sbin/ip route add default via 218.x.x.1 table KT
>
> /sbin/ip route add 211.x.x.128 dev eth2 src 211.x.x.155
> /sbin/ip route add 218.x.x.0 dev eth1 src 218.x.x.20
>
> /sbin/ip route add default via 211.x.x.129
>
> /sbin/ip rule add from 211.x.x.155 table SI
> /sbin/ip rule add from 218.x.x.20 table KT
>
> /sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
> /sbin/iptables -P FORWARD ACCEPT
> /sbin/iptables -P INPUT ACCEPT
> /sbin/iptables -P OUTPUT ACCEPT
>
>
> [root@www root]# ip route show
> 211.x.x.128 dev eth2  scope link  src 211.x.x.155
> 218.x.x.0 dev eth1  scope link  src 218.x.x.20
> 211.x.x.128/25 dev eth2  scope link
> 192.168.0.0/24 dev eth0  scope link
> 218.x.x.0/24 dev eth1  scope link
> 127.0.0.0/8 dev lo  scope link
> default via 211.x.x.129 dev eth2
>
>
> it works fine( 192.168.0.x can access the internet by masquerading via
eth2 and external internet can access the eth1 and eth2).
> But the problem is that the hosts in the local network (192.168.0.x) can
not access 211.x.x.155(eth2) and 218.x.x.20(eth1), even though ip forwarding
is turned on. It can only access 192.168.0.1
>
> Could someone please sugguested me the solutions?
>
> Thanks in advance.
>
>



