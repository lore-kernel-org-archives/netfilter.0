From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 19:17:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121917.08663.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310121700.13102.Herman@AerospaceSoftware.com> <1066005882.1151.23.camel@valhalla>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066005882.1151.23.camel@valhalla>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org

On Sunday 12 October 2003 6:44 pm, Chris Brenton wrote:

   > Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)

   Hummm. You do realize you are letting through *everything* you are not
   specifically dropping? Looks like you've had quite a bit of traffic
   sneak by. :(

Yep, I opened it up in an effort to figure out what is going on - or rather 
not going on, the really bad stuff is blocked in the INPUT chain and the 
INPUT chain is letting the packets through, since I can play xmms on the 
firewall itself, so the packets get in, but not out the other side.

   > How can the FORWARD chain be empty, since MASQUERADE is working and my
   > laptop can surf the web?

   Because you are letting everything not specifically denied blow through.
OK - it seems that port forwarding uses the nat table - eventually I'll 
understand this I hope...

I I understand it, masquerading also uses the nat table and that is working, 
so why doesn't port forwarding work for port 8002?

Here is the rule:
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 8002 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8002 -j DNAT --to 
192.168.10.245:8002

on the command line it looks like this:
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 8002 -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8002 -j DNAT --to 
192.168.10.245:8002

and it does diddly squat...


   > Why are my new forwarding rules ignored?

   Again, try stuff like this from the command line. If iptables is not
   happy, it will let you know about it.

Tried it with various versions of iptables.  1.2.7a and1.2.9rc1 give either 
Invalid Argument or Target Problem as explained in previous posts.  Iptables 
1.2.5 doesn't give any error messages - I downgraded, since upgrading didn't 
make any diff, so now it doesn't tell me anything although the problem is 
still the same.

It is as if the rules are simply ignored even when I copy and paste examples 
from the howtos or other posts.



   > How can I debug this stuff and see where the packets are going/not
   > going? Can anybody shed light on this?

   The counters are a good indication of what is going on. You can also run
   tcpdump to troubleshoot what goes by.

Trying that now - very trying...

I guess that eventually, I'll understand iptables, but it is going to take a 
while to get there.

Oh, well, what the hell - Catch 22.
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

