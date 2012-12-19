From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset save and restore
Date: Thu, 20 Dec 2012 00:24:28 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1212200011460.23577@blackhole.kfki.hu>
References: <1355928786.30355.22.camel@heisenberg.scientia.net>  <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu> <1355955834.5199.27.camel@fermat.scientia.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1355955834.5199.27.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@lmu.de>
Cc: netfilter@vger.kernel.org

On Wed, 19 Dec 2012, Christoph Anton Mitterer wrote:

> On Wed, 2012-12-19 at 22:01 +0100, Jozsef Kadlecsik wrote:
> > > Of course I understand that it could not delete sets which are in use,
> > > but at least it could empty them.
> > Restore mode is flexible. If you want the sets to be emptied first, then 
> > start with the flush command (in the file).
> Phew... I'd rather say it's less powerful... if someone really want's
> fine grained control, he can still use the single commands.
> 
> restore is even documented in the ipset manpage to do what e.g. iptables
> restore does... getting the session back... but it doesn't.
> I think that should definitely be documented better.

Restore executes the commands specified in the saved session file. If the 
current state is not appropriate for the commands (set already exist, 
etc.), then it'll fail. I'll add this to the manpage.
  
> > > Now when I use the following instead:
> > > ipset flush
> > > ipset destroy
> > > ipset restore < file
> > 
> > Why do you destroy the sets?
> Well if you have long running systems and sets get unused one probably
> want's to release their memory.

But then why do you want to restore them, if those sets are unused?
 
> btw: "ipset destroy" fails if a single set still contains entries...

That's not true. Maybe you mix "set contains entries" with "set used in a 
rule"?

> wouldn't it be better if all empty sets are destroyed and it only fails
> on those which are not?

I don't understand your sentence at all...
 
> > If the sets are in use then you cannot delete 
> > them at all.
> I understand that this might be necessary from a technical point of
> view,.. but wouldn't it be simply possible to consider non-existing sets
> to be empty sets?

Non-existing sets are ... non-existent. 
  
> > If you are not concerned that for a very small time the sets are empty, 
> > then simply start with the flush command in the restore file and that's 
> > all (I don't see why you'd want to destroy those).
> Well I'd have expected that everybody would be concerned... when you
> have some high speed network you surely will loose packets...

That can happen for new connections only (unless you don't use conntrack 
at all.)
 
> > If you want to avoid the time while the sets are empty, then use the 
> > sequence of
> > 
> > - restore into a temporary set
> > - swap the set with the temporary one
> > - destroy the temporary set
> Thanks... this is at least a way... but unfortunately someone that
> implies some additional programming effort...
> 
> Actually the above would be what one would expect from the restore
> command, I guess.
> 
> No chance that the semantics are changed here?

No, not really.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
