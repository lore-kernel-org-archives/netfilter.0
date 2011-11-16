From: Andrew Beverley <andy@andybev.com>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Wed, 16 Nov 2011 22:00:03 +0000
Message-ID: <1321480803.2382.62.camel@andybev-desktop>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321480804;
	bh=E0zY4OLnx+0x2DppLN7NvfXxp6RpjzyhmuqwtLNYQ0E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=DBXCMTVUtMgqIs54nHac3N1MZad+hBESKE8niAGFzrZVGKdZSi1YOZKD8V7fAFOA1
	 dFTt3AbQyOUo3aSlIZf/OUBqvj5r+xLg1mW1BkB/QTL7z9icziT3Ux5o16M0W5YV/L
	 K+1yTzSl7U6krMuR4r0S8t14h2CVv8V+7Zr3I3pg=
In-Reply-To: <op.v41qaj2hx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Wed, 2011-11-16 at 09:50 -0600, Lloyd Standish wrote:
> I have improved my previous post in hope of some advice, or at least a
>  suggestion on where to ask this sort of question.

Yep, I am planning on reading your other post when I get round to it,
but it was quite long...

> Suppose one is building a netfilter router, LAN to Internet, with
>  multiple outward-facing interfaces (eth1, eth2, and eth3). There needs
>  to be load-balancing over the outward interfaces.

Have you got this part working okay?

>  There needs to be
>  bandwidth-limiting for users on the LAN.  Users are typical Internet
>  users (primarily http download with some important interactive traffic
>  such as VOIP.)
> 
> Theoretically, can per-user bandwidth-limiting be done on egress of the
>  LAN using htb+prio+sfq without encountering insurmountable latency
>  problems due to queuing of incoming packets in the router?

If you are limiting per-user, then depending on the number of users, you
may run into problems. There was a similar discussion here a while ago:

http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/41664

The upshot of that thread was to switch to u32 hashing filters if you
can.

>   Should
>  traffic shaping (prioritizing of packets for interactive traffic)
>  probably be an adequate solution to any latency problems?

I do it reasonably successfully with a lot of users on a small link.
http://andybev.com has some of the details.

> Is there a way to use a policing queuing discipline in a case like
>  this?

My personal opinion is that you shouldn't limit per user. You should
instead prioritise traffic properly. This way you'll have a lot less
classes and a lot less overhead. The traffic of heavy users over-using
the link will get less priority than low-bandwidth applications, so you
will achieve the same effect.

>  (I assume it would have to be on egress of the LAN interface,
>  since I cannot see how to police on ingress of the Internet-facing
>  interfaces due to the per-user bandwidth-limiting.)

Correct, you need to stick with egress shaping, so your inbound links
from the internet will need to be shaped on the internal LAN interface.

Andy


