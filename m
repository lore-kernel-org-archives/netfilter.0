From: Christian Weber <Weber@InfoTech.de>
Subject: Packets get dropped
Date: Fri, 04 Jun 2004 23:20:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C0E7BB.2010308@InfoTech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="johab"; format="flowed"
To: netfilter@lists.netfilter.org

Dear list=B4s members,

we recently found tcp packets to get dropped an a machine
behind a firewall with only 1 physical nic doing 'Y' routing
between IPSEC tunnel an LAN.

The machine is located in a dmz but was granted to be the end
of a (2.6.5 kernel ipsec) tunnel. The ipsec interface is unvisible.

The sole connection to any other relevant host goes to a firewall
the box is connected with.

We want to pass packets from <remote_net> to <local_net> through
the tunnel, as if they came from from the y-router itself.

So we configured:
# iptables -I FORWARD -s <remote_net> -d <local_net> -j ACCEPT
# iptables -I FORWARD -d <remote_net> -s <local_net> -j ACCEPT
# iptables -P FORWARD DROP  ; # REJECT does not work here ..

# echo "1" > /proc/sys/net/ipv4/ip_forward
# iptables -t nat -I POSTROUTING -s <remote_net> -j MASQUERADE

Trying some ssh to a machine (let=B4s call it "dest") located in local_ne=
t
fails. The SYN goes through, leaves the <-router=B4s interface, gets answ=
ered
(ACK from dest) comes in and ... is being dropped without a trace.

There is an entry in the conntrack table:
tcp      6 25 SYN_RECV src=3Dxx.xx.xx.111 dst=3D192.168.250.228 sport=3D1=
714 dport=3D22
	src=3D192.168.250.228 dst=3Dyy.yy.yy.5 sport=3D22 dport=3D1714 use=3D1

The answered packet (SYN ACK) came from 192.168.250.228:22 (according to =
tcpdump)
and was destined to yy.yy.yy.5:1714

In some list we found a hint according masquerading problems with ipsec. =
The
possible solution presented there was to add (and we tried):

# iptables -t nat -I POSTROUTING -p 50 -j ACCEPT

That cound avoid confusion, but that didn=B4t help.

Any help appreciated.

---

BTW: on another machine (same hardware but two nic=B4s) with same config =
(but the nic
and tunnel adresses) and the same kernel, there is no problem when really=
 routing
through the machine, i.e. when the packet comes throuh the ipsec tunnel w=
hich is
connected over the outer interface, is masqueraded and emiited through th=
e inner
interface, aswered by dest and send back....

Any idea?

---

Oh, one more question - just for understandig the system a bit better (si=
nce i couldn=B4t
find the answer in any howto i read) .

How is the incoming packet picked up when it comes in. When it comes in i=
t gets examined
by the kernel. OK so far. Who looks up the conntrack table if it matches =
an associated
connection and rewrites the headers if it does match - performing the rev=
erse nat of
masquerading?

Thanks in advance
--=20
Christian Weber
mailto:Weber@InfoTech.de    Tel: 02361/91300
For information on InfoTech visit http://www.InfoTech.de/


