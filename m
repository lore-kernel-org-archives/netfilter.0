From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: ftp mark
Date: Mon, 31 May 2004 09:30:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E31A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Krystian <optimusprime@o2.pl>, netfilter@lists.netfilter.org

Krystian wrote:
> hi
>=20
> i have a router/nating box with linux on it. can anybody tell me how
> to mark outgoing ftp active/passive connections ?

If you mark a conntrack with the CONNMARK extension, the RELATED traffic
to that session are also marked. Otherwise, you have to make all RELATED
traffic with a single mark.

The best way to apply marks would be a sub-chain so that you can process
other operations after MARKING them. PS this is from memory so syntax
could be off a bit.

# Ingress marking (mostly for Ingress filters and Policy Routing)
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING -d 0/0 --dport 21 -j MARK --set-mark
0x111
iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

# Egress marking (mostly for QOS operations)
iptables -t mangle -A POSTROUTING -j CONNMARK --restore-mark
iptables -t mangle -A POSTROUTING -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A POSTROUTING -o ${if_inet} --dport 21 -j MARK
--set-mark 0x111
iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark

