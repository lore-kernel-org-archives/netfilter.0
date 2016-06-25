From: "Anders K. Pedersen" <akp@akp.dk>
Subject: nftables: Dynamically updating sets gives syntax error
Date: Sat, 25 Jun 2016 15:30:22 +0200
Message-ID: <1466861422.29189.75.camel@akp.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

With nftables 0.6 I'm getting a syntax error, when I try to use the
feature that was introduced by=C2=A0http://git.netfilter.org/nftables/c=
ommit
/?id=3Da9467e55973b10c2e8fe37525514c961580f8506=C2=A0. For example:

# nft filter input set add tcp dport @myset
<cmdline>:1:26-30: Error: syntax error, unexpected dport
filter input set add tcp dport @myset
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0^^^^^
# nft filter input set add ip saddr timeout 10s @myset
<cmdline>:1:25-29: Error: syntax error, unexpected saddr
filter input set add ip saddr timeout 10s @myset
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
^^^^^
# nft filter input set update ip saddr timeout 10s @myset
<cmdline>:1:28-32: Error: syntax error, unexpected saddr
filter input set update ip saddr timeout 10s @myset
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0^^^^^

Is there a new syntax for this or was it broken unintentionally?

Regards,
Anders K. Pedersen
