From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables to perform MAC NAT ?
Date: Tue, 22 Jul 2008 11:34:20 -0500
Message-ID: <48860C0C.60504@riverviewtech.net>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net> <4884B214.90406@demaine.info> <4884E580.5000909@riverviewtech.net> <4885171A.1080709@demaine.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4885171A.1080709@demaine.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 18:09, DEMAINE Benoit-Pierre wrote:
> Adding a reply to is usually enough.

So long as you know that you need to do it and remember to do it, I'll 
agree.  However I specialize in making things easier for end users and 
IMHO they should not have to know that they have to much less remember 
that they have to.

> Yup, hostap things made mess in your head; the only way for me to 
> understand which interface to use is to look at the MAC length: a 
> long MAC like the eth1's would never fit any network (802.3 or 802.11 
> :) ). The only place where I have seen long MACs like this is 
> ethernet over FireWire.

I've not payed much attention to the MAC length.  I usually do very 
little with MAC addresses.  Well at least not as long as I'm not doing 
special things (read layer 3 and layer 2 firewalling on bridging VLAN 
interfaces off of a trunked bond interface that has two or more physical 
ethernet ports).

> Yes: because i know what i would imply. Imagine a world where my 
> house would have 5 machines like Gluton; there would be at least a 
> base network/mask for the "root", and a different network/mask per 
> zone behind each machine; each bridge would be easier, cause they 
> would be simple routers; but this would require long routing tables. 
> If a machine in the middle zone wanted to be able to talk to any 
> machine, it would require to have a default net, a default gate, plus 
> 4 local gates. It easy to do manually for any good UNIX admin; it's 
> way more difficult to implement when you want to use a hardware DHCP 
> and deliver zones to Windows (i would not even be able to declare 
> routes and gates in a Home Windows).

Heh.  Sounds like your home network is more of a daisy chain of 
computers with multiple network cars in them or something else equally 
as strange.

You can add persistent routes to Windows via the route command.  Though 
I'm not sure how well those will play with DHCP.

> => to keep things simple, let me have a single homogeneous network. 
> Every one in the same network (yes there will be broadcasting 
> problems; in fact, i am already having ARP broadcast problems :) it's 
> even the only problem i have left to fix :D )

*nod*

> I could also buy hardware repeaters (like WDS machines), but they 
> cost 130 euro each, and I got enough hardware to do it myself, so, 
> let's try the soft way before buying more stuff.

*nod*

> Thanks for the lecture :) I had computing lectures in my french, and, 
> math and electronic lectures in english, so, things are a bit mixed 
> in my head :) Words are important ... except you did not really 
> specify the layers :) nm

Heh.  I was trying to make things simpler.  The IP network model is four 
layers where as the OSI network model is 7 and there is not really a 
good mesh between the two.  Here's a quick run down for you though.

IP          data name   OSI
app         (other)     session (5) / presentation (6) / app (7)
transport   datagram    transport (4)
internet    packet      network (3)
link        frame       physical (1) / data (2)

These are rough correlations, which can and will be argued.

> Some people mentioned proxyarp, but i did not found so called package 
> in Debian or Gentoo; maybe the package has an other name ? as long as 
> it can help brctl to bridge correctly ... I am open minded.

That's because it's not a package per say.  Proxy ARP is a feature of 
the kernel that has to be enabled, much like routing and IP forwarding.

Rather than me re-typing how to do it, take a look at the write up about 
it in the Linux Advanced Routing and Traffic Control HowTo - 
Pseudo-bridges with Proxy-ARP 
(http://lartc.org/howto/lartc.bridging.proxy-arp.html).

> Yup, all known, and works already this way when i do as said in my 
> first post:

*nod*

> If we cant do it using ebtable/netfilter/proxyarp ... either I have 
> to revert IP-NAT, or buy an Atheros, or buy a Fonera or Linksys ...

If the root of the problem is that the MA311 can not send using MAC 
addresses other than its own, I think Proxy ARP will work just fine.

> What's the package name in distributions ? or, do I have to install 
> it manually ?

(See above.)

> See higher: to day, I am *trying* to get unified network.

*nod*

> Could things be different if I did stuff in PREROUTING ? maybe there 
> is a way to do things in the PREROUTING place, a way that would look 
> like an ARP proxy ... ?

I don't think so, or at least not much so.  You will still have to deal 
with hardware that does not do what it needs to do.  So, you will need 
to change what you are wanting to do.  Can you hack around things by 
very carefully choosing where you do things, I don't know.  However if 
you back up and re-evaluate the problem and go a different direction 
with the hardware limitation in mind, I think you will find a solution.

> In IPtables NAT, the answers comes back with the gateway IP address 
> as destination, and then, the gateway rebuilds a packet with the LAN 
> IP a new destination. This is what I was expecting ebtables would do 
> with MACs when providing --snat-arp.

Unfortunately (or fortunately depending on how you look at it) no. 
IPTables is predominately an OSI layer 3 technology.  I.e. it will alter 
  the IP address and to some extent the transport layer address (ports). 
  IPTables has some backwards hacking for layer 2 stuff, but it is not 
nearly as functional as the layer 3 and 4 stuff.

Remember that IP addresses and TCP / UDP ports are meant to work across 
multiple local segments, which is where MAC addresses are confined to. 
Thus you have different tools considering the scope of where you are 
working.

> Maybe there is a workaround, still in rperouting: imagine we record 
> the ... "frame" number sequence, and other parameters at the moment 
> we do SNAT; if we can predict what the answer should look like 
> (sequence number should be the same IMHO, but with a frame number 
> incremented), then we can identify the answer coming in, and then ... 
> do DNAT in PREROUTING ? we need to identfy whether an answer is 
> coming back for Gluton itself, or for a machine it is NATing ...

The problem with that idea is that on the link layer there is nothing 
other than local systems.  There is only the small pond that things are 
connected to, no concept of any thing out side of it.  So there would be 
no concept of any machine that Gluton is NATing for, only Gluton and the 
rest of the systems in the small pond.

Take a look at Wikipedia's write up on Ethernet 
(http://en.wikipedia.org/wiki/Ethernet) for some more information on 
ethernet frames.  You will find that there is no sequence number in 
ethernet.

> Maybe; that's the point where I say: I dont know enough about 
> networking to know what frames should look like, and the tools to 
> check what they actually look like :)

*nod*

Do some reading about IP and Ethernet.

> Like Iptables NAT would do.

Correct.

> It's normal the broadcast goes through: it has destination different 
> than local MAC; that's why I think, if we change the destination of 
> the answer in PREROUTING, the answer should be routed back to the one 
> who asked the question :)

Eh.  I think the problem has more to do with the source MAC address and 
the fact that the MA311 apparently can not alter the source MAC address 
of frames that it sends.

> But if proxyarp already does that ... => how is it called in debian?

Read the (above) referenced section of the LARTC documentation.



Grant. . . .
