From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset save and restore
Date: Thu, 20 Dec 2012 20:12:42 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1212202001350.25774@blackhole.kfki.hu>
References: <1355928786.30355.22.camel@heisenberg.scientia.net>   <alpine.DEB.2.00.1212192146330.23162@blackhole.kfki.hu>   <1355955834.5199.27.camel@fermat.scientia.net>   <alpine.DEB.2.00.1212200011460.23577@blackhole.kfki.hu>  <1355963003.5199.52.camel@fermat.scientia.net>
  <alpine.DEB.2.00.1212201244070.24774@blackhole.kfki.hu> <1356019930.11041.13.camel@heisenberg.scientia.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1356019930.11041.13.camel@heisenberg.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@lmu.de>
Cc: netfilter@vger.kernel.org

On Thu, 20 Dec 2012, Christoph Anton Mitterer wrote:

> On Thu, 2012-12-20 at 13:00 +0100, Jozsef Kadlecsik wrote:
> > No, "ipset restore" is not identical with iptables-restore. For example 
> > with the latter you are not able to incrementally update existing 
> > rulesets.
> Well incrementally updating would also mean removing entries that are no
> longer existing.... otherwise it's only making a union.

By "update" I meant adding/deleting entries, creating/swapping/destroying 
sets.
 
> And as I said before... anyone who wants to do this can easily sed
> "s/^/ipset //" | sh
>  
> > Nothing prevents you to write a few liner in any scripting language, which 
> > either adds a "flush" command or wraps "create, add" into "create temp, 
> > add to temp, swap, destroy temp".
> Of course one can do this and actually I'm doing right now... but it's
> quite unhandy if anybody has to do this just to get a proper restore.
> 
> And when doing it "proper" it's not just a one liner... it has to work
> with different names for the actions like create, creat, crea, etc. and
> one always risks to break things (and even get security issues by that)
> when the syntax of ipset should change or be extended.
> With temp names there's the issue, that (I guess) there is a maximum
> name for set names, so one cannot just add all new sets as
> tmp_<originalname> as this might already fail
> 
> Last but not least, while this allows atomic swaps of single set... one
> cannot swap the whole ipset configuration in one atomic step. 

That's not possible in the current framework: individual sets can be 
changed atomically by swapping (not counting add/del elements), whole 
config doesn't.
 
> ipset's current restore should actually be called exec, or merge, or
> load...

Maybe, but I'm not going to change it, in order to keep backward 
compatibility.
 
> btw: I might have noticed a bug(?) in at least 6.11
> With the following output of store:
> # ipset list | grep ^Name
> 
> I'd have expected to get the same sets with
> list -names
> but it gives me one twice:
> # ipset list -name
> lrz_lcg_se_cn
> lrz_lcg_se_pn
> lrz_lcg_ce_cn
> lrz_lcg_ce_compn
> lrz_lcg_ce_compn
> lrz_lcg_se
> lrz_lcg_ce
> DROPPED
> 
> Is that expected?

It's seems not right, but it's hard to tell without the actual sets.
Send me the data in private so that I could reproduce it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
