From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Network mapping from internal and external
Date: Mon, 04 Oct 2004 06:38:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096886292.2069.12.camel@localhost>
References: <200410040342.i943gOqM012108@ylpvm15.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410040342.i943gOqM012108@ylpvm15.prodigy.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: ggerard@mac.com
Cc: netfilter@lists.netfilter.org

On Sun, 2004-10-03 at 23:42, Gregory Gerard wrote:
> I'm not sure how to describe my setup and intended network in iptables
> parlance. Have searched much and can't find anything that matches my
> situation.
> 
>  
> 
> I have 5 static IPs from my ISP. Out the Ethernet end of my DSL box I see
> those 5 IPs directly. I have no control over the router but that's fine.
> 
>  
> 
> I have many more than 5 machines in my network.
> 
>  
> 
> Internally, I have 10.9.x.x (255.255.0.0).
> 
>  
> 
> I would like to setup iptables such that 4 of the external IP addresses map
> completely map onto exactly 4 internal IP addresses. The fifth external
> address will simply be used to NAT for internal only machines.
> 
>  
> 
> What's the right mix of NICs and settings?
> 
>  
> 
> I was thinking about bringing up several eth0:1..4 interfaces to accept
> those 4 external addresses and map them that way.
<snip>
It's reasonably straightforward to accomplish this.  The ISCS project
will do all of this automatically for you -- map the addresses exactly
as you describe and take care of binding the needed addresses addresses
to the NICs (http://iscs.sourceforge.net).  The fully functioning code
has not yet been released but enough of it is there to split out the
rules.

However, if all you have is a single device, you're probably better off
setting it up manually.  The rule order will be important.  I assume you
know which internal addresses you want assigned to the four public
addresses.

You can create an SNAT/DNAT pair for each

iptables -t nat -A PREROUTING -d $PUBIP1 -i $PUBIF -j DNAT
--to-destination $INTIP1
iptables -t nat -A POSTROUTING -s $INTIP1 -o $PUBIF -j SNAT --to-source
$PUBIP1

Then, create another rule for the rest of the protected addresses which
is evaluated after all the other rules which will NAPT them all to a
single public IP address:

iptables -t nat -A POSTROUTING -o $PUBIF -j SNAT --to-source $MAINPUBIP

Then, to enable the public interface to respond to all the ARP requests,
bind the additional addresses to them:

ip address add <PUBIP1>/<MASK LENGTH> dev <PUBIF> brd +

for each public IP.

I think that will do it for you.  Good luck - John
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


