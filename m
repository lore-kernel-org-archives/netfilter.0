From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset-6.0 released
Date: Thu, 3 Feb 2011 19:19:46 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102031914120.32002@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1102031353130.31387@blackhole.kfki.hu> <4D4AE0B6.6040108@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4AE0B6.6040108@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, 3 Feb 2011, Mr Dash Four wrote:

> 
> > I'm happy to announce ipset 6.0, a new milestone of the tool. Here follows
> > the list of the changes since the previous release:
> >   
> I do have a couple of queries - I take it this version includes all the
> patches you posted in this mailing list (which were duly ACKed) in the
> previous couple of weeks, right?

Yes.

> If so does that mean all kernel-related modules are now excluded from 
> this release or do I have to compile/build them as was the case with all 
> previous ipset versions?

You still have to compile the kernel modules from the source tree of ipset 
(unless you use the nf-next-2.6 or net-next-2.6 git trees of Patrick 
McHardy or David Miller).

When the kernel part will be available from the vanilla kernel tree, I'll 
announce it and update the documentation in ipset as well.

> The reason for asking this is simple - as it stands, I am building the kernel
> modules separately from the userspace tool (using two separate .spec files -
> in a similar fashion as it is done with the xtables-addons), but would like to
> incorporate your kernel modules as part of building the kernel and use just
> one spec file for building the userspace tool without the need to do anything
> else.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
