From: Jim Carter <jimc@math.ucla.edu>
Subject: conntrack or nat per interface for duplicate IPs
Date: Fri, 15 Aug 2003 23:23:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308152314170.7272@xena.cft.ca.us>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: bishop@platypus.bc.ca

vtun is a daemon which establishes an IP tunnel through a TCP connection
(among other variants).  It can be used for a VPN, in some ways like
IPSec (FreeS/WAN), though keying and crypto are a lot less intricate. (I
hear the IPSec guys sneering.)  As part of setting up a connection, a
tun/tap device is allocated at each end, IP addresses are determined,
and each end configures its device with a point-to-point link to the
other end.  Routes, if any, are established using the other end's device
IP address as a gateway.

My goal is to set up a server, and multiple clients can connect to it at
once, without individual prearranged addresses being assigned to the
clients.  This means that either the daemon has to be hacked and the
protocol augmented to negotiate the endpoint addresses, or everyone has
to share the same pair of IP addresses.  It's not a problem if all the
server's tunnel devices have the same address (different from its public
IP address), but it *is* a problem for the clients.

I've been corresponding with <bishop@platypus.bc.ca>, one of the
maintainers of vtun.  He remembers seeing a SNAT hack which can deal
with the problem, but neither of us can figure out what it is; nor do
repeated searches on Google reveal anything useful.  Can any of you
help?  More specifically, the server sets up the various connections
like this (as the clients make the connections)

    ifconfig tap0 10.0.0.1 pointopoint 10.0.0.2
    ifconfig tap1 10.0.0.1 pointopoint 10.0.0.2
    ifconfig tap2 10.0.0.1 pointopoint 10.0.0.2
    etc...
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Suppose a packet emerges from tap2 with a source address of 10.0.0.2.
It is NATted so its source address is the server's.  The replies come
back to the server and are de-mangled so the destination becomes
10.0.0.2, but how can it be told to route them down tap2 rather than
tap0 or tap1?  Empirically, it does not make this judgment natively,
picking just one of the taps arbitrarily.

(It's been suggested to run DHCP through the tunnel.  But the problem
is, the DHCP client wants to set up a network config and a default route,
not a point-to-point config.  Also at the server end, the vtun server
daemon will have finished its job before the client's address is known,
and the DHCP server is not in the business of configuring interfaces.
So again there's no way to set up the point-to-point connection.)

(Another suggestion is to use the client's public IP address on the tun/tap
device.  The flies in this ointment are that the clients will often be
behind similarly configured NAT boxes, so the ISP's assigned address is
hard to determine, and 192.168.0.1 will often be assigned to several
clients at once.  Also, the server must not use the ISP's assigned address
on the tun/tap device, because then the packets for the enclosing TCP
connection would be sent down the tunnel, ruining everything.)

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

