From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: AW: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 08:09:52 +0000
Message-ID: <515168F006F2D643952F8FFD24F2E073016D566704@sonne2.gw.bringe.net>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: kay <kay.diam@gmail.com>

Hi,

kay <kay.diam@gmail.com> asked:
> I have very strange requirement. I need to DNAT (using RAWDNAT) the
> already established connection (simple HTTP keepalive) to another
> server without TCP session reestablishment.
> 
> For example I have web0 (input gateway), web1 (primary server), web2
> (slave server). SYN/ACK should be processed by web1, but "GET
> HTTP/1.1" request should be passed to web2. For this purposes, I
> guess, I need to establish fake connections on web2 which should be
> the same as on web1. I've already implemented RAWDNAT + RAWSNAT and
> SYN/ACK packet goes to web1 and all subsequent packets goes to web2,
> but web2 ignores them as it doesn't know about them. Is it possible to
> implement my requirement using conntrackd?

conntrackd is for synchronizing the connection tracking tables on a redundant pair of NAT gateways, so it's no use to you.

I imagine the problem is that the webserver on web2 doesn't know that there's an established connection that it should handle - how could it, without the tcp handshake?

Care to elaborate on what you're trying to achieve (vs. what you're tyring to do ;-))?

Cheers,
Thomas
