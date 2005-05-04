From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Wed, 4 May 2005 22:37:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505042221030.20686@blackhole.kfki.hu>
References: <4278C3DE.7010403@au-kbc.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278C3DE.7010403@au-kbc.org>
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
To: bharathi <bharathi@au-kbc.org>
Cc: netfilter@lists.netfilter.org

On Wed, 4 May 2005, bharathi wrote:

>         I am planning to implement iptables log feature on a server
> machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
> which is running in bridge mode (On RH 7.3).The average traffic on this
> machine is vary from 40-60Mbps.Hence I require some suggestion for some
> my questions like,

That seems to be a decent machine.

> 1) On this High traffic the kernel will be stable/crash ?

We tested netfilter in Gbit environment and could pump trough 200,000pps,
when NAT-ing all the traffic. There was no stability problem whatsoever.

> 2) What would be the CPU Load and the server is able to do this job
> without any pain ?

If there will be no exotic and expensive matches like 'string', then
there shouldn't be CPU problems. However choosing a good system bus,
nice interfaces and fastest RAM you can get will serve well.

> 3) Up to how much traffic the iptables/kernel can able to handle without
> any issue and what should I do additionally if I need the
>    iptable-log should handle this much traffic?

Set up another machine connected via a third interface directly and let
that machine fight with the disk I/O issues. Use the ULOG target instead
of LOG.  (And of course disable logging on the console :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

