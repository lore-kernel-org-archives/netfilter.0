From: cc <cc@kdtc.net>
Subject: bridge/firewall example
Date: Thu, 02 Jan 2003 10:03:27 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E139DEF.80009@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Group <netfilter@lists.netfilter.org>

Hi,

This is my first time posting to this ML.  First, I want
to wish everyone a very Happy New Year. :)

Next, and quite coincidentially(or not), the first
thread I read was what I wanted to know about, amongst
other things.   Pardon my ignorance and stupidity, I'm
familiar with IPChains, but IPtables is a little tad
bit more complicated so some of my questions might
sound a tad bit..um.. stupid.

But just for clarification,  I'm using 2.4.20 (Slackware)
and using IPTABLES(probably redundant info).  I'm not
entirely familiar with the 2.4.x kernel system. (I'm
more or less familiar with the 2.2. version, but I figured
with a new system, I might as well try the newest stable
kernels.)


I currently have a LAN behind a router that's using
dynamic IP.  But within the next few days, we'll
be setting up a fixed IP (while still using the
dynamic one in parallel for backup for now).

I'm thinking of setting up a system to be the router/firewall for
the fixed IP until the dynamic IP plan expires. AFter that, I'll
remove the router functionality from the system and use it as
a strict firewall.  Can someone tell me whether or not this is
a good idea?

With bridging in place (according to the "Doing Bridge with firewall"
thread), the router's internal IP should belong to the same network
as the LAN, right?  Then the firewalling functionality of the bridge
system will still work?  (I too was a little confused on the issue
of bridging vs. NATing).

Is it necessary to even set up a bridge for the firewall system?

Also, just as an aside, I've setup a 'temporary test' setup where
this firewall system is within the LAN but hooked up to a test
machine whereby this test machine's IP is different from the
rest of the LAN (as follows:)

     test machine IP = 192.168.10.1
     firewall 'internal' IP  = 192.168.10.2    (eth0)
     firewall 'external' IP  = 192.168.11.120  (eth1 )
            (the LAN's network is 192.168.11.0)

     So far, with the following command:
#
# also including the necessary flushing of the iptables
#
/usr/sbin/iptables -A FORWARD -i eth0 -o eth1 -j MASQUERADE

   I can surf the web and check email, but I can't log in to the
LAN's network (Novell-based).   Now I realize that this might
defeat the functionality of the firewall, but is there a way
to allow Novell-packets through the firewall?  (It is only
temporary.  The real firewall won't allow Novell IPX packets
going through..)


Any clarifications appreciated.

Edmund



