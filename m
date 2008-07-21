From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: Re: ebtables to perform MAC NAT ?
Date: Tue, 22 Jul 2008 01:09:14 +0200
Message-ID: <4885171A.1080709@demaine.info>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net> <4884B214.90406@demaine.info> <4884E580.5000909@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884E580.5000909@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Grant Taylor wrote:
>> (Grant sorry for double, I forgot to change the To: field)
> 
> No problem.  Someone (possibly me?) needs to suggest that the mailing 
> list be tweaked to direct replies directly to it rather than the sender 
> of the message being replied to.

Adding a reply to is usually enough.

>> IPv6 is not today's problem.
> 
> *nod*  I was more concerned about the fact that IP(v4) was not bound to 
> the interfaces that it needed to be bound to.

Yup, hostap things made mess in your head; the only way for me to
understand which interface to use is to look at the MAC length: a long
MAC like the eth1's would never fit any network (802.3 or 802.11 :) ).
The only place where I have seen long MACs like this is ethernet over
FireWire.

>> It's what i have been said years ago; that's why 3y ago, when brctl 
>> failed, i did not spend more than 10 minutes testing it, and moved *at 
>> once* to (IP) NAT. And, IMHO, my tests confirm it again. So, the point 
>> of this thread is to "workaround" this :)
> 
> *nod*
> 
> Is there a reason you did not look in to standard routing verses NAT?  I 
> would think it would be trivial to get your workstations to connect 
> through your system as a router?  Though, depending on what your 
> internet router is, you may not be able to tell it that there is another 
> subnet behind the system (Gluton) acting as the AP / Router.

Yes: because i know what i would imply. Imagine a world where my house
would have 5 machines like Gluton; there would be at least a base
network/mask for the "root", and a different network/mask per zone
behind each machine; each bridge would be easier, cause they would be
simple routers; but this would require long routing tables. If a machine
in the middle zone wanted to be able to talk to any machine, it would
require to have a default net, a default gate, plus 4 local gates. It
easy to do manually for any good UNIX admin; it's way more difficult to
implement when you want to use a hardware DHCP and deliver zones to
Windows (i would not even be able to declare routes and gates in a Home
Windows).

=> to keep things simple, let me have a single homogeneous network.
Every one in the same network (yes there will be broadcasting problems;
in fact, i am already having ARP broadcast problems :) it's even the
only problem i have left to fix :D )

I could also buy hardware repeaters (like WDS machines), but they cost
130 euro each, and I got enough hardware to do it myself, so, let's try
the soft way before buying more stuff.

> First, let's start with terminology.  Here's what things are called and 
> the layer they are used on.

Thanks for the lecture :) I had computing lectures in my french, and,
math and electronic lectures in english, so, things are a bit mixed in
my head :) Words are important ... except you did not really specify the
layers :) nm

> Proxy ARP (to the best of my knowledge) is a way for a two devices on 
> separate non-connected networks to communicate with each other. 

Some people mentioned proxyarp, but i did not found so called package in
Debian or Gentoo; maybe the package has an other name ? as long as it
can help brctl to bridge correctly ... I am open minded.

> If the 
> device being ARPed is in the same subnet but in another non-connected 
> network one (or more) routers can be configured to Proxy ARP for it.  In 
> this case a client will send an ARP requestreqeust for the target 
> device, to which the router doing the Proxy ARP will respond with its 
> own MAC address.  Thus the client sending the ARP request will have an 
> answer and a target MAC address to send the traffic to.

ok

> When the client does send its traffic, it will do so with an ethernet 
> frame with its own MAC as the source address and the router's MAC 
> address as the destination address with an IP packet with the expected 
> source and destination IP addresses.  The router doing the Proxy ARPing 
> will then receive this packet and alter the source and destination MAC 
> addresses and send a new ethernet frame on out to the next network 
> segment containing an unmodified IP packet.

Yup, all known, and works already this way when i do as said in my first
post:
> The whole problem lays in arp tables: if after
>      ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
>      --to-source 00:09:5B:91:56:08 --snat-arp ;
> I declare arp tables manually on all hosts, everything works fine. 

