From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset v6.latest bugs?
Date: Wed, 27 Apr 2011 23:27:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104272323570.7833@blackhole.kfki.hu>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com> <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu>
 <4DB6DEFD.6020101@googlemail.com> <4DB752D9.9010807@googlemail.com> <alpine.DEB.2.00.1104270905450.5222@blackhole.kfki.hu> <4DB80579.7090208@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB80579.7090208@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 27 Apr 2011, Mr Dash Four wrote:

> > > 2. Take a note when I try to add 4608 elements to the test set - I did
> > > that 3
> > > times with completely different results - it seems that ipset triggers an
> > > error when it feels like it.
> > 
> > The hashes are created with a random hash key calculation parameter: if the
> > hash is lucky enough, you can stuff the data into it without reaching the
> > clashing limit and without the need to resize the hash.
> >   
> I see, so the error is triggered at random because the randomly generated hash
> sometimes is able to "stuff the data", as you put it, without reaching the
> limit, but sometimes it doesn't and this, then, triggers the error, is that
> correct?

Yes, exactly.
 
> > > 3. Following on from the previous point, when I try to add more elements
> > > than
> > > the established "error threshold" in point 2 above, I also get mixed
> > > results
> > > (attempting to add 4864 elements gives me 2 successes and 2 failures after
> > > 4
> > > attempts made when I re-created the test set from scratch).
> > >     
> > 
> > The same as above: if the clash limit is not reached, the hash happily can
> > accept more data. If it's reached, resizing is triggered which is
> > successfully done, but adding elements starts again with the already added
> > element. That needs to be fixed.
> >   
> I think I understand it now, thanks for the explanation. I hope that you would
> be able to fix this bug.

I'm attending an annual conference this week, so it seems I won't have 
time to work on the bugfix before the weekend, sorry.
 
> On a separate note, two days ago I was finally able to split ipset from
> xtables-addons and build it as a separate package (i.e. construct a .spec
> file, then build and install rpm based on that) while building only the
> userspace part (assuming the kernel part will stay with the kernel). This is
> by no means finished (there are some things still left to be ironed out -
> kernel modules dependency check, changelog history to be added etc), but I
> thought you may be interested in this.
> 
> If so, let me know and I'll send it to you (the important part is the .spec
> file and a separate patch which removes the build routines for the kernel
> modules).

I don't really see why you have to split ipset from xtables-addons. What's 
wrong with the standalone ipset package, what forces you to do so?
 
> I am in a process of doing the same with version 4.5 of ipset (I was able to
> successfully build the .35-88 version of the kernel with ipset 4.5 kernel
> modules happily integrated into it yesterday), even though ipset 4.5 does not
> have pkgconfig files I intend to create these - hopefully today.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
