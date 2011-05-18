From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Wed, 18 May 2011 13:22:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105181317570.4117@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD255EF.1040209@googlemail.com> <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu>
 <4DD292FC.2020609@googlemail.com> <4DD2C018.9060800@googlemail.com> <alpine.DEB.2.00.1105180948160.4117@blackhole.kfki.hu> <4DD3A674.2050502@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD3A674.2050502@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, 18 May 2011, Mr Dash Four wrote:

> > The latter itself exhausts the maximal number of elements in the set, so the
> > error message is normal.
> >   
> Is this a constraint coming from the "maxelem" value or the hash size? Could
> this be corrected by increasing either of these?

Yes, of course: use larger maxelem. The initial hash size value can also 
be increased, that way you can spare some internal resizings.
 
> > > The way I look at it, the "old" iptree(map) type sets should be converted
> > > to
> > > hash:net, not hash:ip to avoid this error.
> > >     
> > 
> > That's too late, I can't change the mapping from hash:ip to hash:net.
> > (And if the mapping pointed to hash:net, you were surprised then that after
> > adding say 192.68.0.0/24 to the set, you couldn't delete 192.68.0.1 from it.
> > :-)
> >   
> Nope. I am aware that deleting elements in 6.x should be done on the whole
> range when added, not just a single ip address (I am now clear as to why that
> happens and I think it makes sense in the way it is designed).
> 
> If you are to provide "backward" compatibility (or compatibility of any sort)
> with iptree(map) sets then you should make sure that at least members of that
> type of set could, at least, register without problem within the new set to
> which iptree(map) is converted. It seems to me that is not the case - with 6.5
> at least. If it is difficult to maintain such compatibility you could do what
> you have already done with the "bindings" in previous versions of ipset - just
> drop it and ask users to switch to the new type. Frankly, it is not that
> difficult to switch over to the new type if one is aware of the implications,
> so it wouldn't be a big shock.

I'll drop iptree(map) support in the next release ;-).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
