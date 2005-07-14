From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 over nat firewall - queries
Date: Thu, 14 Jul 2005 09:59:10 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507140957040.16532@blackhole.kfki.hu>
References: <016601c58848$5ab54860$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <016601c58848$5ab54860$1280a8c0@newlife>
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

On Thu, 14 Jul 2005, Ming-Ching Tiew wrote:

> > I have a case where I have H323 VoIP equipments located behind
> > Linux nat-box running ip_h323_nat and ip_conntrack_h323.
> >
> > We have various combination of traffic and some of them deemed
> > successful and some of them I experience some weird problems
> > such as not able to hear to voice and/or chopping voice.
> >
> > Upon troubleshooting and narrowing down the problem, I suspect
> > that the modules might have some limitation and so I am posting
> > here to see if anyone enlighten me on this subject.
> >
> > I remember certain conntrack modules only allow one client to be
> > behind nat, so I am asking :-
> >
> > If I have one H323 VoIP equipment going to multiple H323 counter
> > parts on the internet at the same time, via the Linux nat conntrack
> > module, if it is going to work correctly ? ie I have one source private
> > IP, but going to multiple destination public IPs via the H323 conntrack
> > module, is this a supported configuration ?
>
> I did not get any comments on this ?
>
> Upon further checking I found the 2.6 kernel has a difference source
> from the 2.4 kernel and my problem was seen on 2.4 kernel. By any
> chance, this "suspected limitation" has been fixed in 2.6 kernel ?
>
> Is it worthwhile testing it on 2.6 kernel ?

Definitely yes. The H.323 support was completely rewritten - actually,
truly implemented - by Max Kellermann in the 2.6 tree. You should give a
try.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

