From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Wed, 1 Dec 2004 20:53:55 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412012017260.22471-100000@gollum.grajagan.net>
References: <1101960745.22517.31.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101960745.22517.31.camel@hubcap.ljm.dom>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 1 Dec 2004 at 23:12 -0500, Jason Opperisano wrote:

JO> On Wed, 2004-12-01 at 23:00, Helge Weissig wrote:
JO> > hmm... how does a packet know it needs to go from my external NIC to my 
JO> > internal NIC if it comes through ESP? Maybe I am confused here... 
JO> 
JO> state tracking.  in a VPN client -> VPN server scenario the esp packets
JO> are *always* initiated from the client side:

my tcpdump on the external interface shows me packets coming on ESP from 
the server every ten seconds.

JO> 
JO>   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
JO>   iptables -A FORWARD -i $INSIDE_IF -p 50 -j ACCEPT
JO> 
JO>   iptables -t nat -A POSTROUTING -o $OUTSIDE_IF -j MASQUERADE
JO> 
JO> that's it...
JO> 
JO> > let's leave the VPN client/server out of the picture to simplify. If I 
JO> > send an ESP packet from somewhere to my external IP address I get the 
JO> > "protocol 50 unreachable" ICMP response. The underlying problem seems to 
JO> > be the primary cause of my troubles, no?
JO> 
JO> um--no.  i have run pretty much every single VPN client/server
JO> combination in existence, and have never even thought of testing it by
JO> sending unsolicited IP Protocol 50 packets through a firewall to the VPN
JO> client behind it.  it's the most flawed troubleshooting technique i've
JO> heard in quite some time...save yourself some time and give up on it.

can you be more specific about why you would not expect ESP forwarding to 
work without an IPsec tunnel in place? I am really trying to understand 
this since most suggestions (including the ipchains rules in the netfilter 
documentation) include some FORWARD rules for ip/50.

JO> to troubleshoot VPN client/server connection problems--use the debug
JO> logs on either side.  use tcpdump.  do both the client and server agree
JO> that both Phase 1 and Phase 2 key exchanges complete?  is there a
JO> routing problem on either side of the tunnel?  are packets successfully
JO> encrypted and sent from the client?  successfully received and decrypted
JO> by the server?  where do they go from there?  do the replies get
JO> encrypted and sent back from the server?  received and decrypted by the
JO> client?
JO>
JO> debug at each link in the chain--don't poke at the chain from afar.

the server and client think that the tunnel is established. 

I changed my iptables script to the following now to get some logging 
information, but I think I may need help with it:

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p 50 -j LOG --log-level info \
  --log-prefix 'esp fwd: '
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p 50 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p 50 -i $EXTIF -j LOG --log-level info \
  --log-prefix 'esp route: '
$IPTABLES -A PREROUTING -t nat -p 50 -i $EXTIF -j DNAT \
  --to-destination $VPN_CLIENT

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
  --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG --log-level info --log-prefix 'dropped: '
$IPTABLES -A FORWARD -j DROP

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j LOG --log-level info \
  --log-prefix 'masq: '
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Basically, I only ever see log entries from the postrouting chain. I also 
do not see ESP packets going from INTIF to EXTIF contrary to what I 
thought. So with the VPN "up" (how do I check for encryption for example) 
and packets coming in from the server, they don't get to INTIF. Pinging a 
host on VPN shows ESP packets getting to INTIF but no further. If I ping 
the server itself from the VPN client, i.e. not through the tunnel, all 
three interfaces report outgoing and incoming traffic.

thanks for your input so far.

h.


