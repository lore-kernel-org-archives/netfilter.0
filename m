From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Wed, 16 Nov 2011 16:56:08 -0600
Message-ID: <op.v419zu1bx1lyi3@debiandesk2.net>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
 <1321480803.2382.62.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321480803.2382.62.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

On Wed, 16 Nov 2011 16:00:03 -0600, Andrew Beverley <andy@andybev.com> wrote:

>
>> Suppose one is building a netfilter router, LAN to Internet, with
>>  multiple outward-facing interfaces (eth1, eth2, and eth3). There needs
>>  to be load-balancing over the outward interfaces.
>
> Have you got this part working okay?

Thanks very much for your comments (below). Yes, load-balancing is working.  Also, preliminary traffic-shaping of interactive traffic is working as well as the per-user bandwidth limiting, via u32 hashing filters.  My earlier post has a lot of the bash code, which I posted earlier mainly because I thought it might be of use to someone doing something similar.

>
>>  There needs to be
>>  bandwidth-limiting for users on the LAN.  Users are typical Internet
>>  users (primarily http download with some important interactive traffic
>>  such as VOIP.)
>>
>> Theoretically, can per-user bandwidth-limiting be done on egress of the
>>  LAN using htb+prio+sfq without encountering insurmountable latency
>>  problems due to queuing of incoming packets in the router?
>
> If you are limiting per-user, then depending on the number of users, you
> may run into problems. There was a similar discussion here a while ago:
>
> http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/41664
>
> The upshot of that thread was to switch to u32 hashing filters if you
> can.

I saw that thread a while back...  it was the only place I found mention of use of u32 hashing filters for the IFB device.  After seeing that I was also able to use the IFB device to limit upload speed (LAN ingress).

Since I used the u32 hashing filters I think there should be no performance penalty due to iterating lots of rules, even if my friend get hundreds of users.  I even got the hashing filters working "multilevel" - that is, for lookup of the subnet portion of the IP address, but that is currently not in use since he only has a single subnet.

>>   Should traffic shaping (prioritizing of packets for interactive traffic)
>>  probably be an adequate solution to any latency problems?
>
> I do it reasonably successfully with a lot of users on a small link.
> http://andybev.com has some of the details.

Wow, what you have done looks cool.  I will study your configuration, thanks!
>
>> Is there a way to use a policing queuing discipline in a case like
>>  this?
>
> My personal opinion is that you shouldn't limit per user. You should
> instead prioritise traffic properly. This way you'll have a lot less
> classes and a lot less overhead. The traffic of heavy users over-using
> the link will get less priority than low-bandwidth applications, so you
> will achieve the same effect.
>
I agree in principle, but my friend needs the per-user bandwidth limiting.  Actually, there are only about 5 bandwidth classes into which all users fall (by LAN IP), and with the hashing filters it looks pretty "lean and mean" to my inexperienced eye.  The bash code that creates the tc commands is in my previous post.

>>  (I assume it would have to be on egress of the LAN interface,
>>  since I cannot see how to police on ingress of the Internet-facing
>>  interfaces due to the per-user bandwidth-limiting.)
>
> Correct, you need to stick with egress shaping, so your inbound links
> from the internet will need to be shaped on the internal LAN interface.

Can I assume from your comments that you think queuing in the router should not cause big latency problems as long as interactive traffic is given highest priority?  If so, I will go ahead and install this firewall and start testing it under some simulated loads.

Again, thanks for the advice!
