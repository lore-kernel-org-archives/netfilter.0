From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Single-NIC Traffic Shaping
Date: Sun, 02 Nov 2008 20:15:31 -0600
Message-ID: <490E5EC3.2090602@riverviewtech.net>
References: <490DDA76.5030600@amfes.com> <490DF590.3010507@amfes.com> <490E14F8.6020402@riverviewtech.net> <490E5542.6000606@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490E5542.6000606@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 7:34 PM, Daniel L. Miller wrote:
> "Good reason"?!  It's the best reason of all!  $$$$!

*Grin!!!*  (Is my halo still glowing???)

> This particular application is for my super-advanced home network - I 
> have a Linux box doing relatively nothing, but I have added Squid to 
> it.  This, along with the rest of my home gaming machines 
> (cough-I-mean-workstations-cough) are hanging off a simple 5-port switch 
> w/ router, then the DSL modem.  I wanted to take advantage of some 
> bandwidth control tools on that box to shape the whole network - so I've 
> added DHCP to the Linux box, turned it off on the router, and the Linux 
> box is now the default gateway for the network.  Given the 100BaseT 
> connection, I'm not overly worried about saturating it to keep up with 
> my 5M DSL - but the goal was to optimize speed by controlling upload 
> bandwidth - not choke the connection (which has been the result of my 
> current efforts).

I think you were closer to right with the "... gaming machines ...".  I 
mean, come on, let's get real.  You are *REQUIRED* to /stress test/ your 
internet connection aren't you?  I know that /I/ am.  :)

> I may give up on the single NIC idea - especially since this box has two 
> NIC's built-in - but then I've got the outrageous expense of another 
> patch cord - not to mention I'd be out of ports on the router!

What's your postal address?  I'll ship you a patch cord.  How long do 
you want it, 1 month, 1 year, ??? :P

How will you run out of ports on your router?  Or is your router a 
router / switch combo that is everything in one?  If this is the case, 
the above reasoning about having multiple subnets on one physical LAN 
segment still applies.  Though it now sounds like you have your router 
as one address (usually either .1 or .254) and then your Linux box as 
another address in the same network, say .2 or .253.  In this case, what 
I was saying before about the multiple subnets does not really apply as 
it is already one subnet.

Please clarify what your configuration currently is.

> But I thought it would be neat to have a single box that can physically 
> "hang" off the "side" of the network and perform this job, instead of 
> "physically" flowing through it.

Oh, I think it can be done.  It's just that your tc rules are going to 
be interesting at best to a mother frigging beotch to write correctly. 
But *NOT* impossible.  ;)



Grant. . . .
