From: <user01@vrwg.net>
Subject: connection tracking + DNAT + ip-change ... BOOM :)
Date: Sun, 02 Jun 2002 22:58:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFA86FF.3474B14F@hyde.vege>
Reply-To: <user01@vrwg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


good evening !

currently i'm trying to set up a ipip-tunnel via two dialup-router.
setup as follws:

host1 -- (DMZ) -- router1 -- (INTERNET-CLOUD) -- router2 -- (DMZ) -- host2

between host1 and host2 i've established the ipip-tunnel. both routers
are set up this way:

"iptables -t nat -A PREROUTING -i eth1 -p ipencap -j DNAT --to-destination
IP_OF_INTERNAL_HOST"
"iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE"

both client's tunnel are set up like this

"ip tun a test mode ipip remote EXTERNAL_IP_OF_REMOTE_ROUTER local MY_LOCAL_IP
dev eth0"
(EXTERNAL_IP_OF_REMOTE_ROUTER refers to the router on the other side of the
i-net-cloud.)

eth1 is the external interface to the "internet-cloud" on both routers.

as long as both routers external interface-ip's (eth1) don't change everything
is OK.
if the external ip EXTERNAL_IP_OF_REMOTE_ROUTER changes i change the tunnel
with
a small shell-script. the encapsulated packets are immediately sent to the new
destination ip.

BUT: the remote-router (whose external ip has changed) receives the packets,
but does not
DNAT them any more. is refuses to DNAT them as long as theres an entry for the
old tunnel-"connect"/"traffic" in /proc/net/ip_conntrack. if this entry
vanishes the changed tunnel
works as expected :/ (setting the interface down and up again via
"ip set li down dev eth1 ; ip set li up dev eth1"  doesn't chanmge anything.
i've read in one of rusty tutorials that only the MASQUERADE module does
discard the
conntrack entrys if the interface goes down.
now i have questions:
1) removing the conntrack entry should do the job ... so how do i remove
manually entrys
   from the conntrack table ? i've found no documentation on this :(
2) how do i keep DNAT away from connection tracking ??? ALL incoming packets
for my external
   dialup-interface should be DNATted to the internal server. regardless of
any connection state.
   in fact ipip-tunnel don't have any connection state (if i'm not wrong :) )

if you need more details to deploy an idea -> mail me :)  and thank you in
advance !

virtual

