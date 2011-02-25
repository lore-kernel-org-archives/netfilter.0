From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset -R
Date: Fri, 25 Feb 2011 15:06:34 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102251431210.20179@blackhole.kfki.hu>
References: <4D645BC7.7030306@googlemail.com> <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu> <4D659102.8090501@googlemail.com> <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com> <4D664C9F.3020701@googlemail.com>
 <alpine.DEB.2.00.1102250915200.20179@blackhole.kfki.hu> <4D67AE2C.3010902@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D67AE2C.3010902@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Pandu Poluan <pandu@poluan.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 25 Feb 2011, Mr Dash Four wrote:

> > However with hash:net type
> > 
> > # ipset -N test hash:net
> > # ipset -A test 10.1.1.0/24
> > # ipset -D test 10.1.1.12
> > ipset v6.0: Element cannot be deleted from the set: it's not added
> >   
> Well, that's plain wrong, isn't it? The 'element' 10.1.1.12 does exist and it
> is added (albeit implicitly as part of 10.1.1.0/24). I also presume 'ipset -T
> test 10.1.1.12' will return a positive result, so there is something which
> isn't quite right.

10.1.1.12/32 is not an explicit member of the set above, therefore you 
cannot delete it.

At testing elements, the host addresses are a special case and checked 
from the kernel point of view. So *testing* 10.1.1.12 returns a true 
value. The reason for the exception is that the kernel at matching, 
deleting, adding entries works on host addresses and that way one can 
check the kernel view of the set from userspace.
 
> > and that's also right, because the hash types do not magically figure out
> > overlapping ranges and collapse those or break up ranges into parts when
> > deleting intersecting elements.
> >   
> I do not know the reasons for removing this as it was a nice 'feature' though
> I now understand the 'deletion' part even if I do not agree with it.

The feature was the part of a single set type and not the ipset core.
 
> > The hash:*net* types could be extended to store non-matching elements,
> > something like this:
> > 
> > # ipset -N test hash:net
> > # ipset -A test 10.1.1.0/24
> > # ipset -A test 10.1.1.12 --nomatch
> > 
> > That way overlapping entries with different "access right" could be stored
> > in a single set. But any coding needs time and testing.
> >   
> I am not sure I understand the above - is this already implemented (in 6.0?)
> or is this on the 'drawing board' so to speak? What do you mean by 'access
> right'?

Not implemented, just thinking. If the feature were implemented then the 
testing in the set would return false for 10.1.1.12 and true for every 
other element from 10.1.1.0/24.

> On a separate query relating to my initial post of this thread - Pandu Poluan
> proposed a nice 'get-out-of-jail' solution to my problem, which I already
> found a way to optimise a little, but need to make sure I am doing the right
> thing: if I have my whitelist, blacklist-1, blacklist-2 ... blacklist-x sets
> registered and they have (quite a lot of) members can I then do this:
> 
> ipset -N list blacklist-all
> ipset -A blacklist-all blacklist-1
> ...
> ipset -A blacklist-all blacklist-x
> 
> and then add my iptables statement:
> 
> (1) -m set ! --match-set whitelist src -m set --match-set blacklist-all src -j
> DROP
> 
> Would that be the equivalent of (2):
> 
> -m set ! --match-set whitelist src -m set --match-set blacklist-1 src -j DROP
> ...
> -m set ! --match-set whitelist src -m set --match-set blacklist-x src -j DROP

Yes, it would be equivalent.
 
> In other words, I combine all of my blacklisted sets into one of type 'list'
> where I assume 1) that all sub-set elements of the 'list' set are queried for
> a match; and 2) executing one iptables statement with a set match/mismatch
> (i.e. 1 above) is better, performance-wise, than (potentially) traversing
> through multiple iptables statements with a set match/mismatch (as shown on 2
> above)?

With first case you spare the iptables rules and the matchings in 
"whitelist".
 
> If so, how is the blacklist-all set stored - do you copy all the elements of
> all the sets into a separate memory space or do you just reference the set
> (which means that if I alter, say, blacklist-2, the changes are
> 'automatically' applied to blacklist-all as well)?

No copying whatsoever: the member sets are referenced and pointed to. 
Please note, you cannot delete the member sets, however you can swap them 
anytime with another, same type of set.
 
> I can't combine all elements of my blacklist-x sets into one big one because
> 1) I use separate blacklist-x sets elsewhere in my ip chains; and 2) my
> blacklist-x sets are not of the same type.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
