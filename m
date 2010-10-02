From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 2 Oct 2010 21:21:25 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA70B3B.90001@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2 Oct 2010, Mr Dash Four wrote:

> > Thanks for the complete description - I have just released ipset 4.4 which
> > fixes this nasty bug.
> >   
> No worries - I was surprised to find it as ipporthash in particular should
> have been widely used in practice. 

I'm baffled too for not discovering the bug much much earlier, by myself 
or by somebody else.

> As for ipportiphash and ipportnethash - there were recently included in 
> the distribution due to another bug I found when compiling xtables (even 
> though ipportiphash and ipportnethash were compiled the .ko files were 
> never included in the final release making it impossible to use these 
> two construct types).
> 
> A couple of questions and ideas for future releases:
> 
> 1. Normally I used to get ipset as part of the xtables source. Is that still
> the case or do I have to download the ipset source and compile it separately
> to get the latest changes you made?

It's absolutely up to you: currently ipset can be installed alone, or as a 
part of xtables-addons. Jan updates xtables-addons quite reqularly.

> 2. Related to that question - I used to get the xtables .src.rpm from which to
> compile the code and make an installation rpm. I don't seem to be able to do
> that any longer as all fedora repos are too slow to update the latest changes.
> Do you have a link from which I could get the latest changes in ipset/xtables
> in src.rpm which allows me to build an installation rpm. The reason I am
> asking this is because I am building an update images on all my machines
> (using kickstart) and need the installation rpms with the latest changes you
> made. Compiling this from source won't be possible as there is now way I could
> install this as part of the image-building process.

No, I'm not aware of the source rpm for ipset. That's bad if there's one
out there without refreshed. 
 
> I think you mentioned that in future releases the restrictions on all *hash
> constructs (with regards to using /16 - B class - IP addresses) will be
> removed. Could you confirm that is still the case?

Yes, definitely.

> Would it be possible to include a new construct - IP,port,IP,port (without IP
> address restriction) - and how difficult is this to implement?

It's not difficult, but I see little value in such a type. The client 
source port (except for a few protocols in some cases) is random, so how 
could it be useful to mach for that? Or do you know a case where it can 
still be useful?

> Similar question - would it be possible to include protocol (either by name or
> its number) as part of all available constructs for matching? The reason for
> this is that, as it stands, in order for me to match, say, "IP,port" hosts
> form my personal VPN I need to use two separate sets - one for UDP and one for
> TCP and I also to create two separate statements for iptables (one for tcp and
> one for udp), which is a bit of a waste and not very easy to administer. It
> would be nice if I could use "IP,protocol", "port,protocol",
> "IP,port,protocol", "IP,port,IP,protocol", "IP,port,IP/cidr,protocol" and so
> forth.

The next branch includes exactly that, i.e. the possibility to specify 
proto:port for the ipport, ipportip and ipportnet types. And IPv6 support 
too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
