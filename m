From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Odd kernel panic error, IPtables and pptp patch
Date: Sun, 10 Apr 2005 02:23:16 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A6D@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hello,=20

I've been running into a kernel panic error under a very odd condition.
Here is the kernel panic message, which is just a single line at
console.

/upv4/xfrm4_output.c:108 spin_lock /net/sfrm/xfrm_state.c:dfebba14
already locked by net/ipv4/sfrm4_output.c/108.

I patched the kernel with pptp-conntrack and everything seemed to work
fine on one of the development boxes.  I moved it to one of the
production boxes and it also worked fine (a box which has about 1000
entries in it's iptables-restore file). =20

I built a clean box, upgraded the kernel and iptables using an RPM file
that I created (the same one used against the other two servers) and it
appeared to work fine. =20

The next thing that I did was install Openswan onto the server.  I
configured it and established a connection with a remote network for
about a day to make sure it was working well.  Traffic can pass from the
firewall to the remote network just fine.  So tonight I added the rule
"-A RH-Firewall-1-INPUT -s 10.0.13.0/24 -j ACCEPT" to the list and
figured we should be routing traffic now.  But as the Openswan manual
states we need to prevent esp traffic from being routed via NAT so we
take care of that.=20

About 15 seconds after doing this I received the above kernel panic
message.  No additional information.

So I did the next thing that Openswan suggests which is to mark traffic
coming in via PREROUTING and filter based on that. So I put the rule "-A
RH-Firewall-1-INPUT -m mark --mark 1 -j ACCEPT" instead of the earlier
one and about 10-15 seconds after reloading the rules I get a kernel
panic.

Now here is the real key.  The kernel panic only happens with both the
rules above are loaded AND the ipsec daemon has a valid connection to
the remote server.  The other thing to note, which I don't know if this
has anything to with it is the remote server is on the same external
subnet (88.44.55.65 for the remote server, 88.44.55.66 for the server
with the problem and 88.44.55.64 as the gateway between them).  Each of
these machines have there own segregated internal infrastructure.

Any ideas?

*mangle
:PREROUTING ACCEPT [975249:158566266]
:INPUT ACCEPT [975240:158565906]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [1158936:1093718162]
:POSTROUTING ACCEPT [1158936:1094238501]
-A PREROUTING -i eth0 -p ipv6-crypt -j MARK --set-mark 0x1
COMMIT

*nat
:PREROUTING ACCEPT [45249:2396838]
:POSTROUTING ACCEPT [4927:519564]
:OUTPUT ACCEPT [4927:519024]
-A POSTROUTING -o eth0 -p ! esp -j SNAT --to-source 88.44.55.66
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -i eth1 -j ACCEPT
#-A RH-Firewall-1-INPUT -s 88.44.55.66/28 -j ACCEPT
#-A RH-Firewall-1-INPUT -s 10.0.13.0/24 -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
#-A RH-Firewall-1-INPUT -m mark --mark 1 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 110 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 143 -j
ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT
