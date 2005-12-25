From: Noman Liaquat <khankhn1@yahoo.com>
Subject: Re: string replacement help
Date: Sat, 24 Dec 2005 21:45:43 -0800 (PST)
Message-ID: <20051225054543.45473.qmail@web35913.mail.mud.yahoo.com>
References: <20051224141758.GG18594@minastirith.hsd1.md.comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051224141758.GG18594@minastirith.hsd1.md.comcast.net>
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
Content-Type: text/plain; charset="windows-1252"
To: Michael Rash <mbr@cipherdyne.org>, khankhn1@yahoo.com
Cc: rob@sterenborg.info, netfilter@lists.netfilter.org, rob0@gmx.co.uk

Hello Mike,

I am using RedHat EnterPrise Linux version#4
kernel.version=3Dlinux-2.6.14.4
I am using the patch of
matic-nghttp://max.kellermann.name/projects/netfilter/h323.html

svn co
https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng
cd patch-o-matic-ng ./runme --kernel-path
/usr/src/linux-2.6.14.4 \ --iptables-path
/usr/src/iptables-1.3.4 string

its confirm that i got the option of string when i did

[root@mail lib]# iptables -m string -h
STRING match v1.3.4 options:
--from                       Offset to start searching
from
--to                         Offset to stop searching
--algo                        Algorithm
--string [!] string          Match a string in a
packet
--hex-string [!] string      Match a hex string in a
packet

but not showing the replacement option of
--replace-string.

i think there is need of patch but from which place i
can easily get the patch and how i can patch it.

Regards
noman




--- Michael Rash <mbr@cipherdyne.org> wrote:

> Hi Noman -
>=20
> What kernel version are you trying to apply the
> string replace patch to?
>=20
> --Mike
>=20
>=20
> On Dec 24, 2005, Noman Liaquat wrote:
>=20
> >=20
> > patch-o-matic is install properly but
> --replace-string
> > is not woring, what should i do to resolve the
> problem
> >=20
> > regards
> > noman
>=20



	=09
__________________________________________=20
Yahoo! DSL =96 Something to write home about.=20
Just $16.99/mo. or less.=20
dsl.yahoo.com=20


