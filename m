From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Thu, 12 May 2011 23:27:07 +0100
Message-ID: <1305239227.1921.361.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <1304977533.1921.305.camel@andybev-desktop> <4DCA9D96.90002@wildgooses.com>
	 <1305158473.1921.358.camel@andybev-desktop>
	 <4DCC5C69.1020305@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305239227; bh=Ph+ltDcWsl8YQZLAf9FP2oyxbtLb+MX0mKn1s
	79n/lo=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=IjTlMNT0
	r4BxkWr1+fuaU2pXSRz7gAHHZc8Tx/3Sjsr+J+yq/D2ge7Tk3RWut+ucAX0Ou/xo1Zn
	VAAVgkTOn7iHNchVJMFrda/JWEtCEuZEswYkS87yRt10WzAcw7u2TXadGw2f0Tmw4tm
	rIOTJcNg9FwaMMSwxI3+Qr6nmQhEM=
In-Reply-To: <4DCC5C69.1020305@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Thu, 2011-05-12 at 23:17 +0100, Ed W wrote:
> On 12/05/2011 01:01, Andrew Beverley wrote:
> > On Wed, 2011-05-11 at 15:30 +0100, Ed W wrote:
> >> On 09/05/2011 22:45, Andrew Beverley wrote:
> >>> I wrote a similar patch for Squid (released in V3.2), which allows
> >>> packets to be marked before Squid, and Squid to reapply the mark on
> >>> retransmission. Marks can also be applied for locally cached files. If
> >>> it helps the patch is at:
> >>>
> >>> http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925
> >>
> >>
> >> Did you find any better way to read the packet mark than using
> >> conntrack?  I see that's how you are doing it in the patch you reference?
> >>
> > 
> > No, I think that's the only/best way of doing it (you can't read it from
> > a socket). That's the advice I got from the netfilter developers anyway,
> > and it doesn't get much better than that.
> 
> I guess a feature request that the nf_mark is copied down to the "socket
> mark" for arriving packets is going to be met with a "lets see your
> patch"?  Did you do any investigation to see where such code might be
> fitted - or even if it's a good idea?

I'm afraid I've got no idea. That patch is the only bit of network
programming I have done, and the principle behind getting the mark was
suggested by Jan on the developer's list.

Probably worth a quick question to that effect to the netfilter-dev list
though.

Andy


