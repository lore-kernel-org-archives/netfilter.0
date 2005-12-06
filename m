From: Fred Weston <fweston@gmail.com>
Subject: Implementing a captive portal with iptables
Date: Tue, 6 Dec 2005 01:45:26 -0500
Message-ID: <59038a50512052245m143f8400x55a8ce0dc7b4cf60@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello all,

I apologize if this topic has been covered previously, I used google
sitesearch to check the archives but didn't see anything quite like
what I need.  I'm trying to create a captive portal for use with
wireless networks in hotels.  Very similar to NoCat, except the user
must make a credit card payment in order to use the Internet
connection.

Please forgive any errors as I'm relatively new to packet filtering.=20
I'm running linux 2.6 on a box with two NICs, one connected to the
Internet (eth1) and one to the wireless lan (eth0, 172.16.0.0/16).=20
I'm using masquerading to nat traffic from the lan to the Internet,
and I've set a deny rule on the FORWARD chain which drops all packets
from 172.16.0.0/16 like so:

iptables -A FORWARD -s 172.16.0.0/16 -j DROP

This effectively prevents LAN clients from being NAT'ed, and thus they
cannot access the Internet, which is what I want.  I've also set some
other rules in the FORWARD chain which allow access to Paypal's
various URLs.  These appear before the deny rule in the forward chain,
so it permits clients to access Paypal's web page, but nothing else.

When a client connects, they get a DHCP lease from my box which
assigns my lan IP as their dns and gateway.  I'm using a redirect rule
that redirects all traffic coming in eth0 bound for port 80 to my
local port 8080 where I have apache running.  So when a user opens
their browser, they see my page which has a button they can click to
go to Paypal's payment page.  The script they land at finds their MAC
address by looking at the local ARP table, and includes it in the post
to Paypal.  Once they've paid, Paypal sends an IPN post back to my
server containing the client MAC address, which in turn is parsed by a
PHP script that will eventually change some iptables rules to allow
the client access to the Internet based on their MAC address.

Everything up to this point works, however I have some problems that I
can't seem to work out.  When I receive the post from Paypal and want
to allow the client access through the firewall out to the Internet,
how should I go about doing that?  I assume I can insert a rule in the
forward chain that says allow forwarding for "a:b:c:1:2:3"  mac
address.  That's well and good, however I still have the redirect rule
that redirects all port 80 traffic to the local web server.  I can't
turn that rule off, because then I wouldn't be able to capture the
user's initial web request.  I also can't seem to figure out how to
tell iptables to redirect everything *but* packets from a specific MAC
address.  Is this possible?  The Paypal pages are not redirected
because they use https (port 443), but if I ever wanted to change to a
non-ssl payment page, they users would get caught in a redirection
loop back to the local web server.

Sorry for the length, but I felt it was necessary so you can get an
idea of what I'm trying to do.  Any advice is greatly appreciated!

Thanks,
Fred

