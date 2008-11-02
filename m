From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 14:51:43 -0600
Message-ID: <490E12DF.6090602@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DF4CA.1010808@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Note:  Because of the length of my reply I'm going to split this reply 
in to two parts.  The first (previous) part will be on routing in 
general and the second (this) part will be on NATing.

On 11/2/2008 12:43 PM, Daniel L. Miller wrote:
> I guess part of my difficulty lies in a lack of experience configuring 
> non-linux routers.  Behind-the-scenes, as it were, do all/most routers 
> use NAT to accomplish the goal of linking networks?  It always seemed to 
> me NAT was a 'kludge' that was somehow unnecessary when "more 
> expensive?" equipment was involved.

No, routers in general do *NOT* use NAT.

In all the above scenarios, all systems in the path see the real source 
and destination IPs of host 1 and host 2.  NAT is a way to change source 
and or destination address for some reason.

To understand NATing you need to understand that there are some IP 
address ranges that are *NOT* suppose to be seen on the global internet 
and thus have to be changed (translated) in to something that is more 
acceptable on the global internet.  Similar is also done with in complex 
networks, especially when tyeing multiple businesses together for some 
reason.

Usually the reason is that most networks use RFC 1918 Addresses reserved 
for Private Internets, which are *NOT* suppose to be on the open 
globally routable internet.  In fact, RFC 1918 addresses are typically 
filtered out as soon as they hit the internet, or at least the ISP 
/should/ filter them and not pass them.

Despite the fact that routing can handle these addresses with out any 
problem there are agreed upon rules / guidelines that have been agreed 
to that impose that these (RFC 1918) addresses are not to be in use on 
the internet.

Thus to allow systems that are on these RFC 1918 private IP addresses to 
reach the internet, their source address IP /Network Address/ has to be 
changed or /Translated/, thus we have /Network Address Translation/, or 
NAT for short.

Let's consider this very simple scenario where I have my home network 
and a router and a simple ADSL internet connection.

    :
    |
+--+--+         +----+
| RTR +---(A)---+ Me |
+-----+         +----+

Let's suppose I have a source IP of 192.168.1.2 and I want to search the 
web using Google, so my computer talks to 74.125.95.99 (one of the IPs 
that www.google.com resolves to).

My packet with a source IP address of 192.168.1.2 and a destination 
address of 74.125.95.99 leaves my computer and goes to my router 
(because of my /Default Gateway/).

My router then sees that it has to send the packet to its /Default 
Gateway/, my ISP's router.  However my router knows that it has to 
/Translate/ the source IP of the packet to something that is internet 
friendly.  So, my router alters the source IP of the packet to its own 
external globally routable IP address A.B.C.D, which is not an RFC 1918 
private IP address.  So now the packet with a source IP address of 
A.B.C.D and a destination address of 74.125.95.99 leaves my router and 
goes to my ISP's router.

My ISP's router chooses one of its upstream connections and sends the 
packet with a source IP address of A.B.C.D and a destination address of 
74.125.95.99 to one of its upstream router.  My ISP's upstream router 
will then choose a route and send the packet with a source IP address of 
A.B.C.D and a destination address of 74.125.95.99 on down the line until 
it reaches the destination 74.125.95.99.

Google will then process my packet and reply back to me.  Thus Google 
sends a packet with a source ip of 74.125.95.99 and a destination 
address of A.B.C.D back through the internet to my ISP's ISP, and my 
ISP, and to my router.

My router will then see the packet with a source ip of 74.125.95.99 and 
a destination address of A.B.C.D and realize that it is actually a reply 
packet that needs to be un/Translated/.  So my router will change the 
destination IP address of A.B.C.D back to my real IP address of 
192.168.1.2 and send it on to my computer.

My computer sees the packet with a source IP address of 74.125.95.99 and 
a destination address of 192.168.1.2 and realizes that it is the reply 
to the packet I sent moments earlier and hands it up through the network 
stack to my web browser.

As you can see the only place that /Network Address Translation/ (a.k.a. 
NAT) took place is where my private network connected to the global 
internet.

I had to use NAT because there are rules on the global internet that say 
that the IP addresses that I chose to use are not allowed on the global 
internet.  Recalling the previous diagram(s) where Bob and Tom connected 
their networks, they /could/ have /chosen/ to use NAT if they did not 
want to have to set up routes between each other.

Another use of NATing is to allow two completely independent networks to 
inter operate.  Below is an example of double NATing that I like to 
refer to as a "Customer Interface Router", typically used when a 
business is subscribing to a service and / or support form a larger 
entity that supports multiple individual customers all with varying and 
possibly conflicting network configurations.  An example of which might 
be a big wholesale book distributor or local / state / national 
government agency that is offering some sort of service to the small 
entity that has the Customer Interface Router (a.k.a. CIR).  Typically 
in such scenarios both entities only want to allow connections for the 
services needed with out having to re-configure their network to support 
connections to far flung parts of the others network, or in the case of 
the larger provider deal with potential overlapping IP address spaces of 
smaller networks.

    :
    |
+--+--+         +---+
| RTR +---(A)---+ T |
+-----+    |    +---+
            |
            |    +-----+
            +----+ CIR += = =
                 +-----+

So in this case, the Customer send a packet with a source IP of T and a 
destination IP address of CIR from their terminal T to the Customer 
Interface Router CIR.

The Customer Interface Router will then /Translate/ the source IP 
address to be it's own IP of the interface facing the providers network 
as well as /Translating/ the destination IP to be what ever the provider 
wants with in their own network.  Ultimately the Customer Interface 
Router sends a packet with a source IP of <IP of CIR's provider 
interface> and a destination IP address of <something with in the 
providers network>.

The packet will then pass through the providers network to the real end 
point equipment (AS/400, mainframe, video surveillance system, what 
ever) and be processed and a reply packet will be sent.

The reply packet with a source IP of <something with in the providers 
network> and a destination IP address of <IP of CIR's provider interface>.

The Customer Interface Router will receive the packet with a source IP 
of <something with in the providers network> and a destination IP 
address of <IP of CIR's provider interface> and /Translate/ the source 
IP address of CIR on the customers network as well as /Translating/ the 
destination IP to be T.  Ultimately the Customer Interface Router sends 
a packet with a source IP address of CIR and a destination IP address of 
CIR back to the terminal T.

Thus through the use of double NAT on the Customer Interface Router we 
have allowed two completely separate and independent network structures 
to communicate and inter operate with out any regard as to what the 
others network structure is.

In short, NATing is used when you need to cross two conceptually unique 
networks that do not necessarily play well with each other.



Grant. . . .
