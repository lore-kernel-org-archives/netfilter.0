From: Andrew Beverley <andy@andybev.com>
Subject: Re: Hanging outgoing connections while incoming are OK
Date: Wed, 01 Feb 2012 18:58:29 +0000
Message-ID: <1328122709.1891.11.camel@andy-laptop>
References: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
	 <1328031477.2018.12.camel@andy-laptop>
	 <CACP6TAghHWG2zHfGkPuac2o-qZbuwQHXqddyhUGx3Lwvuch5SA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACP6TAghHWG2zHfGkPuac2o-qZbuwQHXqddyhUGx3Lwvuch5SA@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328123663;
	bh=NE0fsmBpvOEWGzTKMaJPVZCosymgJEoswHghUG9s/q8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=IbwW/44wgUAR9rlGfYBSaXp/dLltyWGzHjPatQ82BtKPpXUiV+CPyQRjWaobc2EUS
	 4q/ZPgUlupBiTCiiSnCuQcw5O5qGGrnFmaPWzb8PcD46F9FnELkPjuxt0o3YHbX/v2
	 DSV+IWF2AurvMtITzw+y00d/QonwoelSY5gYOe48=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Anzuoni <ganzuoni@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2012-02-01 at 16:40 +0100, Guido Anzuoni wrote:
> On Tue, Jan 31, 2012 at 6:37 PM, Andrew Beverley <andy@andybev.com> wrote:
> > On Sat, 2012-01-28 at 09:39 +0100, Guido Anzuoni wrote:
> > ...
> >> fw default gateway: 10.254.254.2
> >> fw eth0: 10.254.254.1, PUB_IP_OUTGOING, PUB_IP_OUTGOING
> > ...
> >> My doubt is about eth0 configuration where I bind multiple addresses,
> >> an internal one and all the public assigned by the ISP.
> >> Is it a correct setup ?
> >
> > Unless I'm misunderstanding something, this does seem like a strange set
> > up. Why not just have the one IP address on eth0? Do the Cisco routers
> > also have an external IP address? Are these 2 completely independent WAN
> > links? If so, how is traffic shared between them?
> >
> > Sorry for all the questions, but I'm not entirely understanding your set
> > up and what you are trying to achieve.

[please don't top-post]

> The intended setup was
> fw eth0: 10.254.254.1, PUB_IP_INCOMING, PUB_IP_OUTGOING
> 
> I have used 1 public ip for incoming connections and 1 ip to
> "masquerade" outgoing ones.
> I don't know if it is necessary to bind public ip to some NIC in order
> to let netfilter NAT work properly.

I'm still confused as to what you are trying to achieve with this set
up, and why you have several IP addresses eth0. I would suggest that
this is the cause of your problems.

> It seems like some packets start going round and round before arriving
> to destination.

Which would explain why you are seeing this.

Why not just have one public IP address on eth0 only? And then use that
for incoming and outgoing connections, at least until you've got it
working?

Something like:


[Internal
 interfaces]   __________
--------------|          |eth0
              |  Linux   |(PUB_IP_INCOMING only)
--------------|   Box    |------------------------->ISP Cisco router
              |          |      ^
--------------|__________|      |
                                |
                               SNAT here to PUB_IP_INCOMING

Andy


