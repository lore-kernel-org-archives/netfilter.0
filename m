From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 14:48:16 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E361@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, netfilter@lists.netfilter.org
Cc: dravya@magma.ca

Eric Leblond wrote:
> On Thu, 2004-08-26 at 23:26, Jason Opperisano wrote:
>>> I have been trying various set of rules in various table in order
>>> to have packets go over the right link. ie. packet's src add should
>>> match outgoing link's ip address.YET, there iptables -t mangle -A
>>> PREROUTING -j CONNMARK --restore-mark=20
>>> iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
>>> iptables -t mangle -A PREROUTING -m mark ! --mark 0 -p icmp -j MARK
>>> --set-mark 1 iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j
>>> MARK --set-mark 2=20
>=20
> There's something weird here :
> -m mark ! --mark 0
> at each line you should better do
> -m mark --mark 0
> at the two last lines.
>=20
> BR,

Just to confirm, Eric is correct, you should be using -m mark --mark 0
for the last two rules. In conclusion, for the most simple of setups for
this, we'd have the following:

	iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
# Skip through any pre-classifed traffic
	iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
# Define inbound policies
	iptables -t mangle -A PREROUTING -m mark --mark 0 -m state
--state NEW -i ppp0 -j MARK --set-mark 1
	iptables -t mangle -A PREROUTING -m mark --mark 0 -m state
--state NEW -i ppp1 -j MARK --set-mark 2
# Default policy route for any internal traffic
	iptables -t mangle -A PREROUTING -m mark --mark 0 -j MARK
--set-mark 2
	iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

	iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
	iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
# Make sure any packets that have existing IP's before this networking
level to keep their existing IP's
	iptables -t mangle -A OUTPUT -m mark --mark 0 --source
${ppp0_ip} -j MARK --set-mark 1
	iptables -t mangle -A OUTPUT -m mark --mark 0 --source
${ppp1_ip} -j MARK --set-mark 2
# Default policy route for this firewall
	iptables -t mangle -A OUTPUT -m mark --mark 0 -j MARK --set-mark
2
	iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE

