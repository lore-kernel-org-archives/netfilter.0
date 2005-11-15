From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 15 Nov 2005 15:00:18 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4379E61F.5000807@rosi-kessel.org>
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

> Jozsef Kadlecsik wrote:
> >> Okay--would it be sufficient to grep on port 500? conntrack tracks by port,
> >> right? So as long as there are *no* entries in ip_conntrack for port 500 at
> >> any point while I'm trying to make this connection, doesn't it mean that
> >> conntrack isn't handling the packets?
> > Yes. And if conntrack does not handle them, NAT won't do either.
>
> Actually, now that I've *triple*-checked, I got a different result. I'm not
> sure why this wasn't happening before, or if I was misreading the
> ip_conntrack table, but now I *am* seeing the connection in question on port
> 500.  It is marked as ASSURED which I understand to mean that two way
> traffic has occurred.

Yes. Do you see the effect of the NAT table on the conntrack entry?

> So, setting aside the question of why I wasn't seeing that before, shouldn't
> I be able to see the incoming packets as they are routed to the internal
> client machine, even if they are tracked connections?  When I watch the
> inward-facing interface with tcpdump, I don't see any of these packets
> getting routed to that machine, although I do see the outbound packets.

I don't clearly understand you here. It is always best to run tcpdump on
both interfaces so that one can compare what packets are routed properly
and how they were mangled/NAT-ed by the firewall. If some packets are
missing from either side then that's a clear sign that those packets were
dropped by either a matching rule/policy or by the system itself.

Did the logging produce anything?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

