From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Catching un-DNAT'ed packets
Date: Tue, 26 Dec 2006 12:09:32 +0100
Message-ID: <459102EC.50402@plouf.fr.eu.org>
References: <1167054030.16171.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1167054030.16171.10.camel@localhost.localdomain>
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

Pokotilenko Kostik a =E9crit :
>=20
> Is it possible to catch un-DNAT'ed packets with iptables' -j ULOG
> target?

I'm afraid no.

> Where does the un-DNAT occurs and is there table/chain that is
> processed after un-DNAT?

In 2.4 kernels, when DNAT occurs in the PREROUTING chain, un-DNAT occurs=20
at the same place as (and in place of) the POSTROUTING chain of the=20
'nat' table, and there is no chain after it. In 2.4 kernels >=3D 2.4.19,=20
when DNAT occurs in the OUTPUT chain, un-DNAT occurs after the INPUT=20
chain of the 'filter' table, and there is no chain after it either. I=20
suppose it has not changed in 2.6 kernels.

> The problem I have is that replay packets got catched with real source
> address, not the one the client has initially connected to. I was
> catching replay packets in mangle/POSTROUTING.

The POSTROUTING chain of the 'mangle' table is just before the un-DNAT=20
place.

