From: cc <cc@kdtc.net>
Subject: port 80 redirection
Date: Mon, 11 Aug 2003 18:59:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F377726.7060502@kdtc.net>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi,

I'm not sure if this is OT here, but can
someone comment on the following?  It is
certainly confusing if not convoluted. There's
always a simple solution, but I'm just
curious as to whether or not such a set
up would work.

I have a LAN beheind a NAT'd firewall
with iptables 1.2.8.  Currently,
none of the users are proxied.  How
do I transparently proxy the users,
but with their workstations not
needing any proxy changes?

I had an idea, but don't know if
it's do-able (or even should I even
bother)?

ie.

LAN (port 80) ->
       IN                              OUT
->(80 eth1  ) Firewall          (eth1 8180)
->(8180 eth0) Proxy Machine     (eth0 8181)
->(8181 eth1) Firewall          (80  eth0) -> 'Net

So when a packet comes back, it goes :

'Net (port 80) ->
       IN                             Out
->(80 eth0 in)    Firewall          (eth1 8181)
->(8181 eth0 in)  LAN Proxy         (eth0 8180)
->(8180 eth1 in)  Firewall          (eth1 80) -> LAN

This way, I can transparently proxy the users
and I wouldn't need to fiddle around with their
workstation settings.

Any pointers appreciated.

Edmund








