From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Mon, 03 Nov 2008 11:29:07 -0800
Message-ID: <490F5103.8070409@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net>
Reply-To: dmiller@amfes.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490E633D.20103@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
>> 1.  Host 'A' realizes Host 'B' is not on its network
>
> This is what the net mask and subnets are all about in the IP stack 
> and has nothing to do with a router.  (Other than the fact the router 
> has its own IP stack and (sub)net mask(s) too.)
*dumbly nodding*  Ok.
>
>> 2.  Host 'A' contacts Router 'C' and asks it to get the information 
>> out and bring back the response.
>
> (As long as you are not talking about any form of proxying...)
>
> This is what routes are all about, with the /Default Gateway/ route 
> being special in such as it is the one used when no other routes match.
*dumbly nodding - slight eye glazing*  Um....ok.
>
>> 3.  Router 'C', via whatever magical method (DNS/hosts/etc.) figures 
>> out the router responsible for Host 'B's presence on the Internet.
>
> Eh.  Now you are sounding more and more like a proxy.  Routers only 
> pass IP packets based on routes.  Any DNS operation is the 
> responsibility of the application that generated the packet that is 
> now being routed by the router.
*significant eye glazing - jaw slack*  Um...er...maybe...
Rephrase - "Router C checks it's list of routes, figures out it's 
clueless with regard to the route for Router D, and passes the buck to 
Router C's default gateway"
>
>> 4.  Router 'C' contacts Router 'D', sends along the information, and 
>> tells Router 'D' to send any responses to ROUTER C, not Host A
>
> It's not so much that routers ""contact each other as it is that each 
> router hands off the IP packet to the next router for it to route to 
> the next and the next ... and you get the idea.  There is not really a 
> request that something be done.
*Excitedly* - That's it!  That's the part we need to talk about!  Router 
"hands off the IP packet to the next router to the next to the next" -

Router C has a route table -
192.168.0.0/24 dev eth0
2.3.4.5 dev eth1
default gateway 2.3.4.4

Router 2.3.4.4 (premise equipment from mysterious ISP)
mysterious routing table

Router 5.4.3.1 (premise equipment from other ISP)
more mysterious routing table

Router D has a route table -
10.0.0.0/8 dev eth0
5.4.3.2 dev eth1
default gateway 5.4.3.1

Does the above communication involve NAT?  No "hosts" or private 
networks involved - all public IP's between them (unless of course the 
packets traverse private IP ranges within the ISPs' networks before 
coming back out.
>
>> 5.  D, goes to B, comes back to D, and back to C
>
> You could be talking about IP packets flowing through networks or 
> proxy requests flowing from clients to the proxy and ultimately to the 
> destination server and back in reverse.
*Sheepishly* Assume for sake of argument I'm expressing myself poorly - 
no proxies involved in this discussion.  That would make it too simple.
>
>> 6.  Router C, on receiving a response from D, remembers that Host 'A' 
>> was waiting for this information and sends it on.
>
> This is is probably what you are thinking NAT does, which in some / 
> most ways is correct.  However, the same can be said about a proxy.
*Assertively* No proxy.
>
>> In essence, I believe I'm correct in this summary - however the tool 
>> used by Router C for "remembering" that Host A asked for the 
>> information, and that responses from Router D should come back to 
>> Router C, is NAT?
>
> Eh, not really.
>
> I'm going to go out on a limb here and think that you are thinking of 
> a network like this:
>
> +---+
> | B |
> +-+-+
>   :
>
>   :
> +-+-+       +---+
> | C +---+---+ A |
> +---+   |   +---+
>         |
>         |   +---+
>         +---+ D |
>             +---+
>
> I believe this is the sequence of events you are trying to make happen:
>
>  - Client A is trying to contact the server B by way of router C.
>  - Router C intercepts the request and hands it off to system D.
>  - System D then initiates the request to B by way of router C (and 
> many other intermediary routers).
>    (C does not intercept the request because it is from system D.)
>  - Server B replies back to D by way of (many other intermediary 
> routers and) router C.
>  - System D then replies back to router C.
>  - Router C then replies back to client A.
>
> Is this close to what you are wanting to happen?  (Let me know before 
> I explain how to make this happen.)
>
Um...no.  Too complicated.

A==>C<==Internet==>D<===B

Two offices on opposite sides of the world linked via Internet.
>> So does this mean that ANY connection of a private address space to 
>> the Internet MUST be performed via NAT?
>
> Yes.  In the scenario above (presuming that my picture above matches 
> what you have) Router C does NAT to convert the internal IP addresses 
> used on the internal LAN to that of the internet side of Router C so 
> that the packets will cross the internet.  Refer to the "Simple 
> Scenario" in my previous reply about NATing.
>
So the world's most expensive super-duper whatchamacallit (fill in the 
blank here with router, firewall, bridge, modem, magic cauldron), placed 
between giant corporate's network (using private address space) and the 
Internet - will perform NAT?  Somewhere somehow NAT (in particular, 
source NAT for outbound access from the private and destination NAT to 
provide services to Internet) must be performed?
-- 
Daniel
