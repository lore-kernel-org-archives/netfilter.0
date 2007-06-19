From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to
 connet	a	pptpVPN server.
Date: Wed, 20 Jun 2007 01:12:03 +0200
Message-ID: <467862C3.4020201@plouf.fr.eu.org>
References: <000e01c7b01a$0c8305a0$dededede@neilhp>	<4673FDE6.9040605@granero.com.br>
	<042501c7b277$d1a1e950$1664a8c0@ssplscu22>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <042501c7b277$d1a1e950$1664a8c0@ssplscu22>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

rajeev.sekhar a =E9crit :
>=20
> I configured VPN befind the firewall, with the rules given by Pascal=20
> Hambourg.
>=20
> But when i connect more than one client, the old client connection get=20
> terminated.

Did you test from clients with different public IP addresses (not=20
masqueraded behind the same NAT device) ?
AFAIK the generic connection tracking and NAT should handle properly=20
multiple GRE tunnels between a masqueraded server and multiple clients,=20
provided that the server sees a unique IP address for each client so=20
each tunnel creates a unique conntrack/NAT tuple.

