From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Wed, 05 Nov 2008 12:30:57 -0600
Message-ID: <4911E661.2030505@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com> <018001c93f06$6d8869e0$48993da0$@info> <4911C21F.5000907@riverviewtech.net> <9C4B6E684A354E9B8C325F30A70EC501@dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9C4B6E684A354E9B8C325F30A70EC501@dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/05/08 12:22, Rob Sterenborg wrote:
> You mean you don't agree to the shining part?

Oh, no, the shine part is fine.  I was more thinking about where the 
routes were.

> Yes, well, in the basic example I was refering to (A <-> C <-> D <-> 
> B), routers C and D already know the routes to the networks they're 
> connected to (and I assume that hosts in A and B have a (default) 
> route to C and D resp) so they don't need extra routes. But they do 
> need forwarding set to ACCEPT and allowed. In a more complex 
> situation things are different.

Um, very close but not /quite/.

+---+         +---+         +---+         +---+
| A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
+---+         +---+         +---+         +---+

A knows about network x.
C knows about networks x and y.
D knows about networks y and z.
B knows about network z.

C does /not/ know about network z.
D does /not/ know about network x.

So either C and D have to use each other ad default gateways or they 
have to have routes to networks x and z.  (That's the "not quite" part.)

We have already covered the IP forwarding in another email.  As far as 
the firewalling is concerned, you are correct.  However I believe Daniel 
said that there was no firewalling (yet).

> No, I don't think so too. I already pointed him to Oskars iptables 
> tutorial which I think still mostly holds and I hope he'll read (and 
> understand) it. Writing your own script is still more flexible and 
> you learn more about what you're doing and dealing with.

Agreed.  I think both are likely good ways to learn about firewalling, 
specifically IPTables.  Seeing as how this discussion is about routing...



Grant. . . .
