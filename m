From: David Williamson <nospam1@nullcutter.com>
Subject: help route private traffic to 10.x.x.x and everything else to the
	'net
Date: Mon, 15 Nov 2004 15:29:49 -0500
Message-ID: <1100550589.5398.26.camel@localhost.localdomain>
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

I've got a debian box with broadband access via ethernet to a wireless
link.  The gateway to the public net is 192.168.0.1, via my box,
192.168.0.2.  I've got Firestarter on it, and everything works.  On
another box, I have access to our private WAN, mostly 10.130.x.x and
172.21.x.x and the like via a Cisco router at 10.130.80.1.  I'd like to
set things up so that any box on our LAN can access the private WAN, and
if it's not on the WAN, the packets go out on the 192.168.0.1 gateway to
the internet.  This way, stuff that's blocked on our WAN (like ftp,
email, jabber) will still work, since they'll have another route to the
'net.

But every time I start trying to write the rule I get lost not long
after "iptables -"  <g>

eth0 is the internet nic, eth1 will be the WAN nic.

iptables -t nat -A PREROUTING  -i eth1 -d 10.0.0.0/255.0.0.0 -j DNAT
--to 10.130.80.1

Is the above anywhere even close to a way to forward packets going to
the 10.x.x.x part of our WAN, to the 10.130.80.1 router?  I assume I'd
follow with another similar rule for 172.21.x.x, and then the 

iptables -A POSTROUTING -o eth0 -j MASQUERADE

to get the remaining packets onto the internet.

Or am I barking up the wrong tree entirely?  Any advice appreciated.

TIA --

<obviously still learning> dave w


