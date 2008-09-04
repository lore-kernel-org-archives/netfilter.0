From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: FW: Reject on a Bridge
Date: Thu, 04 Sep 2008 13:57:13 -0500
Message-ID: <48C02F89.5000201@riverviewtech.net>
References: <002801c90eae$9ae3f9a0$d0abece0$@com> <d95317090809041000p2324c9bfjb8da6bf2f4bdd626@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090809041000p2324c9bfjb8da6bf2f4bdd626@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/04/08 12:00, Gilad Benjamini wrote:
> The way I see it, a firewall is allowed to "pretend" to be the end 
> point, without revealing itself as a separate entity. Network devices 
> do this in different scenarios; e.g. NAT, proxy-ARP, DHCP-relay. In 
> this case, the "pretending" part would be to send a RST packet with 
> reverse addresses. Actually, this is exactly what the send_reset 
> function does, including IP addresses, but excluding MAC addresses, 
> which are determined elsewhere (routing code ?)

With the exception of Proxy ARP I'll agree with you to a point.  However 
that point is that the NAT and the DHCP relay agent are actually active 
layer 3 devices with in the path.  Those layer 3 devices are involved in 
everything that passes through them.  There is no transparency with NAT 
or DHCP relay agent as far as clients sending their ethernet traffic to 
something other than the NAT / DHCP relay agent.  The clients do send 
their ethernet traffic directly to the NAT / DHCP relay agent as in 
using their MAC as the destination for their ethernet frames.

Where as in bridging (and Proxy ARP as a special form there of) devices 
do not communicate directly with the bridge.  Rather the ethernet frames 
are targeted at a different device on the other side of the bridge. 
Now, IMHO Proxy ARP is a specialized form of pseudo bridging in such as 
you talk directly to the Proxy ARP device's MAC, which in turn re-sends 
the same ethernet frame out the other side substituting its own MAC as 
the source MAC for the next ethernet frame.  Thus, you are bridging 
across the gap that Proxy ARP is ""fixing.

It is my understanding that Proxy ARP was (historically) used to allow 
two systems disconnected by one (or more) networks that did not speak 
the needed protocol to be able to communicate.  I.e. if you have a 
couple of DEC / Compaq Alphas that need to speak DECnet across an IP 
only backbone, you could Proxy ARP their MAC address across all 
intermediary devices such that both Alphas would see each other on the 
same LAN segment, at least so far as being able to communicate MAC to 
MAC with each other.

In the above Proxy ARP scenario each end system thinks that the other 
end system is directly attached to the local segment and is able to 
speak directly to the other system via the Proxy ARP devices MAC 
address.  I.e., consider this scenario.

+---+   +----+   +----+   +----+   +---+
| A +---+ R1 +---+ R2 +---+ R3 +---+ B |
+---+   +----+   +----+   +----+   +---+

(I'm going to provide the last octet of the six octet MAC addresses for 
briefness.)

Sys:   L:   R:
  A     --   12
R1     23   34
R2     45   56
R3     67   78
  B     89   --

(L is left facing NIC and R is the right facing NIC.)

When A wants to talk to B, A will send an ethernet frame from it's MAC 
address of (ending in) 12 going to R1's MAC address of 23.  R1 will then 
Proxy ARP the traffic and send a new ethernet frame from it's MAC 
address of 34 going to R2's MAC address of 45.  R2 will then Proxy ARP 
the traffic and send a new ethernet frame from it's MAC address of 56 
going to R3's MAC address of 67.  R3 will then Proxy ARP the traffic and 
send a new ethernet frame from it's MAC address of 78 to B's MAC address 
of 89.  (The same happens in reverse.)  Thus in the end A thinks that B 
is at 23 and B thinks that A is at 78.

Despite A and B having the wrong MAC addresses for each other, they are 
able to communicate with each other across the backbone that does not 
know a thing about the higher layer protocol that is being used.

However during this process, none of the routers R1, R2, or R3, know any 
thing about the higher layer protocol, thus are not able to generate any 
sort of traffic indicating an error because they don't have any 
interfaces, much less addresses, participating in the protocol that is 
being passed between A and B.

So to recap, NAT and DHCP relay agents are actively involved (on layer 
3) in communications while Proxy ARP is passively involved (layer 2 
only) in communications, at least from the layer 3 point of view.  With 
this in mind NAT can reject something because it does have a layer 3 
address.

DHCP relay agents are yet another different critter that is not usually 
involved in all communications.  Even at that, it is still the router 
that is receiving the DHCP requests (layer 3 traffic) and gatewaying the 
actually DHCP processing to the back end DHCP server.



Grant. . . .
