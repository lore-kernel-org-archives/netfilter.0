From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Wed, 16 Nov 2005 10:42:38 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
References: <4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051115235319.GA1727@bostoncoop.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On Tue, 15 Nov 2005, Adam Rosi-Kessel wrote:

> Jozsef: By the way, I'm unable to email you directly either from my
> personal account or from gmail. I assume that is by design, but I thought
> I'd mention it just in case.

*.dsl.speakeasy.net is blacklisted at our campus.

> No luck with logging, but I don't seem to have
> /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
> even with ipt_LOG or ipt_ULOG loaded.
>
> I'm running kernel 2.6.8-2-k7 from Debian Stable, iptables v1.2.11.

Try to upgrade to a newer kernel.

> I did try adding the LOG rule to mangle PREROUTING for INVALID packets
> but there was no result.

That means the packets are not INVALID then. Drop the INVALID state
matching part from the logging rule and repeat the test.

> Below is the output of everything I can think of that would be relevant.
[...]
> # netstat-nat -n | grep 500
> udp   LOCAL_CLIENT:500              SERVER:500            ASSURED

The connection is in the conntrack table and the NAT rule was applied.
Good. But next time please send the output of
'grep port=500 /proc/net/ip_conntrack' instead.

> # tcpdump -i any 'udp port 500'
> 18:40:06.977738 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
> 18:40:06.977836 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg

Packet natted and sent out.

> 18:40:07.620295 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
> 18:40:15.154788 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg

Server responds but it seems the firewall does not forward the packet.

I have no better idea than repeating the test with general logging in the
mangle table. You mentioned the raw table earlier. What is the output of
'iptables -t raw -L'? Do you know what (other) patches from
patch-o-matic(-ng) was applied in your kernel?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

