From: David Leangen <dleangen@canada.com>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Thu, 29 Sep 2005 13:43:02 +0900
Message-ID: <433B70D6.6030201@canada.com>
References: <NEBBKBPLMLNABNADCIPAIEDLBHAB.dleangen@canada.com>
	<4338A962.6000104@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4338A962.6000104@canada.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Nice ASCII art! ;-)

 > Let's see. As far as I understand, your network looks
 > something like this:
 >
 >                           +-----------------+
 >                           |       ppp0      |
 >                           |        |        |
 >                           |        |        |
 >192.168.1.0/24------------|...1.2     ...2.1|-----192.168.2.0/24
 >                           |     Firewall    |
 >                           +-----------------+
 >
 > By "local network" you mean 192.168.2.0. Right ?

Sorry, I should have been more precise. Actually, I think my situation 
is even simpler. I'll try to live up to the quality of ASCII art you 
established in your post. :-)

     +---------------+
     |     modem     |
     | (192.168.1.1) |
     +---------------+
             |
    +-----------------+
    |       ppp0      |
    |        |        |
    |  ...1.2 (eth0)  |
    |        |        |eth1
    |           ...2.1|-----192.168.2.0/24
    |     Firewall    |
    +-----------------+


So, what I mean (and which is probably a bit confusing) is that 
19.168.1.0/24 means the "outside" network, which includes my modem, and 
192.168.2.1 is my "local" network.


 > If so or not, the first thing to check is the default gateway.
 > For 1.0 it must be 1.2 and for 2.0 it must be 2.1.

I think this is ok, but maybe somebody could confirm for me:

Destination Gateway    Genmask      Iface
192.168.1.0    *    255.255.255.0   eth0
192.168.2.0    *    255.255.255.0   eth1
default       xxx   0.0.0.0         ppp0


 > And proc/sys/net/ipv4/ip_forward must be set to 1.

Yep.


 > *mangle
 > :PREROUTING ACCEPT [0:0]
 > :INPUT ACCEPT [0:0]
 > :FORWARD ACCEPT [0:0]
 > :OUTPUT ACCEPT [0:0]
 > :POSTROUTING ACCEPT [0:0]
 > -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
 > FIN,PSH,URG -j DROP
 > -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE 
-j DROP
 > -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
 > ... etc.

 > > BTW, don't even ask about the entries in the mangle table...
 > > I just copied them mindlessly. :-(

 > Always a bad idea. In this case the rules don't do any harm
 > and are not the culprit. But I think copying once is enough ;)

:-)

I agree that it is best to understand what you're doing before writing 
rules. This stuff was proposed by one of the "security" books and I 
figured that the guy knows better than I, and I don't have the time to 
figure out what all that junk means... :-/

 > > *nat
 > > :PREROUTING ACCEPT [0:0]
 > > :POSTROUTING ACCEPT [0:0]
 > > :OUTPUT ACCEPT [0:0]
 > > -A PREROUTING -p tcp --dport 443 -j DNAT --to 192.168.2.2:443
 > > -A POSTROUTING -d 192.168.2.2 -s 192.168.0.0/255.255.0.0 -p
 > > tcp --dport 443 -j SNAT --to 192.168.1.2

 > That's strange. Imagine this. Client 2.2 sends to 2.1 to port
 > 443. The packet will be DNATed to 2.2, but SNATed to 1.2. And
 > 2.2 will discard this packet, because he sent to 2.1. A packet
 > originating from 1.1 will make it to 2.2, but it should be
 > SNATed to 2.1 and not to 1.2.

I got this from the following page:
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

In other words, all packets to port 443, regardless of the source, 
should be routed to 192.168.2.2:443. However, the problem is with hosts 
on the local network. The solution proposed in the document above was:

   ...have the NAT box also map the source IP address to its
   own for these connections, fooling the server into replying
   through it. In this example, we would do the following
   (assuming the internal IP address of the NAT box is
   192.168.1.250):

   # iptables -t nat -A POSTROUTING -d 192.168.1.1 -s \
         192.168.1.0/24 -p tcp --dport 80 -j SNAT --to \
         192.168.1.250

   Because the PREROUTING rule gets run first, the packets
   will already be destined for the internal web server: we
   can tell which ones are internally sourced by the source
   IP addresses.

Did I misread this? This is supposed to do something like a "double 
NAT". And it works, too. Again, the only problem I'm having is 
connecting to 192.168.1.1. BTW, I can connect to 192.168.1.2 without any 
problems, which is why I can't figure this problem out.


 > > -A PREROUTING -p tcp --dport 8180 -j DNAT --to 192.168.2.10:8180
 > > -A POSTROUTING -d 192.168.2.10 -s 192.168.0.0/255.255.0.0 -p
 > > tcp --dport 8180 -j SNAT --to 192.168.1.2
 > > -A PREROUTING -p tcp --dport 8182 -j DNAT --to 192.168.2.2:8182
 > > -A POSTROUTING -d 192.168.2.2 -s 192.168.0.0/255.255.0.0 -p tcp
 > > --dport 8182 -j SNAT --to 192.168.1.2
 > > -A POSTROUTING -o ppp0 -j MASQUERADE
 > > COMMIT

 > Hmm, I see no rule that DNATs to 1.1. But your OP shows such a
 > rule. So, it vanished. I recommend to start with an empty rule
 > set in nat and see if it works.

Nope... Problem with routing, maybe?


 > As your FORWARD policy is ACCEPT and there is only an
 > ACCEPT rule in FORWARD (yes, you are right, this rule isn't
 > needed), there should be no problem connecting from 2.0 to
 > 1.1. After verifying the connection add rules like this:
 >
 > [-t nat] -A PREROUTING -i ethX1 -p tcp --dport YYYY \
 >           -j DNAT --to $HOST
 > [-t nat] -A POSTROUTING -o ethX2 -p tcp -j SNAT \
 >           --to $ADDRESS_OF_OUTGOING_INTERFACE
 >
 > As long as you don't have multiple addresses per interface
 > or your setup is more complicated than I think, I see no
 > need to specify source/destination addresses in PREROUTING
 > rules. Ofcourse you can do it, if you like.

Ok... so I changed this:

-A PREROUTING -p tcp --dport 443 -j DNAT --to 192.168.2.2:443

into this:

-A PREROUTING -i ppp0 -p tcp --dport 443 -j DNAT --to 192.168.2.2

Doesn't seem to make any difference, but I guess it's a bit cleaner.


 > [-t nat] -A POSTROUTING -o ethX2 -p tcp -j SNAT \
 >           --to $ADDRESS_OF_OUTGOING_INTERFACE

I don't see how this can be done, though, since this rule must only be 
applied to local machines. So, it seems to be that the source address is 
definately required.... No?

Thanks for helping me figure all this out.


Dave


