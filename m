From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Netfilter applied to specific interfaces only
Date: Sun, 10 Mar 2013 22:46:47 -0400
Message-ID: <201303102246.48024.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sunday, March 10, 2013 10:34:36 AM Humberto Juc=E1 wrote:
> Hi,
>=20
> This is an much discussed issue in firewall forums.
> I need to study a little more about it, but my current opinion:
>=20
> 1. The servers should not do "any filtering" - except in specific
> cases. They should be placed in a DMZ segment or serverfarm. However,
> the access to these segments is controlled by a firewall (clustered o=
r
> not). So, you can focus on optimizing firewalls.

I humbly disagree. Any server exposed to the internet should be configu=
red to=20
limit inbound and outbound access to exactly that which is needed for i=
t to=20
operate. For example, an simple web server should allow only new incomi=
ng=20
conns to ports HTTP and HTTPS from internet; they should block new outg=
oing=20
conns (since a simple web server only serves data over existing conns).=
=20
Management ports, like ssh, should be limited to the least reasonable s=
et of=20
addresses expected. Periodic audits should show if these limits have be=
en=20
altered. The server is its own first line of defense. The nearest firew=
all is=20
the second line of defense. The perimeter firewall is the last line of=20
defense.

Of course, when talking about multi-Gbps links, one needs to install ha=
rdware=20
that can handle filtering that much data. If the OP has all his inter-L=
AN=20
traffic passing through a firewall, I might suggest his firewall is und=
er-
powered, or might suggest his network topology should be reviewed. If n=
o=20
topology changes are possible, then the only recourse is to install a f=
irewall=20
that *can* handle filtering that much data.
