From: Florian Westphal <fw@strlen.de>
Subject: Re: Mysql has problem with synproxy
Date: Fri, 22 Nov 2019 13:32:33 +0100
Message-ID: <20191122123233.GE2284@breakpoint.cc>
References: <CAK6Qs9k0Z9US9u3OWhO4_DTjU1+zY5wXpARu6=cwgVOPx8jP2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK6Qs9k0Z9US9u3OWhO4_DTjU1+zY5wXpARu6=cwgVOPx8jP2Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?Q?=C4=B0brahim?= Ercan <ibrahim.metu@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

=C4=B0brahim Ercan <ibrahim.metu@gmail.com> wrote:
> iptables -t raw -A PREROUTING -i enp12s0f0 -p tcp --syn -j CT --notrack
> iptables -t filter -A FORWARD  -i enp12s0f0 -p tcp -m state --state
> INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --mss 1460
> --wscale 6
> iptables -t filter -A FORWARD -i enp12s0f0 -p tcp -m state --state
> INVALID -j DROP

Does it work when you omit --timestamp?

> Between firewall and server
> 14:28:12.343459 IP 10.0.0.2.59586 > 10.0.0.1.3336: Flags [S], seq 1356993=
242, win 229, options [mss 1460,sackOK,TS val 1731042 ecr 1423321111,nop,ws=
cale 7], length 0

Oh, this is a bug, but I don't know if that is the reason for the
failure.  ecr should be 0 reset to 0.

I susepct this patch would fix it:

diff --git a/net/netfilter/nf_synproxy_core.c
--- a/net/netfilter/nf_synproxy_core.c
+++ b/net/netfilter/nf_synproxy_core.c
@@ -174,6 +174,7 @@ synproxy_check_timestamp_cookie(struct synproxy_options=
 *opts)
        opts->options |=3D opts->tsecr & (1 << 4) ?
	NF_SYNPROXY_OPT_SACK_PERM : 0;
=20
        opts->options |=3D opts->tsecr & (1 << 5) ?
	NF_SYNPROXY_OPT_ECN : 0;
+       opts->tsecr =3D 0;
 }
=20
> 14:28:12.343583 IP 10.0.0.1.3336 > 10.0.0.2.59586: Flags [S.], seq 166614=
9016, ack 1356993243, win 65535, options [mss 1460,nop,wscale 6,sackOK,TS v=
al 109930553 ecr 1731042], length 0
> 14:28:12.343602 IP 10.0.0.2.59586 > 10.0.0.1.3336: Flags [.], ack 1, win =
229, options [nop,nop,TS val 1731042 ecr 3091507291], length 0

I assume the 'ack 1' is tcpdump being too helpful? (-S to disable).
I can't see anything wrong here, sorry.

