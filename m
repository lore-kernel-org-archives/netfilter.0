From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: simple method to set tos
Date: Thu, 31 Mar 2005 17:25:02 +0300
Message-ID: <3063e5050331062544143a2d@mail.gmail.com>
References: <20050331133823.6562.qmail@flock1.newmail.ru>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050331133823.6562.qmail@flock1.newmail.ru>
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
Content-Type: text/plain; charset="koi8-r"
To: =?KOI8-R?B?8M/Qz9cg6cfP0tgg7snLz8zBxdfJ3g==?= <igorpopov@newmail.ru>
Cc: netfilter@lists.netfilter.org

Try using DSCP or TOS target with netfilter, like:

iptables -t mangle -A POSTROUTING -d <ip address> -j TOS --set-tos <tos>
or
iptables -t mangle -A POSTROUTING -d <ip address> -j DSCP --set-dscp <dscp>

DSCP is a combination of unused tos bits and some other unused bits
from ip header, looking for that on google should show exactly wich.


On Thu, 31 Mar 2005 17:38:23 +0400, =F0=CF=D0=CF=D7 =E9=C7=CF=D2=D8 =EE=C9=
=CB=CF=CC=C1=C5=D7=C9=DE
<igorpopov@newmail.ru> wrote:
>   Hi, all!
> I'm interesting is there a simple method to set tos on ip packets, that
> destinated to specific ip address?
> --
> Arbitrary systems, pl.n.:
> =A0=A0=A0=A0=A0=A0=A0=A0Systems about which nothing general can be said, =
save "nothing
> general can be said."
> __________
> www.newmail.ru -- =C2=C5=D3=D0=CC=C1=D4=CE=C1=D1 =D0=CF=DE=D4=C1, =C2=C5=
=D3=D0=CC=C1=D4=CE=D9=CA =C8=CF=D3=D4=C9=CE=C7.
>=20
>=20


--=20
Bla bla

