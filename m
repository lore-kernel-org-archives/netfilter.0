From: Cygnus - Flirttown Coder <cygnus@talker.com>
Subject: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 13:27:44 +0000 (UTC)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0207051257520.5181-100000@grabak.talker.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


Scenario:
X number of clients (with 1 or more ips bound to a box)
behind Cisco Catalysts, behind Cisco 3600, behind Internet

Problem:
We want to move clients off our non-portable IP range and onto our arin
range.

I was thinking of setting up a linux box with iptables (call it
'forwarder'), and pointing the old ips, inbound, to 'forwarder' on the
cisco 3600 (forwarder is not a pass-through, just a box hanging off a
switch port), then using iptables to forward each old ip to the new
one.

1. Is there a better or easier way to do this?
2. Is there a way to get the forwarder to route the old
   ips to the client even if, especially if, they haven't changed them
   yet? i.e. say the client has an old ip of x.x.x.x and is moving to a
   new one of y.y.y.y, the forwarder would say, ok, traffic for x.x.x.x
   send to x.x.x.x AND y.y.y.y (because the forwarder doesn't know if the
   ip has moved yet). Maybe i'm overcomplicating it?
3. iptable rules to do this?
4. will outbound traffic from the new ipcs need to go through 'forwarder',
   or do programs not care if they receive answers from ips other than the
   one they sent them too?
5. any other caveats?

Thanx for the help,

-Tony



