From: Andrew Beverley <andy@andybev.com>
Subject: Re: using iptables to speed limit connections
Date: Wed, 26 Oct 2011 16:58:40 +0100
Message-ID: <1319644720.26402.6532.camel@andybev-desktop>
References: <4EA7EEF6.4000808@googlemail.com>
	 <Pine.LNX.4.61.1110260919400.24418@soloth.lewis.org>
	 <4EA80ECF.8030206@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319644779;
	bh=86t0zh//ZzfNoKzfKDaz32oizyiS9Ypd4YsRZoBHqOg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Gk/j5DRRQ+7M9DEYsrJQTblzRPYmzkv26vgg8e0nob0ebt1iZYAfkKX1KuKrtI6md
	 W+Jec3NHZXn8FzDoUOUlnhKDRrd/ySG0xFQLSnto9cKWq4gMtt9R6mIAVBTj0lD3ng
	 Abr6cakumel/fIV27l1ZgLLfW0FsCANDte7kfXmg=
In-Reply-To: <4EA80ECF.8030206@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: Jon Lewis <jlewis@lewis.org>, netfilter@vger.kernel.org

On Wed, 2011-10-26 at 14:44 +0100, J Webster wrote:
> On 26/10/2011 14:20, Jon Lewis wrote:
> > On Wed, 26 Oct 2011, J Webster wrote:
> >
> >> Is there any easy way to speed limit connections on a VPN to 2 Mbps?

Not really any easy way that I am aware of...

> >> My server is 100Mbps but I have connections on a VPN of 10.8.0.0. so 
> >> need to limit the outbound connection from 10.8.0.0 to 2 Mbps.
> >> I tried reading the stuff on leaf but the tutorial doesn't seem very 
> >> straightforward and there is not much information on this on the net.

Agreed.

> >
> > You probably should have a look at 
> > http://lartc.org/howto/lartc.qdisc.html

<Top posting fixed>

> The problem is not so much limiting the overall connection but limiting 
> the connection of each individual vpn user to 2Mbps.
> So, there is 100Mbps to share between 10 users, they should each get 2, 
> giving a use of 20Mbps.

In which case you'll need a classful qdisc. HTB is probably a good place
to start. You'll need a leaf class for each user, and you'll need to add
a filter for each one, probably by IP address from what you've already
said (or you can do using a netfilter mark using flowid)

> Also, I wasn't sure from those pages whether this should be applied to 
> each IP on the VPN network 10.8.0.0/24 or every IP with outgoing packets 
> but that would then limit the server to 2 Mbps.

If I'm reading correctly, I suggest you'll need one HTB qdisc on your
outbound interface, with a leaf class for each IP on the VPN network.

I've found these pages very helpful:

http://www.opalsoft.net/qos/DS.htm

See how you get on, and if you need more help then please shout.

Andy


