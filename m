From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTables NAT: Strange behaviour: bug?
Date: Wed, 25 Apr 2007 00:26:48 +0200
Message-ID: <462E8428.6080502@plouf.fr.eu.org>
References: <462DC260.5090206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462DC260.5090206@gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Pedro Gon=E7alves a =E9crit :
>=20
> In attachment you can find an capture made at the machine with IPTables=
,
> in which you can see:
> -packets 1 and 2: Packet going from the client behind NAT
> (175.16.0.1:10000) to Stun Server (192.168.2.164:3478) -> Client's
> public address is 192.168.2.159:10000
> -packets 21 e 22: Packet going from the client behind NAT
> (175.16.0.1:10000) to the other NAT's public addr
> (192.168.2.173:20000)-> Client's public address is 192.168.2.159:1029
>=20
> Why is the client getting different NAT mappings?

The NAT mechanism may change the source port in order to avoid a clash -=20
or at least what it considers a clash - with an existing mapping (same=20
external source and destination addresses and ports). I guess that this=20
existing mapping was created by packet #17 received from the other NAT=20
device : 192.168.2.173.20000 -> 192.168.2.159.10000.

A possible workaround may be to DROP or REJECT this incoming packet in=20
the INPUT table, so the associated connection tracking and NAT mapping=20
are deleted.

