From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Simple question about ipset
Date: Wed, 20 Sep 2006 15:57:56 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0609201549540.31176@blackhole.kfki.hu>
References: <006701c6dcba$167a4f20$02bca8c0@freelance>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006701c6dcba$167a4f20$02bca8c0@freelance>
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
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

On Wed, 20 Sep 2006, Ming-Ching Tiew wrote:

> >I have been reading ipset from http://ipset.netfilter.org/features.html
> >quite a few times but still do not understand what does it mean
> >by this :-
> >
> >    iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT
> >
> >My question is why the flag is dst,dst ?
> >
> >And similarly what is the significance if it is src,dst ?
> >What if it is src,dst,dst and so on ?
>
> Gosh I think something sudden sparked my mind, I think I understand it now.
> The number of flags ties to the bindings, ie this example it is ip->port,
> then dst,dst would means check the destination ip, and destination port.
> Had the flags be src,dst, then it is checking the source ip and destination port.

Exactly. Also, if the set type itself store data pairs like in the case of
ipporthash, you have to define what kind of info from the packet must be
matched against the given set: (source or dest ip) and (source or dest)
port. I.e if set 'servers' is of type ipporthash, you should use

iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT

to match all of your servers (IP addresses) and their service ports, if
the set is properly filled up.

> I hope my understanding is correct. Perhaps the docs should explain it more
> clearly.

Yes, the docs are terse. Patches against the docs are (also) always
welcomed.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

