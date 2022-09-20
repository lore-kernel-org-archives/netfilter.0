From: Florian Westphal <fw@strlen.de>
Subject: Re: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 17:19:52 +0200
Message-ID: <20220920151952.GD30575@breakpoint.cc>
References: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Bruno de Paula Larini <bruno.larini@riosoft.com.br> wrote:
> Hi,
> While testing my iptables ruleset on a Fedora 36, I've encountered an
> unexpected behaviour regarding FTP connection forwarding.
> I've reduced the ruleset to look like below.
> I've tried to "modprobe nf_conntrack_ftp" alone, but external clients sti=
ll
> won't get data connections.
> Then I "modprobe nf_nat_ftp". It loads normally but after the first attem=
pt
> to establish an FTP connection, the system freezes and sometimes prints t=
he
> following message:
>=20
> Message from syslogd@fw1-test at Sep 20 09:33:28 ...
> =A0kernel:watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [swapper/1:0]

Thats all? No backtrace?
