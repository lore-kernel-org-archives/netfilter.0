From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 20:34:37 -0600
Message-ID: <490E633D.20103@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490E597B.50400@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 7:52 PM, Daniel L. Miller wrote:
> I'm going to read these two mails a few times - I sincerely appreciate 
> the thorough answer - hopefully it'll penetrate my skull soon enough.

*nod*  You are welcome.  It's my way of giving back to the community 
that has given me so much.  :)

If you have any more questions, please reply, either to the mailing list 
or directly to me off list, which ever you prefer, and I'll do my best 
to answer.

> I do understand that the private address ranges were not to be directly 
> exposed to the Internet.  I guess what I was looking for was for a 
> router to perform the following:

*nod*

> 1.  Host 'A' realizes Host 'B' is not on its network

This is what the net mask and subnets are all about in the IP stack and 
has nothing to do with a router.  (Other than the fact the router has 
its own IP stack and (sub)net mask(s) too.)

> 2.  Host 'A' contacts Router 'C' and asks it to get the information out 
> and bring back the response.

(As long as you are not talking about any form of proxying...)

This is what routes are all about, with the /Default Gateway/ route 
being special in such as it is the one used when no other routes match.

> 3.  Router 'C', via whatever magical method (DNS/hosts/etc.) figures out 
> the router responsible for Host 'B's presence on the Internet.

Eh.  Now you are sounding more and more like a proxy.  Routers only pass 
IP packets based on routes.  Any DNS operation is the responsibility of 
the application that generated the packet that is now being routed by 
the router.

> 4.  Router 'C' contacts Router 'D', sends along the information, and 
> tells Router 'D' to send any responses to ROUTER C, not Host A

It's not so much that routers ""contact each other as it is that each 
router hands off the IP packet to the next router for it to route to the 
next and the next ... and you get the idea.  There is not really a 
request that something be done.

> 5.  D, goes to B, comes back to D, and back to C

You could be talking about IP packets flowing through networks or proxy 
requests flowing from clients to the proxy and ultimately to the 
destination server and back in reverse.

> 6.  Router C, on receiving a response from D, remembers that Host 'A' 
> was waiting for this information and sends it on.

This is is probably what you are thinking NAT does, which in some / most 
ways is correct.  However, the same can be said about a proxy.

> In essence, I believe I'm correct in this summary - however the tool 
> used by Router C for "remembering" that Host A asked for the 
> information, and that responses from Router D should come back to Router 
> C, is NAT?

Eh, not really.

I'm going to go out on a limb here and think that you are thinking of a 
network like this:

+---+
| B |
+-+-+
   :

   :
+-+-+       +---+
| C +---+---+ A |
+---+   |   +---+
         |
         |   +---+
         +---+ D |
             +---+

I believe this is the sequence of events you are trying to make happen:

  - Client A is trying to contact the server B by way of router C.
  - Router C intercepts the request and hands it off to system D.
  - System D then initiates the request to B by way of router C (and 
many other intermediary routers).
    (C does not intercept the request because it is from system D.)
  - Server B replies back to D by way of (many other intermediary 
routers and) router C.
  - System D then replies back to router C.
  - Router C then replies back to client A.

Is this close to what you are wanting to happen?  (Let me know before I 
explain how to make this happen.)

> So does this mean that ANY connection of a private address space to the 
> Internet MUST be performed via NAT?

Yes.  In the scenario above (presuming that my picture above matches 
what you have) Router C does NAT to convert the internal IP addresses 
used on the internal LAN to that of the internet side of Router C so 
that the packets will cross the internet.  Refer to the "Simple 
Scenario" in my previous reply about NATing.



Grant. . . .

