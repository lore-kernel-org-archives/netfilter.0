From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset save and restore
Date: Wed, 19 Dec 2012 22:01:55 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu>
References: <1355928786.30355.22.camel@heisenberg.scientia.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1355928786.30355.22.camel@heisenberg.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@lmu.de>
Cc: netfilter@vger.kernel.org

On Wed, 19 Dec 2012, Christoph Anton Mitterer wrote:

> I wanted to use ipset (ipset v6.11, protocol version: 6) to load it's
> sets from a cluster wide distributed file, e.g. at boot, or every time
> that file changes.

That's two different operations: first the sets do not exist and in the 
second case those exist (and in use).
 
> Now unfortunately it seems that ipset restore doesn't work as e.g.
> iptables restore does and seems to me therefore pretty much useless.
> 
> ipset restore < file
> gives me errors about the sets already existing, but even with -exist it
> doesn't help a lot, because entries removed from the file, are not
> removed from the actual ipsets.
> 
> So it seems as if ipset restore is not what the manpage describes
> (restore a session) but rather an additive merge of another session to
> the current one.
>
> Of course I understand that it could not delete sets which are in use,
> but at least it could empty them.

Restore mode is flexible. If you want the sets to be emptied first, then 
start with the flush command (in the file).
 
> Now when I use the following instead:
> ipset flush
> ipset destroy
> ipset restore < file

Why do you destroy the sets? If the sets are in use then you cannot delete 
them at all.
 
> To first flush all entries possibly no longer in the current version of
> file and to destroy all sets that got removed and that are no longer
> used... and only then reload the rules.... I have of course some time
> where even the sets that are in use are empty... and my connections will
> fail.

If you are not concerned that for a very small time the sets are empty, 
then simply start with the flush command in the restore file and that's 
all (I don't see why you'd want to destroy those).

If you want to avoid the time while the sets are empty, then use the 
sequence of

- restore into a temporary set
- swap the set with the temporary one
- destroy the temporary set

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
