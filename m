From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Route packets by source IP
Date: Thu, 20 Mar 2008 09:42:38 -0500
Message-ID: <47E277DE.1040005@riverviewtech.net>
References: <47DFCF36.3060500@riverviewtech.net> <43cba8b55bae94158c0580f06e368ea4@localhost> <47E1836C.7050707@riverviewtech.net> <558A5399260B4A88B7FB73AD35D2244B@shs1> <47E1A98F.7070603@riverviewtech.net> <75E251D69A5244278E45E6F35899091C@shs1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <75E251D69A5244278E45E6F35899091C@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/19/08 19:30, Steffen Heil wrote:
> No.  There is no firewall or such in front.  I DO have 2 public 
> reachable Servers with 1 public IP each and a openVPN connection 
> between them giving each 1 additional private IP.

Ok...

> Now I want to make some services on server A accessable though the 
> public IP of server B. (While they stay reachable on the public IP of 
> server A.)

*nod*

> To simplify things:  The private openvpn IP of both servers is not 
> used for anything else. Just the connection between these two 
> servers.  You can think of only making one service available - 
> everything else will just duplicate iptables commands.

It sounds like the OpenVPN IP will work for the routing where I was 
previously talking about the additional IP.

> This is nearly what I want:  I want to forward ExtB:80 to be 
> forwarded to IntA:80 and associated reply traffic to go back out 
> ExtB, not default ExtA. (The client should not notice A at all.)

Right.

> B will not provide any own service at the ports in question.

Ok, this makes things simpler.  As long as the ports you want redirected 
to A are not in use by B, you can get away with one IP on B.  (And vice 
versa if you ever wanted to do the same or for others searching the 
archives later.)

> What is tc and how is it set up ?

Now that I've had more sleep, I think I've slightly mis-lead you.  "tc" 
or traffic control is the command you use under Linux to set up QoS. 
"tc" is usually used in close conjunction with the "ip" command.  It is 
actually the "ip" command (my mistake before) that you will use to 
create rules to decide what routing tables to use when sending the 
traffic out.  (Once I have the basic idea you are after correct I'll go 
in to mach setups for you.)

> Everything that comes on the private ip (openvpn ip) applies. That ip 
> is not used for anything else.

Ok, good.

Is it fair to say your layout is more like this:

   e                     e
   A                     B
+-+-+                 +-+-+
| A +-oA-(OpenVPN)-oB-+ B |
+---+                 +---+

In this case, you will port forward eB to oA.  If you wanted to you 
could port forward eA to oB too.

> No.

Again, this will make things simpler.

> I need this setup for two things, one is hard to explain, so I will 
> skip it, the other is easy:  I need to transfer a service which 
> cannot run on two servers in parallel from one host to another.  The 
> problem is, that clients are connecting all the time and do this by 
> DNS.  Now changing DNS needs some time to timeout the caches and I do 
> have near by no controll over the dns servers. The TTL is two days. 
> So I need the very same instance of one service to be reachable by 
> two ips on two different servers (at two different providers).

(I'll make this short and sweet.)  I understand as much as I need to. 
And "I'm sorry.".  ;)

> Your scenario was much more than I need.  You involved 4 systems (ext 
> and int, A and B). I only have 2 and I will never need to do all this 
> in two directions. In both my use cases, there is only a need to 
> forward from B to A, never from A to B at the same time.

*nod*  Let's try this scenario.

> Any help to starting points for the configuration commands is 
> appreciated.

(Using the above diagram.)

Port forward the service in question from eB to oA.  Set up an "ip rule" 
(and dependent routing tables) that will cause A to rout any traffic 
that comes in to oA out through oB.  This way any traffic that comes in 
to A via eA or lo will be routed just like it is now.  Any traffic that 
comes in to A via oA will be routed out through oB and summarily back 
out eB which it came in to.

Does this do what you are wanting to do?  If it does let me know and 
we'll get started on the ip rules and routing tables.



Grant. . . .
