From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Single-NIC Traffic Shaping
Date: Sun, 02 Nov 2008 17:34:58 -0800
Message-ID: <490E5542.6000606@amfes.com>
References: <490DDA76.5030600@amfes.com> <490DF590.3010507@amfes.com> <490E14F8.6020402@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490E14F8.6020402@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Grant Taylor wrote:
> On 11/2/2008 12:46 PM, Daniel L. Miller wrote:
>> Since tc acts on an interface basis - can I perhaps setup a bridge 
>> with a single interface in it?  So address the physical interface 
>> eth0 for my LAN, set the bridge for the Internet modem, and then use 
>> tc on the bridge but not on the ethernet interface?
>
> Unless you have a good reason, I would strongly suggest that you add a 
> second NIC to the box and put your internet connection on that second 
> NIC.
>
> Technically I /believe/ you can do it with a single NIC, but it is 
> extremely complex to do in such as you have to take in to account both 
> internal (LAN), external (Internet), inbound, and outbound traffic all 
> on the same interface and in the same tree structure.  Where as if you 
> have separate NICs you can separate your interfaces and tree 
> structures such that internet reply traffic is processed as traffic 
> going out the internal interface and internet request traffic is 
> processed as traffic going out the external interface.  Usually people 
> do not want to rate limit / QoS their internal LAN traffic, requests 
> or replies.
>
> Further, if someone is on the same network segment as your internet 
> connection, (with Static IP or DHCP) it may be possible for them to do 
> some nefarious things (think MAC addresses) to be able to connect 
> directly in to your systems across the internet bypassing your router 
> all together.
"Good reason"?!  It's the best reason of all!  $$$$!

This particular application is for my super-advanced home network - I 
have a Linux box doing relatively nothing, but I have added Squid to 
it.  This, along with the rest of my home gaming machines 
(cough-I-mean-workstations-cough) are hanging off a simple 5-port switch 
w/ router, then the DSL modem.  I wanted to take advantage of some 
bandwidth control tools on that box to shape the whole network - so I've 
added DHCP to the Linux box, turned it off on the router, and the Linux 
box is now the default gateway for the network.  Given the 100BaseT 
connection, I'm not overly worried about saturating it to keep up with 
my 5M DSL - but the goal was to optimize speed by controlling upload 
bandwidth - not choke the connection (which has been the result of my 
current efforts).

 I may give up on the single NIC idea - especially since this box has 
two NIC's built-in - but then I've got the outrageous expense of another 
patch cord - not to mention I'd be out of ports on the router!

But I thought it would be neat to have a single box that can physically 
"hang" off the "side" of the network and perform this job, instead of 
"physically" flowing through it.
-- 
Daniel
