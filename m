From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Fri, 22 May 2009 09:21:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905220917190.14889@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com>  <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>  <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>  <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>  <4A1466F6.8070304@tigertech.com>
  <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu>  <alpine.DEB.2.00.0905211729090.13699@blackhole.kfki.hu>  <4A15A156.6030400@tigertech.com> <38db14850905212132x3d4f4d83y6808ad89d2d79324@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905212132x3d4f4d83y6808ad89d2d79324@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: Robert L Mathews <lists@tigertech.com>, netfilter@vger.kernel.org

On Fri, 22 May 2009, Anatoly Muliarski wrote:

> The problem consists in that RST-packet with wrong sequence number
> must be treated as INVALID.
> IMHO, the conntrack code should be changed in this way.
> 
> I wrote a fix( sorry, I don't experienced in kernel tcp stack  -
> correct me if I somewhere wrong).
> 
> *** nf_conntrack_proto_tcp.c    2009-05-22 07:22:43.000000000 +0300
> --- /usr/src/linux/1/nf_conntrack_proto_tcp.c   2008-09-08
> 13:20:51.000000000 +0300
> *************** static int tcp_packet(struct nf_conn *ct
> *** 969,979 ****
>                    problem case, so we can delete the conntrack
>                    immediately.  --RR */
>                 if (th->rst) {
> !                 if (ntohl(th->seq) < ct->proto.tcp.last_seq) {
> !                   ct->proto.tcp.state = old_state;
> !                   return -NF_DROP;
> !                 }
> !                       else if (del_timer(&ct->timeout))
>                                 ct->timeout.function((unsigned long)ct);
>                         return NF_ACCEPT;
>                 }
> --- 969,975 ----
>                    problem case, so we can delete the conntrack
>                    immediately.  --RR */
>                 if (th->rst) {
> !                       if (del_timer(&ct->timeout))
>                                 ct->timeout.function((unsigned long)ct);
>                         return NF_ACCEPT;
>                 }

That won't work: the packet which sequence number was recorded in last_seq 
may get lost in transit to the destination and we may receive a *valid* 
RST with a sequence number less than the one in last_seq.

This is the main problem: we can never be sure the packets which are seen 
by firewall do really reach the destination or they order is preserved.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
