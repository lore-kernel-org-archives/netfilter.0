From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Replacing firewall issues
Date: Tue, 10 Jan 2012 09:55:49 +0100
Message-ID: <1326185749.2680.24.camel@ns014530.dcyb.net>
References: <1326180504.2680.14.camel@ns014530.dcyb.net>
	 <4F0BF605.4020404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F0BF605.4020404@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2012-01-10 at 00:25 -0800, Payam Chychi wrote:
> On 12-01-09 11:28 PM, Rob Sterenborg (lists) wrote:
> > Hi,
> >
> > I'm having trouble replacing an old server (CentOS 5) for a new one
> > (CentOS 6). The layout is basically like this:
> >
> > +------+   +-----+   +----------+   DMZ   |---
> > | INET |---| RTR |---| Firewall |---------|
> > +------+   +-----+   +----------+         |---
> >                                            .
> >                                            .(etc)
> >                                            |---
> >
> >
> > When I'm testing the firewall with an unused public and private IP
> > address and a server in the DMZ, I can successfully NAT packets
> > from/to it. So, IMO there should be no issues.
> >
> > However, when we shutdown the switch ports from the old firewall, put
> > the current public and private IP addresses from the old firewall on the
> > new one and have arp caches of neighbors cleared, then forwarding breaks
> > in some way.
> >
> > What I'm seeing is that:
> > - When a new connection is setup to a webserver in the DMZ, packets
> > arrive at the internet NIC, but don't get forwarded to the webserver in
> > the DMZ.
> > - When I'm trying to, say, ping a host on the internet, I see the
> > packets arrive at the DMZ NIC, forwarded to the internet host, the reply
> > packets arrives at the internet NIC, and doesn't get forwarded back to
> > the DMZ host.
> > - I get ping replies when I ping from the new firewall to the server(s)
> > in the DMZ. (That is: I get replies, and I'm supposing it from the
> > servers I ping..)
> >
> > Then we've put this setup in separate VLAN's so we could mimic the
> > situation in a test environment. Everything we tested worked just fine
> > in there right away, so it's impossible to troubleshoot.
> >
> > This makes me believe there's something about the setup in production
> > that creates this behavior. I unfortunately forgot to clone the MAC
> > addresses from the current server to the new one: could it still be
> > something with the MAC addressess, although AFAIK we cleared all arp
> > caches that should be?
> >
> > Any input of what can be wrong is welcome.
> > Thanks in advance!
> >
> >
> > --
> > Rob
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Hey,
> 
> you mentioned clearing arp after the changes however did you verify 
> that no stale arp entries remain? also, what did your mac address table 
> / cam table show?

Unfortunately: no, and I don't know. I didn't check because I (thought I
was) able to reach the servers just fine. Lesson learned for next time..
It's also not that easy if you have to do it at night and don't control
the other devices (routers, win servers). :-/

> it sounds much like layer 2 mac/arp buildup issue

I don't see much other options myself either.
I just learned that there seems to be one router doing proxy arp.. The
idea is to turn proxy arp off next time we try to replace this box. It
will probably not resolve the actual problem, but then it also can't
answer for anything that isn't there.


--
Rob


