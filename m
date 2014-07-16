From: Ryo Fujita <rfujita@redhat.com>
Subject: nftables, after adding a rule without any action, nft doesn't return correctly
Date: Thu, 17 Jul 2014 00:37:43 +0900
Message-ID: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I=E2=80=99m still a newbie to nftables and couldn=E2=80=99t distinguish=
 right behavior from a bug.

I found a weird behavior of nft command.

# nft -f /etc/nftables/inet-filter
# nft add rule inet filter input log drop
# nft add rule inet filter input ip saddr 192.168.1.21 // without any a=
ction like =E2=80=98drop=E2=80=99, =E2=80=98accept=E2=80=99, =E2=80=98l=
og=E2=80=99 and so on
# nft list chain inet filter input
table inet filter {
	chain input {
		 type filter hook input priority 0;
		 log drop
^C << - - - - - - - break

I have 2 questions.

1. Adding a rule without any action didn=E2=80=99t result any error. Wa=
s it correct behavior?

2. After adding a rule, nft didn=E2=80=99t return, needed to break, ^C.=
 Was it a bug?

My environment was as followings.
nftables-0.100-3.20140704git.fc21.x86_64
libnftnl-1.0.2-1.fc21.x86_64
kernel-3.15.4-200.fc20.x86_64

Best Rio.