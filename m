From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: INVALID FIN/ACK packets
Date: Thu, 15 Nov 2007 10:57:44 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0711151040590.13029@blackhole.kfki.hu>
References: <20071114100226.GA29362@thorin.admin.heise.de>
 <473B782F.2030907@olivier.pk.wau.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <473B782F.2030907@olivier.pk.wau.nl>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Sessink <lists@olivier.pk.wau.nl>
Cc: Aiko Barz <aiko@deepco.de>, netfilter@vger.kernel.org

On Wed, 14 Nov 2007, Olivier Sessink wrote:

> > I have one more server with this same kind of problem. "ACK RST" and
> > "ACK FIN" packets are involved.

Please enable full internal logging in netfilter and make sure at least 
one loggin target module is loaded in and record by tcpdump one full 
TCP session where such packets occurs. Then send me the generated kernel 
log and the dump file so that I could analyze it. 
 
> same problem here. Even on a local very high speed (gigabit) network I
> see INVALID packages when connections are closed (especially when the
> server load is high). I see them between blades in the same bladecenter.
> 
> I think that the timeouts are too strict. Most of the problems are
> solved (for me) when the timeouts are increased:
> 
> echo "240" >
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait
> echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close
> echo "240" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait
> echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack
> 
> perhaps one of the developers can elaborate why these timeouts are this
> strict by default?

If you increase the timeouts, then you may store dead connections 
unnecessarily. If you have got enough RAM and increased the hash size of 
the conntrack table then that's not a real problem of course.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
