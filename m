From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: protocol 50 unreachable
Date: Wed, 01 Dec 2004 23:03:01 -0500
Message-ID: <1101960180.2025.116.camel@localhost>
References: <Pine.LNX.4.44.0412011448020.18751-100000@gollum.grajagan.net>
	<1101947339.22517.9.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101947339.22517.9.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2004-12-01 at 19:29, Jason Opperisano wrote:
> On Wed, 2004-12-01 at 17:51, Helge Weissig wrote: 
> <snip>
> > Here is my current iptables configuration
> > 
> > $IPTABLES -P INPUT ACCEPT
> > $IPTABLES -F INPUT 
> > $IPTABLES -P OUTPUT ACCEPT
> > $IPTABLES -F OUTPUT 
> > $IPTABLES -P FORWARD DROP
> > $IPTABLES -F FORWARD 
> > $IPTABLES -t nat -F
> > 
> > echo "Enabling PORTFW Redirection on the external LAN.."
> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p esp -j ACCEPT
> > $IPTABLES -A PREROUTING -t nat -d $VPN_SERVER -p esp -j DNAT \
> >  --to-destination $VPN_CLIENT
> 
> what on earth is that rule supposed to accomplish?  it's says "any esp
> packet destined for $VPN_SERVER should be destination translated to
> $VPN_CLIENT."
> 
> if this is the firewall in front of $VPN_CLIENT (which it sounds like it
> is), you have created (for lack of a better term) a packet reflector. 
> any esp packet sent from VPN client to VPN server will be spit back at
> the VPN client.
> 
> > echo "   FWD: Allow all connections OUT and only existing and related
> > ones IN"
> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
> >  --state ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> > $IPTABLES -A FORWARD -j LOG
> > 
> > echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
> > $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> > 
> > here is the tcpdump info I see on $EXTIF:
> > 
> > 10:23:09.234937 (vpn server ip) > (my ip): ESP(spi=0x00000000,seq=0x0)
> > 10:23:09.235055 (my ip) > (vpn server ip): icmp: (my ip) protocol 50
> > unreachable [tos 0xc0]
> > 
> > (these are empty packets sent by nmap but it looks the same for legit
> > ones coming from the vpn server ip). FWIW, when the ipsec tunnel is
> > established and I try to ping the a host behind the vpn server, I see
> > the outgoing packets on all three interfaces, but not response.
> > 
> > thanks for any information or pointers in advance!
> > h.
> 
> simplify:
> 
>   # start fresh
>   for t in mangle nat filter; do
>     iptables -t $t -F
>     iptables -t $t -X
>     iptables -t $t -Z
>   done
>   for c in INPUT FORWARD OUTPUT; do
>     iptables -P $c ACCEPT
>   done
> 
>   # hide-nat outbound traffic
>   iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> 
>   # ip forwarding
>   sysctl -w net.ipv4.ip_forward=1
> 
> try and connect with your VPN client to your VPN server with that
> script.  if you can't connect--it's more likely an IPSec configuration
> detail that your missing.
<snip>
I don't think this is quite right, Jason.  It is possible that the other
side of the tunnel will need to initiate traffic once the tunnel is
established.  Thus, there may be inbound packets on ip/50 that are not
associated with any entry in the connection tracking table.  Thus he
does need the specific port forwarding DNAT rule.

I believe you are correct that he does need to qualify the interface,
i.e., the DNAT rule should only apply to traffic where -i $EXTIF lest he
have the reflector effect.  In fact, I'm surprised that he saw the ESP
pings going through.  I would have thought they would have been
reflected.  Nonetheless, Helge, you should qualify the interface.  See
if that helps.

If that doesn't work, I would suggest placing log rules at strategic
points in the rule set to find out what the packet looks like just
before the -p esp -j ACCEPT rule to find out why it doesn't match.  I
assume this is not the entire rule set, e.g., somewhere I would imagine
you change the INPUT and OUTPUT policies to DROP.

Is there any chance that one of the variables is set incorrectly, e.g.,
$VPN_CLIENT or $VPN_SERVER?
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


