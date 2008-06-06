From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip howto ?
Date: Fri, 06 Jun 2008 16:17:01 +0200
Message-ID: <484946DD.7060103@trash.net>
References: <4849416C.70104@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4849416C.70104@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org

S=C2=8E=C3=A9bastien Cramatte wrote:
> Hello
>=20
> I'm search for an howto or any docs to use "nf_conntrack_sip".
> I've build a traffic shapper and I want to classify  SIP, IAX and RTP=
=20
> traffic.

=46irst, you probably want to use the version in the current -rc
kernel, which includes lots of bugfixes for proper parsing and
more complicated scenarios involving multiple endpoints.

The module has two parameters you might need to change:

- sip_direct_signalling:expect incoming calls from registrar only=20
(default 1) (int)

Controls whether incoming calls are only coming from the
host that you REGISTER with, or from anywhere. In the
later case the expectation for incoming calls is created
with a wildcard source. With normal SIP telephony providers
usually not necessary.

- sip_direct_media:Expect Media streams between signalling endpoints=20
only (default 1) (int)

Same thing for RTP streams. This one you often do have to
set to 0, for example when the SIP providers uses load-
balancing or has agreements with other providers to route
RTP directly between endpoints.

Matching on SIP is simple (-m udp --dport 5060). RTP can
be matched on using "-m helper --helper sip". Using marks
you can use this information for TC classification.
