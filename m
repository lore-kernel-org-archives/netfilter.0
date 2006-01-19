From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Conntrack and DNS
Date: Thu, 19 Jan 2006 09:30:55 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CB27B@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

=20
Sorry for the long delay. For clarity I've gotten rid of unrelated rules
as much as possible.
=20
> Hi Derick,
>=20
> Here is the full iptables.save. The critical IPs have been renamed to
> 1.1.1.x, 2.2.2.2, etc.
>=20
> The ISP's DNS IPs are shown below. The ones that are described in my
> first e-mail as DNS01 and DNS02 are 201.10.120.2 and 201.10.128.2
> respectively.
>=20
> As you can see, I already accept domain TCP packets.
>=20
> Thanks a lot for your help.
>=20

> -A PREROUTING -d 1.1.1.35 -i eth0 -j DNAT --to-destination 10.0.0.6

Assuming 1.1.1.35 is one of your public IPs.

> -A POSTROUTING -s 10.0.0.6 -o eth0 -j SNAT --to-source 1.1.1.35
> -A POSTROUTING -s 10.0.0.1 -o eth0 -j SNAT --to-source 1.1.1.34

What is .34? I don't see a related PREROUTING rule for it...

> -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT

This rule is not global (-i eth0 only) but looks like it should work
anyway...

> -A FORWARD -d 1.1.1.44 -i eth0 -o eth1 -p tcp -m tcp --dport 110
> --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -d 1.1.1.44 -i eth0 -o eth1 -p tcp -m tcp --dport 25
> --tcp-flags SYN,RST,ACK SYN -j ACCEPT

I'm assuming this is the mail server in question, with these inbound
mail rules.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -i eth1 -m state --state
> RELATED,ESTABLISHED -j ACCEPT

I would create a single RELATED,ESTABLISHED rule instead of having these
separate ones.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.128.2 -i eth1 -o eth0
> -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.120.2 -i eth1 -o eth0
> -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.68 -i eth1 -o
> eth0 -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.72 -i eth1 -o
> eth0 -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT

TCP DNS rules, all outbound.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.128.2 -i eth1 -o eth0
> -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.120.2 -i eth1 -o eth0
> -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.68 -i eth1 -o
> eth0 -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.72 -i eth1 -o
> eth0 -p udp -m udp --dport 53 -j ACCEPT

UDP DNS rules, all outbound.

> -A FORWARD -s 1.1.1.42 -d 10.0.0.1 -i eth1 -o eth2 -p tcp -m tcp
> --sport 1505 -j ACCEPT

Accepting a source port means that the destination port can be anything
so long as the source port is 1505 (which is unprivileged). It looks
like this is your internal network so not a big deal, but it can burn
you good if it handles Internet-sourced traffic.

> -A FORWARD -j LOG --log-prefix "FORWARD blocked: "

[Removed OUTPUT]

All of this looks OK to me, but there's definitely an issue with
conntrack not seeing DNS server #2's reply as RELATED,ESTABLISHED. I
would think this would be caught by your first RELATED,ESTABLISHED rule.
My advice would be to have one, at the top, without specifiying the
interface. See if that solves the problem.

Derick Anderson
###########################################=0A=
=0A=
This message has been scanned by F-Secure Anti-Virus for Microsoft =
Exchange.=0A=
For more information, connect to http://www.f-secure.com/

