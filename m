From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 15:13:26 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806191507580.11904@blackhole.kfki.hu>
References: <200806181415.00808.vladislav.kurz@webstep.net>
 <200806191231.56317.vladislav.kurz@webstep.net>
 <Pine.LNX.4.64.0806191244430.11904@blackhole.kfki.hu>
 <200806191346.14950.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200806191346.14950.vladislav.kurz@webstep.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladislav Kurz <vladislav.kurz@webstep.net>
Cc: netfilter@vger.kernel.org

On Thu, 19 Jun 2008, Vladislav Kurz wrote:

> > > Last line is logged by iptables. What I wonder is that there is
> > > corresponding log from iptables to "ACK is under the lower bound" but not
> > > to "SEQ is under the lower bound".
> >
> > That is strange. If you log INVALID packets, then you should get the
> > correspondig log lines.
> 
> Well, my bad in this case, I forgot to log INVALID in OUTPUT chain. 
> But anyway I see lots of "ip_ct_tcp: invalid packet ignored" without 
> corresponding log from iptables. And vice-versa, iptables log much more 
> invalid TCP packets then ip_ct_tcp does.

If iptables logs much more INVALID TCP packets than what is logged by 
ip_conntrack_log_invalid, that's normal. The latter simply gives more 
information on why the packet was flagged as INVALID, for selected cases. 
Not for all INVALID TCP packets. But you should always find the 
corresponding log lines if you log INVALID packets too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
