From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset: stops working after a while
Date: Fri, 8 Jun 2012 09:29:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1206080923110.14633@blackhole.kfki.hu>
References: <4FD03AE5.9000509@gmc.lt> <alpine.DEB.2.00.1206070856221.11710@blackhole.kfki.hu> <4FD0E83D.7030806@gmc.lt> <201206071722.41790.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201206071722.41790.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On Thu, 7 Jun 2012, Neal Murphy wrote:

> On Thursday 07 June 2012 13:43:25 Aidas Kasparas wrote:
> > On 2012.06.07 09:59, Jozsef Kadlecsik wrote:
> > > Maybe your given set gets full. From the manpage:
> > > 
> > > "When  entries  added  by the SET target of iptables/ip6tables, then the
> > > hash size is fixed and the set won't be duplicated,  even  if  the  new
> > > entry cannot be added to the set."
> > 
> > Ok. But if set is full, and I list it, it should show at least some
> > members present. When it stops working, it shows no members at all.
> > 
> > On the other hand, I create sets with timeout 10. So, every 3 secs there
> > should be expiration process which trows ~ 1/3 of entries from each
> > chain. And this should make place for some new entries.
> 
> I'll address *your* problem, not the problem you observed with the ipset code 
> (which may be a real problem).
> 
> How many entres are in the set when it is 'full'? Have you tried setting the 
> initial size of the hash to the maximum (64ki?)?

According to the listing of the set:

# ipset list fd_88
Name: fd_88
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536 timeout 10
                             ^^^^
Size in memory: 82040
References: 3
Members:

Because the SET target won't trigger increasing the hash size and the 
max collision is limited to 12, that means there can be at the maximum 
12*1024 elements in that set. And that's the theoretical maximum.

By the way the hash size is not limited in ipset 6.x when creating a hash 
type of set.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
