From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: T/TCP connections not NATed
Date: Mon, 04 Dec 2006 15:45:22 +0100
Message-ID: <45743482.90109@plouf.fr.eu.org>
References: <20061204082355.GF3136@slug>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061204082355.GF3136@slug>
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

Hello,

Frederik Deweerdt a =E9crit :
>=20
> We're trying to use a home brewed T/TCP stack in addition to Linux plai=
n
> SNAT. Everything works as expected, except for the first packet, which
> is not NATed.

I guess you mean the _second_ packet ?

> Communication is as follows:
>=20
> 	C		S
> 1.	SYN*
> 2.	DATA
> 3.			SYN/ACK*
> 4.	ACK*
> 5.	REST_OF_COM*
>=20
> [*] The packet is NATed
>=20
>=20
> Our hypothesis du jour, is that packet #2 is not NATed because it is
> not currently part of a connection from netfilter point of view. Hence
> my questions:
> - Does our hypothesis seem you reasonable?

Yes. A TCP data segment before the end of the 3-way handshake is not=20
supposed to happen in standard TCP, so the TCP connection tracking in=20
kernel >=3D 2.6.9 considers such packet as INVALID, and the NAT skips=20
INVALID packets. You can check this by logging packets in the INVALID=20
state with LOG rules.

> 	- If yes, is it possible to tell NAT to ignore the connection
> 	tracking informations, and NAT all the packets getting out of
> 	a given interface

You cannot tell stateful NAT (iptables NAT) to ignore the connection=20
tracking informations because it needs them to work properly. But you=20
can try to tell the connection tracking to be less strict with TCP=20
connections by setting the kernel parameter=20
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 1. I suppose=20
packet #2 should be seen in the NEW state with this setting, so don't=20
drop or reject non-SYN TCP packets which are in the NEW state.

