From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing between two firewalls
Date: Wed, 23 Jun 2004 10:34:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231034.54767.Antony@Soft-Solutions.co.uk>
References: <40D94B3D.8050308@openscroll.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D94B3D.8050308@openscroll.org>
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

On Wednesday 23 June 2004 10:19 am, Sudhakar Chandra wrote:

> I have a setup that I assume should be pretty common.  I have a LAN
> (192.168.100.0/24) which has two gateways / firewalls on it.  Both the
> gateways are dual-homed.
>
> LAN ---> (192.168.100.1) Gateway 1 (isp1.global.ip) --->
> LAN ---> (192.168.100.2) Gateway 2 (isp2.global.ip) --->
>
> Gateway 1 routes through ISP1 and Gateway 2 through ISP2.  Some machines
> in my LAN have .1 set as the gateway and some have .2 as the gateway.
>
> I have my mail server connected to one of the global IPs that ISP2 has
> given me.  Or in other words, mail server is on the same subnet as the
> external interface of Gateway 2.
>
> As things are today, packets originating on machines having Gateway 1 as
> their default gateway traverse out through ISP1, the global internet,
> back through ISP2 into my global ISP2 subnet.  This is a waste of
> bandwidth as well as slow.
>
> I want to set up a rule on Gateway 1 such that all packets destined to
> my mail server (actually, my entire ISP2 subnet) should be sent to
> Gateway 2 for routing.
>
> I tried adding a static route on Gateway 1 to route all packets destined
> to the mail server to Gateway 2 like so:
>
> route add -host mail.server.ip gw 192.168.100.2
>
> After I set this up, I am able to traceroute to mail server (packets
> flow through Gateway 2).  But when I try connecting to port 25, nothing
> happens.

Do you have FORWARDing rules on both gateways allowing TCP port 25 packets 
from your internal network to the mail server?

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


