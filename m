From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Mon, 03 Nov 2008 14:26:54 -0600
Message-ID: <490F5E8E.1050505@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490F537B.7070506@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

(Note:  I'll read and reply to your previous message later this evening 
when I have more time.)

On 11/03/08 13:39, Daniel L. Miller wrote:
> Now that we're discussing that - let's change gears and talk about it 
> differently.

Ok...

>> A==>C<==>D<===B

*nod*

> No Internet - but still private networks.  So Router C has a route for 
> the network 'A' 192.168.0.0/24 and route to reach router 'D'.  Router 
> 'D' knows about network 'B' 192.168.1.0 and router 'C'.  D and C talk to 
> each other, just because, on their own network of 172.16.0.0/16.

Correct.

+---+         +---+         +---+         +---+
| A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
+---+         +---+         +---+         +---+

Thus we have three networks, x, y, and z.
x 192.168.0/24
y 172.16.0/16
z 192.168.1/24

A will have one IP address of x.A.
C will have two IP addresses of x.C and y.C.
D will have two IP addresses of y.D and z.D.
B will have one IP address of z.B.

A will have the following routes:
    x is directly attached
    y is reachable by way of x.C
    z is reachable by way of x.C

C will have the following routes:
    x is directly attached
    y is directly attached
    z is reachable by way of y.D

D will have the following routes:
    x is reachable by way of y.C
    y is directly attached
    z is directly attached

B will have the following routes:
    x is reachable by way of z.D
    y is reachable by way of z.D
    z id directly attached

In this scenario, none of the systems really have to have a default 
gateway at all.  However all of the systems will have to have one or two 
routes set up.  You /could/ use default gateways if you wanted to.  A 
and B would probably use C and D (respectively) as their defaults. 
However it is really up to you to decide what you want to be the 
defaults for C and D.

> Is any NAT required for this conversation?  In particular - do Linux 
> routers require SNAT lines for this?  Or just routing tables?

No.  NAT is not required.

Remember that NAT is a way to change addresses so that connections 
appear to be to and / or from a different address than they actually 
are.  You could do the above configuration with NAT, but it will 
actually make things more difficult.

If you were to use NAT, you would have to decide a few things.  What 
address do you want A and B to talk to.  Is A going to talk to z.B on a 
remote network or is it going to talk to x.C on its local network 
(similarly is B going to talk to x.A or z.D).  This determines if you 
will have to have any routing set up at all.

If you do not have routing set up, and choose to use NAT you will have 
to do a fair amount of NATing on all systems.  I.e. C will have to 
forward any traffic that comes in to x.C on to y.D.  Likewise D will 
have to forward any traffic that come sin to y.D on to z.B.  Similarly 
in reverse, D will have to forward any traffic that comes in to x.D on 
to y.C.  As you would expect C will have to forward any thing that come 
sin to y.C to x.A.

+---+         +---+         +---+         +---+
| A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
+---+         +---+         +---+         +---+
               |------------->                     x.C -> y.D
                             |------------->       y.D -> z.B
                   <-------------|                 z.D -> y.C
     <-------------|                               y.C -> x.A

As you can see this is fairly complex and could easily and quickly get 
WAY out of hand.  Where as with traditional routing things are much simpler.

+---+         +---+         +---+         +---+
| A +---(x)---+ C +---(y)---+ D +---(z)---+ B |
+---+         +---+         +---+         +---+
     <--------->   <--------->   <--------->

As an added benefit of routing, any system can talk to any other system 
on any network (presuming nothing is put in place to stop it).  Where as 
with NATing, the only thing that A will be able to talk to remotely is B 
it self.  If you want A or B to talk to other systems on the respective 
remote networks, you will have to set up even more NATing.

So, no, you do not /have/ to have NAT.  But you /can/ use NAT if you 
have some specific reason for wanting to do it.  (Refer to my Customer 
Interface Router description in a previous email.)



Grant. . . .
