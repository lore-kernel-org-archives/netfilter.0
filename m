From: "Peter Hurley" <phurley@charter.net>
Subject: SNMP device replies by alternate address
Date: Wed, 12 Feb 2003 08:20:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2d299$853c0e50$3201a8c0@BEOWULF>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is there an extension target that can be used in the PREROUTING chain of
nat and/or mangle to alter the incoming source ip address? Say something
in the form of...

iptables -t nat -A PREROUTING -i eth1 -m mac --mac-source
xx.xx.xx.xx.xx.xx -j SRC_MANGLE --from_src 192.168.50.17/32

The situation is this:  a SNMP device accepts SNMP requests on two
separate ip addresses.  One ip is fixed and private, the other is
dynamic/unknown.  This device is on the outside of a private network
being SNAT'ed.  The problem is that even though it receives SNMP
requests on the private ip address it replies with the other
dynamic/unknown ip address as the source.

This means that ip_conntrack_core doesn't recognize the reply packet as
belonging to the previous outgoing request.

Matching the reply packet is easy with the mac address which is fixed.
But I can't seem to get past that.  Marking and using iproute2 won't
work since only ip_conntrack* knows the reply path.  Mapping both
request and reply packets onto the same network (say 10.x.x.x) won't
work because the two SNMP addresses aren't simple
reflections/derivatives of each other (e.g., 192.168.50.17 and
xx.xx.72.116).

Perhaps I'm missing something that already exists in the stock
netfilter?

Thanks in advance,

Peter Hurley
imagine XD, inc.
phurley@imaginexd.com


