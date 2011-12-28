From: Andrew Beverley <andy@andybev.com>
Subject: Re: can't set default route for virtual interface
Date: Wed, 28 Dec 2011 10:21:54 +0000
Message-ID: <1325067714.1672.691.camel@steve-pc>
References: <op.v654qjz3x1lyi3@debiandesk2.net>
	 <1325029381.1672.38.camel@steve-pc>  <op.v66puobex1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325067723;
	bh=l8cNo+VJB57aE0apbLe2qZ60mne6YLJMTdd02FH3A6s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=QiZ4gF8rzz/W8o/NWwyuk0UA1GD8J2OfM1Mmn2BJ4vjybl+zo2GxsgNCj4X394RFi
	 WVMr63tqBy/GvwmOVX5OdyXZ2/IX+EjV3acAImLi8+5likIMWkik3f16qnYQpC7Ey6
	 a7cS4cetINO9t7D06TV3STY2tua8TEgq6/eONrjg=
In-Reply-To: <op.v66puobex1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 2011-12-27 at 23:36 -0600, Lloyd Standish wrote:
> >Have you tried *not* using ifconfig to set up your interfaces? You
> > should only be using iproute2.
> 
> I've seen that mentioned before, and I'm confused.  iproute2 means, for
>  firewall code, "ip" and "tc" - is that right?

Yes, and "ip" can do everything that all the various net-tools commands
do.

>   I usually bring up interfaces with "ifup" when I can

Ah, therein lies an interesting situation. ifup is pretty old too, and
makes calls to the ifconfig command, which is a real pain. However,
unless someone tells me otherwise, I'm not aware of a replacement for
it. There was a project a while ago called netconf, but this seems to
have died:

http://wiki.debian.org/netconf

> , since that sets the interface address specified in /etc/network/interfaces, whereas "ifconfig <if> up" doesn't.

That's the best way to do it with Debian.

> I notice that after adding the Debian "vlan" package, ifup and ifdown
>  appear to bring virtual interfaces up and down OK.  But ifup/down are
>  not part of iproute2, right?

Yeah, correct. The most accepted way of doing it seems to be to use ifup
and ifdown to bring the physical interface up and down, and to do
everything else by adding "ip" commands into
your /etc/network/interfaces file using the
up/down/pre-up/pre-down/post-up/post-down options.

>   Do you know of any vlan problem with 
>  ifup/down?  Sometimes interfaces can't be taken down with "ifdown,"
>  and I have to use ifconfig.

I get similar problems when adding IPV6 addresses, although I use "ip"
to sort it out manually ;-)

Anybody know what happened to netconf?

Andy


