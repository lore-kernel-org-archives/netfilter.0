From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sun, 3 Oct 2010 20:57:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010032048470.26617@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
 <4CA79133.3070608@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA79133.3070608@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2 Oct 2010, Mr Dash Four wrote:

> > No, I'm not aware of the source rpm for ipset. That's bad if there's one
> > out there without refreshed.   
> This is a major headache for me for 2 reasons:
[...]

Sorry, what I provide is a generic, distribution-independent package. I'm 
aware that this can create a maintenance problem in a 
distribution-dependent environment, but I cannot help at that.

> > > Would it be possible to include a new construct - IP,port,IP,port (without
> > > IP
> > > address restriction) - and how difficult is this to implement?
> > 
> > It's not difficult, but I see little value in such a type. The client source
> > port (except for a few protocols in some cases) is random, so how could it
> > be useful to mach for that? Or do you know a case where it can still be
> > useful?
> >   
> I can give you of at least 2 uses based on my experience:
> 
> 1. voip - normally I can restrict the range of source ports and ip address
> when a voip connection is initialed (usually ports 8000-8050 and I have to
> also define the right ip address to point to the outside network), but the
> only way I can do this at present is if I base this on UID in iptables (i.e.
> the id of the process this is run under) - I cannot use sets at all because I
> do not have the appropriate construct. If I had "IP,port,IP,port (and
> protocol!)" as a construct to work with I can just built the sets (as I use
> 4-5 different servers outside the network and they work on different ports
> too) and that would be it!
> 
> 2. VPN - for the same reason: to increase security I normally bind the source
> port to a particular range and then if I had a "IP,port,IP,port (and
> protocol!)" construct to work with I will not be using UID in iptables to
> match, but will use this construct directly without any further need to do
> anything!

The present 4.x branch is in "maintenance" mode for me. I'll think on 
adding such a type to 5.x.

> > The next branch includes exactly that, i.e. the possibility to specify
> > proto:port for the ipport, ipportip and ipportnet types. And IPv6 support
> > too.
> >   
> That's brilliant news! I take it you will be introducing protocol support for
> all the constructs, is that right? How long would it take before you release
> this?

I'm going to release ipset 5.0 around the netfilter developer workshop 
this month.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
