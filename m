From: Terry Hancock <hancock@anansispaceworks.com>
Subject: Weird routing problem?
Date: Wed, 1 Dec 2004 04:18:41 -0600
Message-ID: <200412010418.41288.hancock@anansispaceworks.com>
Reply-To: hancock@anansispaceworks.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,
I have set up a Debian Woody system as a dialup gateway
system using iptables. This mostly works, but for a fairly
large number of internet sites, I get hang-ups when trying
to access them from the client machines on my LAN. (Not sure
about the statistics, but it's enough that it could be, for
example, any site runnning IIS or some other lesser-used HTTP server).

For example, if I use a simple console web-browser like
w3m, I can access:

w3m http://www.poalo.com

from the console of my router, BUT the same command from
the console of a client machine on the LAN results in no
reply!  Further investigation by telnetting to port 80 on
that server shows me that I can send an HTTP "GET" command,
and get a response from the router console, but no response
comes on the client machine.

I first noticed this with just the one site above, so I
spoke to their support, and after much run-around, got the
answer that their logs didn't show anything unusual when I
accessed their site. So I'm assuming that a response was
sent, but my router dropped it for some reason.

Unfortunately, I have no idea why it would do that, and I
don't know what to do to troubleshoot.

Now, I have extremely simple iptables rules on the router:

% iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source            destination
DROP       all  --  anywhere          anywhere          state INVALID,NEW

Chain FORWARD (policy ACCEPT)
target     prot opt source            destination
DROP       all  --  anywhere          anywhere          state INVALID,NEW

Chain OUTPUT (policy ACCEPT)
target     prot opt source            destination
%

and even when the firewall rules are "wide-open" I still
see this problem.  The masquerading is setup via the following
script:

# Bring networks down and up to make sure connections are working
# correctly (the ethernet card doesn't register on startup for
# unknown reasons).
ifdown -a
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -F INPUT
iptables -F FORWARD
iptables -A INPUT -i ppp0 -m state --state NEW,INVALID -j DROP
iptables -A FORWARD -i ppp0 -m state --state NEW,INVALID -j DROP
ifup -a
echo 1 > /proc/sys/net/ipv4/ip_forward

# Dial-in to my local ISP
wvdial --chat Cleburne
#

which is virtually verbatum from the NAT HOWTO, IIRC.

Why would this system be dropping packets?
   Maybe the packets are malformed somehow?
   "Fragments"?

Why only from certain web servers?
   e.g.:
   http://www.tera-byte.com
   http://www.poalo.com
   http://www.paypal.com

How can I verify what is and is not being dropped?

Some details:

Gateway is a Debian Woody (=3.0) system with the Linux 2.4.18-bf2.4
stock kernel, running on a laptop with ethernet and modem installed
via PCMCIA cards.

On the dialup gateway:
% route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
thing.spyderinc *               255.255.255.255 UH    0      0        0 ppp0
192.168.71.0    *               255.255.255.0   U     0      0        0 eth0
default         thing.spyderinc 0.0.0.0         UG    0      0        0 ppp0
%

On the client machine on the LAN:
samwise:/# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
localnet        *               255.255.255.0   U     0      0        0 eth0
default         deagol          0.0.0.0         UG    0      0        0 eth0
samwise:/#

Like I said, it's a relatively small number of sites that tickle
this bug, but some of them are sites I very much need to be able
to use.  These sites worked fine from the same client machine
when I was connected via a firewall appliance to a fixed-IP
DSL service and I've tested the same sites with w3m on both
the client machine and the gateway console. So, I'm pretty
confident it's not a browser problem.

Any advice on how to proceed would be greatly appreciated, thanks!
Terry

--
Terry Hancock ( hancock at anansispaceworks.com )
Anansi Spaceworks  http://www.anansispaceworks.com


