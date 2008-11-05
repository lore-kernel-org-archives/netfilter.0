From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Wed, 05 Nov 2008 11:17:58 -0600
Message-ID: <4911D546.2020104@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <4910D722.6050008@riverviewtech.net> <4910E095.2050003@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4910E095.2050003@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/04/08 17:53, Daniel L. Miller wrote:
> *Head bouncing on desk*  You just had to do it.  You just HAD to throw 
> something else in, didn't you?  Ok - no VPN during these discussions!!! 
> That's next thread.

Ok...  I only brought VPN up because you will want that to tie two 
offices across the internet together.  But if you want to pretend for 
the sake of discussion that you have a really long ethernet cable (or a 
legacy WAN using T1s which use basic routing) I'm ok with that.

> Once again - I'm using language that's too ambiguous.  I actually 
> probably inferred that - but I didn't intend to.  The INTENT was to 
> illustrate a clumsy, inefficient, amateurish connection between Internet 
> connected sites using non-VPN capable home-office consumer-grade 
> firewall routers - the under $20 kind.

Ok.

Be aware that the simple facts that you are using private IP addresses 
and that you want to take them across the internet, where they can not 
go, means that you will have to use NAT.  Remember that the internet 
only caries globally routable IP addresses.

> You're assuming a level of capability and courtesy for the sysadmin I am 
> not - nor am I talking about higher-level protocols.  So from Los 
> Angeles, they'll have to type in the public IP address of the New York 
> router to reach that office.

Eh.  I'm not so much assuming that as I'm trying to lead a horse to 
water that is safe to drink that will also solve the problems that you 
unknowingly are going to have.  If you would prefer to discuss things 
and then get a "That will not work because of..." and then have to 
re-discuss things, we can do that.  :)  Just let me know how you want 
the conversation to go.  In short you are asking questions and providing 
some details of your needs (which keep admittedly by you changing) and I 
am trying to answer them and get you to understand along the way.

> *Exasperated shrug* Now that I've typed that - it really doesn't make 
> too much sense.  All right - fine.  I guess a VPN was needed somewhere.  
> But darn it - the VPN operates at a higher level - somewhere along the 
> line the VPN server/router needs to translate the virtual IP's to 
> something the rest of the world understands - and that means NAT!

No.  VPN's don't /NAT/.  VPN's /encapsulate/.  Think of a VPN as taking 
a letter you wrote to someone and putting it inside of another bigger 
envelope and sending it to someone who opens the outer envelope and 
takes the smaller envelope out and sends it to the proper department on 
their end.

+-----------+    +-------------------+    +----------+
| IP packet | -> | VPN packet        | -> | Internet |
+-----------+    |     +-----------+ |    +----------+
                  |     | IP packet | |
                  |     +-----------+ |
                  +-------------------+

+----------+    +-------------------+    +-----------+
| Internet | -> | VPN packet        | -> | IP packet |
+----------+    |     +-----------+ |    +-----------+
                 |     | IP packet | |
                 |     +-----------+ |
                 +-------------------+

The (IP packet) has host 1 as its source and host 2 as its destination 
and does not change any where in transit.
The [VPN packet ...] has the one VPN gateway as its source and the other 
VPN gateway as its destination.  These packets have the globally 
routable IP addresses in them.

> Again with the proxy (what's the matter with you?  Trying to give me a 
> complete answer that accounts for the exceptions?  Geez....)

Sorry.  :P

Up until recently what you have presented could be solved by basic 
routing and / or NATing -OR- by proxying.  Seeing as how I started off 
indicating that either could be used I was just continuing the concept 
in discussion.  I'll drop it and let you pick it up later if you want to 
inquire about it.  :)

> I think my confusion stems from my own introduction to IP, which was via 
> WindozeNT 4.0.  Somewhere along the line NAT was referred to in some 
> documentation as a "poor-man's solution" to doing "proper" routing - and 
> that concept has carried forward with me to where I keep thinking NAT is 
> somehow an inferior solution to the "proper" way of doing things.  If 
> the only "proper" (read: other) way of connecting LAN's to the Internet 
> is by assigning public IP's to workstations (and of course 
> purchasing/reserving/controlling such IP's) - then I can drop the 
> inferiority complex I've held with regard to NAT.

Ugh.  Forgive me if I believe just from the statement about where you 
learned about routing (not even taking in to consideration this 
discussion) that you were not taught hardly any thing (if even that) 
about routing.  It has been my experience that /most/ information that 
Microsoft has provided on routing was the smallest amount that they 
could to even thing about stepping up and playing with the big boys.  It 
is my opinion that Microsoft network was and still is to a large part 
NetBIOS based, even if it is on top of TCP/IP.  Even that, the TCP/IP is 
simply a happenstance as a carrier protocol that could just as easily 
been IPX or DECNet Phase IV.

There was a time that (in my opinion) /most/ Windows technicians would 
have thought that the only two ways to get a Windows machine to access 
the internet was with live globally routable IPs assigned to all the 
workstations using ""proper routing -OR- to use NAT.  However there was 
/ is this other seldom used technology that I'm no longer mentioning.  ;)

At this point I don't really see any questions, just comments on things, 
so I'm going to let you lead the conversation by asking some other 
questions, which I'll respond to.  :)



Grant. . . .
