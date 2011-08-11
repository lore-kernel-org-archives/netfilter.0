From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 12:12:04 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313055975.3628.56.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, 11 Aug 2011, John A. Sullivan III wrote:

> Hello, all.  We have been having a subtle problem with conntrack for
> quite a long time but it has suddenly gotten much worse.  Packets are
> being matched as INVALID when we would expect them to be ESTABLISHED.
> We are running on kernel 2.6.30.5 on X86_64 with CentOS 5.4 and
> iptables-1.3.5-5.3.el5_4.1.  This has escalated from a minor annoyance
> that we were going to investigate to provoking serious outages and all
> hands to the pump.
> 
> The conntrack table is not swamped although we did increase the max
> count and the hashsize just in case to no avail:
> [root@fw01 netfilter]# cat ip_conntrack_max
> 65536
> [root@fw01 netfilter]# cat ip_conntrack_count
> 532
> 
> Here are three specific examples.  The first is from the FORWARD chain.
> Here are the logging messages:
>  
> Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=bond1 OUT=bond4
> SRC=172.x.y.73 DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940
> DF PROTO=TCP SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0

Those are, with high probabilty, late FIN packets: the belonging conntrack 
entry has already been deleted and thus conntrack cannot find the matching 
stream, therefore it sets as INVALID.

> So why is the reply packet INVALID instead of ESTABLISHED? How can we
> troubleshoot?

If NAT is enabled, never ever let packets with INVALID state pass through, 
because NAT will skip them.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
