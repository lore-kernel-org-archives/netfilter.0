From: Florian Westphal <fw@strlen.de>
Subject: Re: Legacy?
Date: Tue, 22 Jun 2021 00:30:10 +0200
Message-ID: <20210621223010.GA4375@breakpoint.cc>
References: <f40a0638-af78-c356-eef4-116b84e652c4.ref@att.net>
 <f40a0638-af78-c356-eef4-116b84e652c4@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f40a0638-af78-c356-eef4-116b84e652c4@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

slow_speed@att.net <slow_speed@att.net> wrote:
> A particular computer does not have nftables.=A0 It shows rules for iptab=
les
> and a different set of rules for iptables-legacy.=A0 Why is iptables-lega=
cy
> active but not the plain iptables?=A0 Does legacy override the regular?

iptables -v will probably tell that its nf_tables.
As for why iptables-legacy is involved: either some program calls
iptables-legacy instead of iptables or a program uses the raw setsockopt
interface.  systemd is known to do this when built with libiptc support.
