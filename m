From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: binding nntp to one interface
Date: Thu, 12 Sep 2002 11:15:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D805B25.1060001@fugmann.dhs.org>
References: <5.1.0.14.2.20020912090056.012e6d48@linda>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Cc: netfilter@lists.samba.org

Rasmus Reinholdt Nielsen wrote:
> Hi
> 
> I have two different internet connections, to two different ISP's, set 
> up as load balancing.
> 
> My problem is that both my isp's have ip restricted their newsservers, 
> so I need to bind all outgoing trafic on port 119 to a specific 
> interface or ip. Anybody knows how to do this?

You have to use the iproute2 program package to do this. iptables cannot 
set or change routes, only hint on how routing should be done by marking
packets. In the mangle-PREROUTING chain, use the MARK target to mark the
packets with some id:

iptables -t mangel -A PREROUTING -d news.isp.dk --dport 119 -j MARK 
--set-mark 1
iptables -t mangel -A OUTPUT -d news.isp.dk --dport 119 -j MARK --set-mark 1

Next use the iproute2 package and create a routing policy, which
send the packets in the correct routing table.

I'm not that familliar with iproute2, but i guess that the following 
would work:

list all possible routes to the news server:
$ ip route get news.isp.dk
This should list two routes:
xx.xx.xx.xx dev eth0 src yy.yy.yy.yy realms AA...
xx.xx.xx.xx dev eth1 src zz.zz.zz.zz realms BB...

Say that you want to route through eth0, then instruct the routing that 
it should route all packets with mark 10 to this realm:
$ ip rule add fwmark 10 table BB prio 100

As I said, I am not familliar with this, so it is only a qualified 
guess. Take a look at lartc.org and the documentation in the iproute 
package on howto set this up.

Hope it works
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent/Iptables FIREWALL
http://fiaif.fugmann.dhs.org


