From: Ronald <ronald645@gmail.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Thu, 27 Oct 2011 06:16:13 +0200
Message-ID: <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	<1319669075.26402.6892.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=tGlfZCnMj+NwA24VvGykFgUKQaE7uXLst/lhIRLhEiw=;
        b=mhOB8o3iWMtUpZ2ZBR56A9Jx4RoINYsCBJSTZxRrB60TqcCwTt0axZ70XbMjRBu6eN
         /g36WF4W+OGvw9dxhkO1PTT+VNnBJ7NOULk4xz3mFywnwvT5o9z9dX93Q7Xop7CS3l8L
         t1ut8zbLjP6Ty3vvIvQ4JgAbywEazohUJlJO8=
In-Reply-To: <1319669075.26402.6892.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andy@andybev.com
Cc: netfilter@vger.kernel.org

> Is there any way you can you try it without IPSEC?

Good idea, I'll try without IPSEC and see what happens. I suppose I
can just use nc for this.

> Okay, so if it's running in a VPN, do you really need to "secure" it by
> changing the port number? Am I missing something?

It's not running in the VPN, it's running the VPN. UDP port 500 is
used to exchange configuration data/keys (IKE), it's the port I have
to open to the internet in order to allow the VPN to work for hosts
outside my network. So, before the VPN is started, I need to
communicate with udp port 500 for it to work.

And yes, I just want to change this because it's using the default
port number. I know the arguments against this, as this won't make
your server more robust. However, I do think this is safer because you
are making it harder to exploit a potential vulnerability.

> I assume that you have the relevant rules for the returning packets?

What you see above is the entire iptables configuration that is
relevant for port redirection. I made these based on examples from the
internet. In order to redirect a port, you have to apply 1 rule to the
client and 1 rule to the server.

This configuration seems to work properly whenever I connect from a
remote location other than the troubled university wireless. And when
I delete both rules, it also works from the troubled wireless
connection (without redirection of course).

> Do you really need to obfuscate? It just complicates your post.

Thought it would be safer, without making it harder to understand...
Sorry for that.

> There's been some posts about tcpdump on here before. I can't remember
> exactly where it fits into the networking system, but I would have
> thought that it would be at the end, in which case if the packets are
> leaving the server interface but not arriving at the client interface,

That is the reason I used tcpdump to check whether the packets were
actually send/received. And then using the iptables counters I checked
if they were also NAT-ed.

> then your answer is a problem with the bearer in between.

Thinking of it, I suppose that is a valid conclusion. Totally agree,
bothers me why this is happening though.

I'll have a try to use port redirection using nc and report back my
findings. Thank you for reading my complicated post, it will be more
to the point next time.

                             Ronald
