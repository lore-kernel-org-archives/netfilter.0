From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Wed, 1 Dec 2004 19:29:19 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412011924220.22471-100000@gollum.grajagan.net>
References: <1101947339.22517.9.camel@hubcap.ljm.dom>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 1 Dec 2004 at 19:29 -0500, netfilter-bounces@lists.netfilter.org wrote:

JO> On Wed, 2004-12-01 at 17:51, Helge Weissig wrote: 
JO> <snip>
JO> > Here is my current iptables configuration
JO> > 
JO> > $IPTABLES -P INPUT ACCEPT
JO> > $IPTABLES -F INPUT 
JO> > $IPTABLES -P OUTPUT ACCEPT
JO> > $IPTABLES -F OUTPUT 
JO> > $IPTABLES -P FORWARD DROP
JO> > $IPTABLES -F FORWARD 
JO> > $IPTABLES -t nat -F
JO> > 
JO> > echo "Enabling PORTFW Redirection on the external LAN.."
JO> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p esp -j ACCEPT
JO> > $IPTABLES -A PREROUTING -t nat -d $VPN_SERVER -p esp -j DNAT \
JO> >  --to-destination $VPN_CLIENT
JO> 
JO> what on earth is that rule supposed to accomplish?  it's says "any esp
JO> packet destined for $VPN_SERVER should be destination translated to
JO> $VPN_CLIENT."
[snip]

my bad... when I obfuscated my script, I should have used "$EXT_IP" or 
something like it. That IP and the VPN server's are very similar.

[snip]
JO> simplify:
JO> 
JO>   # start fresh
JO>   for t in mangle nat filter; do
JO>     iptables -t $t -F
JO>     iptables -t $t -X
JO>     iptables -t $t -Z
JO>   done
JO>   for c in INPUT FORWARD OUTPUT; do
JO>     iptables -P $c ACCEPT
JO>   done
JO> 
JO>   # hide-nat outbound traffic
JO>   iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
JO> 
JO>   # ip forwarding
JO>   sysctl -w net.ipv4.ip_forward=1
JO> 
JO> try and connect with your VPN client to your VPN server with that
JO> script.  if you can't connect--it's more likely an IPSec configuration
JO> detail that your missing.

no such luck :(. I should note that the VPN connections works fine when I 
hook the client up directly to my DSL line. btw - it looks like your 
script does not forward anything from one of my interfaces to the other.

cheers,
h.


