From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: protocol 50 unreachable
Date: Thu, 02 Dec 2004 00:15:47 -0500
Message-ID: <1101964546.2025.149.camel@localhost>
References: <Pine.LNX.4.44.0412012017260.22471-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412012017260.22471-100000@gollum.grajagan.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Helge Weissig <helgew@grajagan.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2004-12-01 at 23:53, Helge Weissig wrote:
> On Wed, 1 Dec 2004 at 23:12 -0500, Jason Opperisano wrote:
<snip>
> JO> state tracking.  in a VPN client -> VPN server scenario the esp packets
> JO> are *always* initiated from the client side:
I don't believe that is true.  The tunnel is always initiated from the
client side but the traffic in the tunnel can be initiated from the
remote side.
> 
<snip>
> JO> > let's leave the VPN client/server out of the picture to simplify. If I 
> JO> > send an ESP packet from somewhere to my external IP address I get the 
> JO> > "protocol 50 unreachable" ICMP response. The underlying problem seems to 
> JO> > be the primary cause of my troubles, no?
> JO> 
> JO> um--no.  i have run pretty much every single VPN client/server
> JO> combination in existence, and have never even thought of testing it by
> JO> sending unsolicited IP Protocol 50 packets through a firewall to the VPN
> JO> client behind it.  it's the most flawed troubleshooting technique i've
> JO> heard in quite some time...save yourself some time and give up on it.
Why? Helge's methodology is simplifying matters.  He's not testing end
to end connectivity.  He's testing only one small part, viz., will the
NAT gateway properly forward the packet.  It doesn't matter if the
client won't accept it at this stage of testing.
> 
> can you be more specific about why you would not expect ESP forwarding to 
> work without an IPsec tunnel in place? I am really trying to understand 
> this since most suggestions (including the ipchains rules in the netfilter 
> documentation) include some FORWARD rules for ip/50.
It should work.  It won't be a tunnel but you should see the esp packet
pass through the gateway.
> 
<snip>
> I changed my iptables script to the following now to get some logging 
> information, but I think I may need help with it:
> 
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
> 
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p 50 -j LOG --log-level info \
>   --log-prefix 'esp fwd: '
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p 50 -j ACCEPT
> $IPTABLES -A PREROUTING -t nat -p 50 -i $EXTIF -j LOG --log-level info \
>   --log-prefix 'esp route: '
> $IPTABLES -A PREROUTING -t nat -p 50 -i $EXTIF -j DNAT \
>   --to-destination $VPN_CLIENT
> 
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
>   --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG --log-level info --log-prefix 'dropped: '
> $IPTABLES -A FORWARD -j DROP
> 
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j LOG --log-level info \
>   --log-prefix 'masq: '
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> 
> Basically, I only ever see log entries from the postrouting chain. I also 
> do not see ESP packets going from INTIF to EXTIF contrary to what I 
> thought. So with the VPN "up" (how do I check for encryption for example) 
> and packets coming in from the server, they don't get to INTIF. Pinging a 
> host on VPN shows ESP packets getting to INTIF but no further. If I ping 
> the server itself from the VPN client, i.e. not through the tunnel, all 
> three interfaces report outgoing and incoming traffic.
<snip>
Interesting.  You've showed us what you think you have.  Would you
kindly show us what you do have.
Do a 
iptables -v -n -t nat -L
iptables -v -n -L FORWARD
iptables -v -n -L INPUT

If I'm following this correctly, the esp packets should hit your NAT
rule and have the destination changed.  It should then hit the routing
table which will determine that the packet is not local and send it to
the FORWARD chain.  If you are not logging packets on the FORWARD chain,
perhaps the match is wrong.  Try a generic log rule for all packets and
see what the packets look like on the FORWARD chain.  Do they match the
rules dumped in the above list? - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


