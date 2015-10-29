From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Thu, 29 Oct 2015 23:11:38 +0100
Message-ID: <20151029221138.GA3447@salvia>
References: <56328E60.4040002@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56328E60.4040002@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Martin =?iso-8859-1?Q?Gr=F6ger?= <mgroeger1@web.de>
Cc: netfilter@vger.kernel.org, fw@strlen.de

On Thu, Oct 29, 2015 at 10:23:44PM +0100, Martin Gr=F6ger wrote:
> I'm trying to build a transparent filter with application level filte=
ring.
> First experiment with ip and output hook and queue to userspace was
> successful. Then I changed to bridge filtering with forward hook. Wit=
h
> counter action I see that the packets match the rule, but the queue t=
o the
> usersapce doesn't work.
>=20
> Am I right, that this fuction should work?

I guess you're using the 'bridge_netfilter' module?

=46lorian told me he will come up sooner or later with native queue
support for nft (ie. no bridge_netfilter required anymore).

> I'm using Fedora 22 with nftables 0.4.

Not related to this problem, but it's a good idea to stick to latest.
Lots of fixes and updates have happened between 0.4 and 0.5.