>> Maybe there is a magical ebtables option I did not remark, or a friend 
>> tool specially dedicated to help brctl in this kind of configurations. 
>> Many people bought MA311, so, I really hope this case have been met by 
>> many people, and hopefully, some solved it.
> 
> Faulty hardware is usually extremely tough to get around.

If we cant do it using ebtable/netfilter/proxyarp ... either I have to
revert IP-NAT, or buy an Atheros, or buy a Fonera or Linksys ...

> 
> Seeing as how I believe the problem to be with the MA301 and bridging 
> with its needed promiscuouspromiscious mode, I think you will have 
> better luck with Proxy ARP.  With Proxy ARP all ethernet frames will be 
> directly to the raw ethernet or MA301 MAC address.

What's the package name in distributions ?
or, do I have to install it manually ?

> Why not just use standard routing?

See higher: to day, I am *trying* to get unified network.

> Keep in mind that the ""problem is not with the brctl command (read: 
> binary file).  Brctl is just the user space utility to adjust bridging 
> in the kernel, much like IPTables is the user space utility to adjust 
> firewalling in the kernel.
> 
> Also, this is not a problem with bridging so much as it is a problem 
> with the MA311 ethernet device.  If you were using a different ethernet 
> device we would not be having this discussion.

Could things be different if I did stuff in PREROUTING ? maybe there is
a way to do things in the PREROUTING place, a way that would look like
an ARP proxy ... ?

>> - answer not coming back through
> 
> The answers do not come back through because you have altered the 
> destination of the ARP reply (source of the modified ARP requestreqeust) 
> to be the MAC address of the MA3111.  So by all rights bridging is not 
> suppose to pass the ARP reply on.

In IPtables NAT, the answers comes back with the gateway IP address as
destination, and then, the gateway rebuilds a packet with the LAN IP a
new destination. This is what I was expecting ebtables would do with
MACs when providing --snat-arp.

Maybe there is a workaround, still in rperouting: imagine we record the
... "frame" number sequence, and other parameters at the moment we do
SNAT; if we can predict what the answer should look like (sequence
number should be the same IMHO, but with a frame number incremented),
then we can identify the answer coming in, and then ... do DNAT in
PREROUTING ? we need to identfy whether an answer is coming back for
Gluton itself, or for a machine it is NATing ...

>> - bug in --snat-arp
> 
> No, I don't think so.  SNAT is doing what it is suppose to.  At least in 
> so far as modifying the "source hardwarehardare address" with in the ARP 
> request packet.  (You would probably want to modify the source MAC 
> address of the ethernet frame carryingcarying the ARP requestreqeust too.)

Maybe; that's the point where I say: I dont know enough about networking
to know what frames should look like, and the tools to check what they
actually look like :)

> In effect you are wanting a way to pass the ARP reply on to the internal 
> system that initiated the original ARP request.  This is more of a 
> stateful operation verses the stateless operation that the majority of 
> this operatesopeates on.

Like Iptables NAT would do.

>> I did not detailed this point in my first post, but after the simple 
>> snat thing, host B get A's MAC in his ARP tables. Considering this 
>> point, plus tcpdumps just means: my ebtables rule does forward the 
>> question, but the question still contains A's MAC even when using 
>> --snat-arp (that should IMHO work "inside" the question). I can send 
>> details on this if you want within 24h. I would need to move two 
>> machines in the network to do that.
> 
> No, don't go to that trouble.  Do some reading on Proxy ARP first.
> 
>> I wondered if brctl was bothered by the fact the answer comes back 
>> with it's own MAC as destination; once ARP tables are declared, all 
>> works fine, maybe because of IP routing tables; ARP queries seem to be 
>> more in trouble.
> 
> I don't think that the bridging portion of the kernel even considered 
> passing the packet out the bridge because the destination MAC of the 
> frame was to the bridge its self, not another system on the other side 
> of the bridge.

It's normal the broadcast goes through: it has destination different
than local MAC; that's why I think, if we change the destination of the
answer in PREROUTING, the answer should be routed back to the one who
asked the question :)

But if proxyarp already does that ... => how is it called in debian ?

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)

