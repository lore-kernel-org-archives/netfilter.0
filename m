From: "Evan Borgstrom" <evan@unixpimps.org>
Subject: Strange setup
Date: Sun, 19 Jan 2003 16:35:59 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've got sort of a strange setup that I'm looking to accomplish some
strange async routing. I know how I want to accomplish it and am pretty
sure that I can do it with netfilter but just can't seem to find the
proper way.

Here's the rundown on the network setup:

[ LAN ] --
[ DMZ ] -- [ Firewall/Router ] -- [ WAN ]
                    |
                    |
                 [ WLAN ]


The WLAN is between myself and a couple of other people in my building to
provide redundant paths out of each of our networks and is working
beautifully. We all advertise (via BGP) blocks close to us to each to
provide the shortest path as well.

Comming from the WAN I have a /29 routed to the DMZ which services a
number of machines that provide different services.

The firewall/router is a linux box that is running iptables.


Now the problem:
Because of the advertisments comming over the WLAN I now have about 40
routes in the kernel routing table. Most of them are not very specific
since we advertise our ISP's blocks to each other, so I have routes for
/16's, /21's, etc... What happens is when someone that resides in one of
these blocks that I'm getting advertisements for tries to access an
address in my /29 their return path follows the advertisment over the
WLAN.

Using the iproute2 package I've created a second routing table with a
single default route out my WAN default route. I'm hopping that there's a
way to tag the connection in the conntrack table and then -j MARK it when
a related,established packet comes back so that I use the iproute2 package
to specify that the second routing table will be used.

Anyone know of a way that I can accomplish this?

Thanks in advance,
Evan

-- 
Evan Borgstrom <evan@unixpimps.org>
http://www.unixpimps.org - SIG:ILL



