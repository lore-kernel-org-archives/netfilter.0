From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Multi ISP router/firewall ...
Date: Wed, 28 Mar 2007 14:21:50 +0200
Message-ID: <1175084510.4084.4.camel@rayw.internal>
References: <3564089.276511175009558150.JavaMail.www@wwinf1504>
	<1175061118.21066.34.camel@rayw.internal>
	<Pine.LNX.4.61.0703280816500.32661@yvahk01.tjqt.qr>
	<1175064190.21066.48.camel@rayw.internal>
Reply-To: spoons@rchq.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1175064190.21066.48.camel@rayw.internal>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi All

Managed to sort this out.

The problem was that reverse path filtering had to be enabled on the
eth4 interface. All my other interfaces have reverse path filtering
disabled, so what's the difference with this one?

Regards

Ray

On Wed, 2007-03-28 at 08:58 +0200, Ray Leach wrote:
> On Wed, 2007-03-28 at 08:18 +0200, Jan Engelhardt wrote:
> > On Mar 28 2007 07:51, Ray Leach wrote:
> > >
> > >I tried both methods - iptables using the ROUTE target as well as using
> > >iptables to mark the packets, then using iproute2 to lookup and route
> > >using a table with an ip fwmark rule.
> > >
> > >In both cases, the traffic is routed out and return traffic comes back
> > >in the correct interface, but it does not get NATed backed to the
> > >client.
> > >
> > >iptables -A FORWARD -i eth0 -p tcp --dport 80 -s 10.0.0.3 -j ACCEPT
> > >iptables -A FORWARD -i eth4 -p tcp --sport 80 -d 10.0.0.3 -j ACCEPT
> > >
> > >iptables -A FORWARD -t mangle -p tcp --dport 80 -s 10.0.0.3 -j MARK
> > >--set-mark 0x4
> > 
> > The routing decision is done before the FORWARDing chain is entered.
> > Try moving the MARK to INPUT.
> > 
> 
> The source traffic is not from the firewall machine, but another machine
> on the local LAN. The mark is being set properly and the traffic is
> routed out the eth4 interface correctly, so the mark logic is working.
> 
> 
> The setup is something like this:
> 
> 
> 
>                                 |    eth6|(196.7.34.98)<---->ISP1
> |PROXY|(10.0.0.3)<--->(10.0.0.2)|FIREWALL|
>                                 |    eth4|(10.1.0.2)<--->(10.1.0.1)ISP2
> 
> 
> ip route show table main
> 196.7.34.96/28 dev eth6  proto kernel  scope link  src 196.7.34.98
> 10.0.0.0/24 dev eth0  proto kernel  scope link  src 10.0.0.2
> 10.1.0.0/24 dev eth4  proto kernel  scope link  src 10.1.0.2
> 
> ip route show table 4
> default via 10.1.0.1 dev eth4
> 
> ip rule
> 0:      from all lookup local 
> 32000:  from all fwmark 0x4 lookup 4 
> 32766:  from all lookup main 
> 32767:  from all lookup default
> 
> 
> tcpdump -n -i eth4 shows my traffic exiting after being SNATed to
> 10.1.0.2 and reply traffic re-entering .
> 
> tcpdump -n -i eth0 src or dst 10.0.0.3 and port 80 shows my traffic
> exiting from the source (10.0.0.3), but nothing ever returns.
> 
> I have checked to make sure nothing is dropped, and also noticed that
> the 2 forwarding rules above only show traffic out from eth0, the return
> rule does not show any traffic. This is why I think the SNAT is not
> working correctly when the traffic comes back in.
> 
> My last option is to do the nat using iproute2 instead of iptables.
> My question is, why is SNAT working on the other 4 interfaces on this
> firewall, but not on this one?
> 
> 
> > >iptables -A POSTROUTING -t nat -o eth4 -p tcp --dport 80 -s 10.0.0.3 -j
> > >SNAT --to 10.1.0.2
> > >
> > >ip rule del fwmark 4 table 4 priority 32000
> > >ip route flush table 4
> > >ip route add table 4 default via 10.1.0.1
> > >ip rule add fwmark 4 table 4 priority 32000
> > >ip route flush cache
> > >
> > >
> > >What am I doing wrong?
> > >
> > >Looking in /proc/net/ip_conntrack I can find an entry for http traffic
> > >from machine at ip 10.0.0.3 created by the SNAT rule above. When the
> > >traffic returns back in eth4 it seems to disappear on the firewall ...
> > 
> > Jan
-- 
Raymond Leach
Knowledge Factory (http://www.knowledgefactory.co.za)
(Tel)+27-11-445-8100  (Fax)+27-11-445-8101
-- 
Raymond Leach
RCHQ Hobbies (http://www.rchq.co.za/)
(T)+27-82-575-6975 (F)+27-86-652-2773


