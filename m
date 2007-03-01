From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Re IPv6 MARK support
Date: Thu, 01 Mar 2007 16:18:01 +0100
Message-ID: <45E6EEA9.4050009@plouf.fr.eu.org>
References: <200702281053.l1SArNIC025800@toshiba.co.jp>	<200702281136.l1SBaJLe019021@toshiba.co.jp>	<2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>	<200702281238.l1SCcE4F016826@toshiba.co.jp>	<2acb06d50703010232k64325368l2cfab895b460c9b7@mail.gmail.com>
	<2acb06d50703010305u3bc7a1d9h862b8d01bed685c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2acb06d50703010305u3bc7a1d9h862b8d01bed685c4@mail.gmail.com>
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

Boutin Ma=EBl a =E9crit :
>=20
> We would like to have the Source IPv6 address of the new interface

Which address ? You know that it is common for an interface to have=20
multiple global IPv6 addresses, or no global IPv6 address (only a link=20
local address).

> and
> not the IPv6 adress of the default route. Is it possible on PREROUTING
> hook to change the IPv6 address of the outgoing packets ?

I'm afraid not. This is not even possible in IPv4. It is possible to NAT=20
the IPv4 source address in the POSTROUTING chain, but there is no such=20
support for IPv6 NAT (and don't think there will ever be any).

