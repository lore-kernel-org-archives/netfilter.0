From: "per j" <perj8@hotmail.com>
Subject: ipt_recent 0.2.3/0.2.7 --rttl still doesn't work
Date: Sat, 22 Feb 2003 09:53:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F1152nIAu1pzLEwbHzv0002d362@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfrost@snowman.net
Cc: netfilter@lists.netfilter.org

Have you got any luck fixing the --rttl bug?   It's already been a couple 
weeks since the last post.  I tried to go around this problem with no 
success.  I don't want to put all my rules into one chain, the INPUT chain, 
to get it to work and prefer separate chains to make my firewall rules 
easier to maintain.  Apparently --rttl doesn't work when --set is on a 
different chain on the filter table.  That's the problem.

I changed the name of the recentDropBox chain to recentDrop.  Everything 
else is the same and it still doesn't match TTL.  The --rttl rule never 
matches according to the packet counter.  I tested with another internet 
connection by telnet to port 137 on the Linux box running the --rttl rule 
and --rttl never matches, only the --update rule immediately following it 
matched.

I can send you my entire iptables rule set for inspection if you want, it's 
too long to list here.

Here is a very brief section of my iptables that uses or possibly affects -m 
recent...
iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1 -s ! $EXTIF -d ! 
$INTRANET
iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1 -s $EXTIF -p tcp -m 
multiport --dports $forwardedPorts

Default FORWARD policy is DROP
# Catch bad guys (PROBLEM: no match when I tested it)
iptables -A FORWARD -j DROP -m recent --update --rttl --name recentDropBox
# Catch bad guys
iptables -A FORWARD -j DROP -m recent --update --name recentDropBox
# The rest of the FOWARD chain is ACCEPT whatever that need be.

Default INPUT policy is DROP
iptables -A INPUT -j ACCEPT -i lo
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
# Catch bad guys (PROBLEM: --rttl no match when I tested it with same 
connection and no spoofing)
iptables -A INPUT -j DROP -m recent --update --rttl --name recentDropBox
# Catch bad guys
iptables -A INPUT -j DROP -m recent --update --name recentDropBox
# Blocklist
iptables -A INPUT -j dropList
# the rest of the rules that ACCEPT or LOG
# Last rule in INPUT chain.
iptables -A INPUT -j recentDrop

### dropList chain identifies ports that should be blocked
iptables -A dropList -j recentDrop -p tcp -m multiport --dports $blocklist

### recentDrop chain records and drops the bad guy
iptables -A recentDrop -j LOG -m limit --log-prefix recentDrop
iptables -A recentDrop -j DROP -m recent --set --name recentDropBox

Using kernel 2.4.20-openmosix-superfreeswan-lvm and latest patch-o-matic and 
userspace CVS from Jan'03 update release.  Additional patch ipt_recent 0.2.7 
from your site at around the same time I downloaded the netfilter CVS.  As 
far as I can tell both 0.2.3 and 0.2.7 have the same --rttl problem.


>From: Stephen Frost <sfrost@snowman.net>
>To: per j <perj8@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: ipt_recent 0.2.3/0.2.7 --rttl doesn't work
>Date: Tue, 4 Feb 2003 21:53:46 -0500
>
> > Here are the rules in my iptables 1.2.7a:
> > INPUT chain (default DROP):
> > -j ACCEPT -i ppp0 --state ESTABLISHED,RELATED
> > -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
> > -j LOG -i ppp0 --log-prefix recentDropBox -m limit
> > -j DROP -i ppp0 -m recent --set --name recentDropBox
>
>   First you might try adding --rttl to the --set line.  I'll also go
>   back and check my code in that area...  Using the latest ipt_recent,
>   can you paste what you see in /proc/net/ipt_recent/recentDropBox?
>
>   There could certainly be a problem in that area as the TTL match has
>   been tested less...
>
>   	Stephen
><< attach3 >>


_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*.  
http://join.msn.com/?page=features/virus


