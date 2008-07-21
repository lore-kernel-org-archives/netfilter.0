From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables to perform MAC NAT ?
Date: Mon, 21 Jul 2008 14:37:36 -0500
Message-ID: <4884E580.5000909@riverviewtech.net>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net> <4884B214.90406@demaine.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884B214.90406@demaine.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

> (Grant sorry for double, I forgot to change the To: field)

No problem.  Someone (possibly me?) needs to suggest that the mailing 
list be tweaked to direct replies directly to it rather than the sender 
of the message being replied to.

On 07/21/08 10:58, DEMAINE Benoit-Pierre wrote:
> As mentioned, i know the problem is 99% likely to be due to the 
> MA311.

*nod*

> Do all atheros chipsets work fine ? maybe I could buy one for cheap ?

I don't know what chipsets work, take a look at the web page(s) for the 
Atheros chipsets under Linux, namely the MADWiFi driver.

> I dont really know what eth1 is; hostap always produce two interfaces 
> per NIC; never understood the real difference, but in my case, i know 
> i shall iwconfig/ifconfig on wlan0_rename. eth1 and wlan0_rename are 
> both the same NIC, managed by hostap (see how the MAC is very 
> similar). Thus, it is normal you think eth1 is unconnected (maybe you 
> would have understand if you better knew hostap, or if I joined 
> iwconfig).

*nod*

I have looked at HostAP but never messed with it.  I've always been able 
to do what I needed with iwconfig, ifconfig, and brctl.  Though if I 
recall, HostAP was needed if I wanted to do more than basic AP, i.e. 
going an infrastructure and / or use any thing like 802.1x.

> IPv6 is not today's problem.

*nod*  I was more concerned about the fact that IP(v4) was not bound to 
the interfaces that it needed to be bound to.

> It's what i have been said years ago; that's why 3y ago, when brctl 
> failed, i did not spend more than 10 minutes testing it, and moved 
> *at once* to (IP) NAT. And, IMHO, my tests confirm it again. So, the 
> point of this thread is to "workaround" this :)

*nod*

Is there a reason you did not look in to standard routing verses NAT?  I 
would think it would be trivial to get your workstations to connect 
through your system as a router?  Though, depending on what your 
internet router is, you may not be able to tell it that there is another 
subnet behind the system (Gluton) acting as the AP / Router.

> Yup, see question further :)

*nod*

> Yup, kinda works. But, does not work "well". I dont know enough about 
> ARP, frames, bridging and so to dig further by myself, thus, coming 
> to chat. It works with very bad side effects.

First, let's start with terminology.  Here's what things are called and 
the layer they are used on.

Data is what you are sending.

TCP send datagrams.  A datagram consist of a header with source and 
destination ports and the data to be sent.

IP sends packets.  A packet consist of a header with source and 
destination IP addresses and the TCP datagram to be sent.

EthernetEtherent sends frames.  A frame consist of a header with source 
and destination MAC addresses and the IP packet to be sent.

ARP uses special ethernet frames.  The ARP frame consists of source 
hardware address, source protocol address, target hardware address, and 
target protocol address.

(Remember that ARP is only used to find the hardware address of a device 
that is with in the local subnet.  If the device is not, then the router 
will be used.)

Proxy ARP (to the best of my knowledge) is a way for a two devices on 
separate non-connected networks to communicate with each other.  If the 
device being ARPed is in the same subnet but in another non-connected 
network one (or more) routers can be configured to Proxy ARP for it.  In 
this case a client will send an ARP requestreqeust for the target 
device, to which the router doing the Proxy ARP will respond with its 
own MAC address.  Thus the client sending the ARP request will have an 
answer and a target MAC address to send the traffic to.

When the client does send its traffic, it will do so with an ethernet 
frame with its own MAC as the source address and the router's MAC 
address as the destination address with an IP packet with the expected 
source and destination IP addresses.  The router doing the Proxy ARPing 
will then receive this packet and alter the source and destination MAC 
addresses and send a new ethernet frame on out to the next network 
segment containing an unmodified IP packet.

