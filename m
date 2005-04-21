From: "Mark Wells" <markus@wiztech.cc>
Subject: NAT problem when coming from private network
Date: Thu, 21 Apr 2005 20:24:35 -0000 (GMT)
Message-ID: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

 Apologies if this is an RTFM but I have searched and found nothing.

 The problem:

We're doing NAT (DNAT) on our firewall from a valid outside ip to a
machine on our private network which is handling mail. So the rule looks
like this:

/usr/sbin/iptables -t nat -A PREROUTING -i $EXTERNAL -d 72.11.67.10 -p tcp
--destination-port 25 -j DNAT --to-destination 192.168.1.8:25

/usr/sbin/iptables -A FORWARD -p tcp -i $EXTERNAL -d 192.168.1.8 --dport
25 -j ACCEPT

$EXTERNAL being eth1 our  "outside" interface.  There is also a $INTERNAL
which corresponds to eth0 - the interface on out private network.

Pretty standard stuff.

So NAT works great for incoming mail, and we have similar rules for POP3,
IMAP, etc. All works great from outside.

The problem comes when we try to hit the mail server (by going to that
outside ip),  from a machine that's already on the private network. So for
example if I telnet to port 25 on 72.11.67.10 from my personal machine
which is on 192.168.1.34 I get nothing. According to my reading of the
rule, any packets that come from the outside bound for port 25 on the
72.11.67.10 should be NATted to 192.168.1.8. Which they are if they come
from the outside. Why shouldn't it work if packets try to hit port 25 on
72.11.67.10 from the private network then?

I tried something like this(and a few variations) to no avail:
/usr/sbin/iptables -t nat -A PREROUTING -i $INTERNAL -d 72.11.67.10 -p tcp
--destination-port 25 -j DNAT --to-destination 192.168.1.8:25
/usr/sbin/iptables -A FORWARD -p tcp -i $INTERNAL -d 192.168.1.0/24 -j ACCEPT

I also tried commenting out these lines:
/usr/sbin/iptables -A FORWARD -i $EXTERNAL -s 192.168.0.0/16 -j DROP
/usr/sbin/iptables -A INPUT -i $EXTERNAL -s 192.168.0.0/16 -j DROP

Which are the standard lines for blocking packets with spoofed private
network addresses that might show up from the net.

I only did that as a test to see if that was where the packets were
getting hung up(being well aware of the potential security issues
associated with not having these in place). No dice.  I can attach my
complete script if it would help, but it's pretty standard stuff for
masquerading from our private network out, and doing NAT to bring traffic
to selected ports from the net to machines on the inside. Like our mail
server.

Of course I can go directly to the mail server by going  to 192.168.1.8
and that works just fine, but that's beside the point.

The problem is, we have guys here with laptops, and they need to be able
to hit mail.gotvoice.com by name from both outside and inside. We got a
bunch of other services here that people get to by name as well.

We could just run a seperate DNS server internally to resolve the names to
private addresses, but we really don't want to get into running two
seperate DNS setups, when this should be a simple fix on the firewall.

Any ideas?

Appreciated as always,

Mark

