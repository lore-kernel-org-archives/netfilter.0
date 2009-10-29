From: Patrick McHardy <kaber@trash.net>
Subject: Re: 64bit MARK
Date: Thu, 29 Oct 2009 23:30:02 +0100
Message-ID: <4AEA176A.6060501@trash.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fdelawarde@wirelessmundi.com
Cc: netfilter@vger.kernel.org

=46ran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD w=
rote:
> Hello,
>=20
> Would it be possible to have 64bit MARKs with 64bit architectures?=20
>=20
> Apparently they are defined as "unsigned long" in linux headers, but
> iptables limits them to 32bit.

Thats from far far back. The unsigned long only exists in compatibility
structures, all new revisions use 32 bit. This is deliberate to make
sure they're same-sized on all architectures and rulesets don't behave
differently.