> No, I simply want to solve my side effect. I have exposed the 
> limitations of the machine (try to keep hardware, that MA311 seems to 
> not enjoy brctl), and exposed some tests I did. Before the question I 
> exposed what I did, and know for sure. After, I exposed what I think, 
> or could do.

'k  (I think.)

> Maybe there is a magical ebtables option I did not remark, or a 
> friend tool specially dedicated to help brctl in this kind of 
> configurations. Many people bought MA311, so, I really hope this case 
> have been met by many people, and hopefully, some solved it.

Faulty hardware is usually extremely tough to get around.

Seeing as how I believe the problem to be with the MA301 and bridging 
with its needed promiscuouspromiscious mode, I think you will have 
better luck with Proxy ARP.  With Proxy ARP all ethernet frames will be 
directly to the raw ethernet or MA301 MAC address.

I'm betting that Proxy ARP will also play a little nicer with some other 
things than having EBTables automatically reply to ARPs.  At least I'm 
hoping that Proxy ARP will try to take target device state in to account.

> I can remove the bridge if it can help. All I want is to remove the 
> IP-NAT thing, so that my network get unified => transform the machine 
> into a real transparent bridge, at least at the IP point of view. 
> But, if I remove brctl bridging, I will need to recreate an other way 
> (or the apckets will never go through ^^ ).

*nod*

Why not just use standard routing?

> Facts are: I want bridging to gain homogeneous/unified network, but 
> MA311 is not bridge friendly.

*nod*

> This is a very important point to me, because it shows that it's only 
> an ARP problem, and that brctl really helps a lot (it does actually 
> forward packets from side to side). But, messing up arp tables is 
> something really messy. I am surprised that this simple command does 
> not work "as well" as it's iptables equivalent: the iptablei NAT does 
> NAT for both questions and answers; I wonder why ...

Eh, IPTables goes a littlelitte further than it possibly should by 
providing the unNATing that it does.  However 99+% of the time this is 
desired so it is ok.

> In fact, I wonder if there could be two bugs in brctl:

Keep in mind that the ""problem is not with the brctl command (read: 
binary file).  Brctl is just the user space utility to adjust bridging 
in the kernel, much like IPTables is the user space utility to adjust 
firewalling in the kernel.

Also, this is not a problem with bridging so much as it is a problem 
with the MA311 ethernet device.  If you were using a different ethernet 
device we would not be having this discussion.

> - answer not coming back through

The answers do not come back through because you have altered the 
destination of the ARP reply (source of the modified ARP requestreqeust) 
to be the MAC address of the MA3111.  So by all rights bridging is not 
suppose to pass the ARP reply on.

> - bug in --snat-arp

No, I don't think so.  SNAT is doing what it is suppose to.  At least in 
so far as modifying the "source hardwarehardare address" with in the ARP 
request packet.  (You would probably want to modify the source MAC 
address of the ethernet frame carryingcarying the ARP requestreqeust too.)

In effect you are wanting a way to pass the ARP reply on to the internal 
system that initiated the original ARP request.  This is more of a 
stateful operation verses the stateless operation that the majority of 
this operatesopeates on.

> I did not detailed this point in my first post, but after the simple 
> snat thing, host B get A's MAC in his ARP tables. Considering this 
> point, plus tcpdumps just means: my ebtables rule does forward the 
> question, but the question still contains A's MAC even when using 
> --snat-arp (that should IMHO work "inside" the question). I can send 
> details on this if you want within 24h. I would need to move two 
> machines in the network to do that.

No, don't go to that trouble.  Do some reading on Proxy ARP first.

> I wondered if brctl was bothered by the fact the answer comes back 
> with it's own MAC as destination; once ARP tables are declared, all 
> works fine, maybe because of IP routing tables; ARP queries seem to 
> be more in trouble.

I don't think that the bridging portion of the kernel even considered 
passing the packet out the bridge because the destination MAC of the 
frame was to the bridge its self, not another system on the other side 
of the bridge.

Do some reading on Proxy ARP in the LARTC documentation:  Pseudo-bridges 
with Proxy-ARP (http://lartc.org/howto/lartc.bridging.proxy-arp.html)



Grant. . . .
