From: "Alex van den Bogaerdt" <alex@vandenbogaerdt.nl>
Subject: Re: nftables, after adding a rule without any action, nft doesn't
 return correctly
Date: Thu, 17 Jul 2014 01:52:26 +0200
Message-ID: <680b694adb962ba81dcab364655b306a.squirrel@webmail.argewebhosting.nl>
References: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

> Hi,
>
> I=E2=80=99m still a newbie to nftables and couldn=E2=80=99t distingui=
sh right behavior
> from a bug.
>
> I found a weird behavior of nft command.
>
> # nft -f /etc/nftables/inet-filter
> # nft add rule inet filter input log drop
> # nft add rule inet filter input ip saddr 192.168.1.21 // without any
> action like =E2=80=98drop=E2=80=99, =E2=80=98accept=E2=80=99, =E2=80=98=
log=E2=80=99 and so on
> # nft list chain inet filter input
> table inet filter {
> 	chain input {
> 		 type filter hook input priority 0;
> 		 log drop
> ^C << - - - - - - - break

=46orgive me my ignorance if any, but isn't nft waiting for "}}" or sim=
ilar?


