From: David Williamson <nospam1@nullcutter.com>
Subject: newbie question - what is the iptables equivalent of a Linksys
	"DMZ" ?
Date: Sat, 13 Nov 2004 19:42:35 -0500
Message-ID: <1100392955.4894.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

I'm brand new at this but have managed to get my Ubuntu Debian box
routing for my home LAN.  The point for me was to replace my little blue
Linksys router, and it's working fine so far.  About all I had to do was
apt-get install ipmasq and dnsmasq.  

There's a feature on the Linksys box, however, that I can't figure out
how to implement, because I don't know how it worked on the Linksys box,
and that is the DMZ function.  When a machine behind the router was
going to serve as a, for example, game server (like Unreal Tournament
2004), the only way I could get it to work was to put that particular IP
on the DMZ, which, I gather, meant that it looked like it was right on
the net, unprotected, unrouted, unmasqed, et cetera.  

Since I'm trying to understand what the Linksys box did and give the new
router box the same abilities, it would help if I knew what the heck
that feature was really called, and/or how to implement that in
iptables. 

Looking through the archives I see a lot of Linksys-related questions;
please forgive yet another one.

david williamson


