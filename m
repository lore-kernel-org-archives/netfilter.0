From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables, after adding a rule without any action, nft doesn't
 return correctly
Date: Wed, 16 Jul 2014 18:07:16 +0200
Message-ID: <20140716160716.GA7906@salvia>
References: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryo Fujita <rfujita@redhat.com>
Cc: netfilter@vger.kernel.org

On Thu, Jul 17, 2014 at 12:37:43AM +0900, Ryo Fujita wrote:
> Hi,
>=20
> I=E2=80=99m still a newbie to nftables and couldn=E2=80=99t distingui=
sh right behavior from a bug.
>=20
> I found a weird behavior of nft command.
>=20
> # nft -f /etc/nftables/inet-filter
> # nft add rule inet filter input log drop
> # nft add rule inet filter input ip saddr 192.168.1.21 // without any=
 action like =E2=80=98drop=E2=80=99, =E2=80=98accept=E2=80=99, =E2=80=98=
log=E2=80=99 and so on
> # nft list chain inet filter input
> table inet filter {
> 	chain input {
> 		 type filter hook input priority 0;
> 		 log drop
> ^C << - - - - - - - break
>=20
> I have 2 questions.
>=20
> 1. Adding a rule without any action didn=E2=80=99t result any error. =
Was it correct behavior?

You can add rules without any action.

> 2. After adding a rule, nft didn=E2=80=99t return, needed to break, ^=
C. Was it a bug?

Try -n to disabling name resolution:

# nft -n list table inet filter

> My environment was as followings.
> nftables-0.100-3.20140704git.fc21.x86_64

Please, use latest when testing.

http://www.netfilter.org/projects/nftables/downloads.html

Thanks.
