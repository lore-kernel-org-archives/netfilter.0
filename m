From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: VoIP conntrack issue
Date: Mon, 12 Nov 2012 22:02:01 -0500
Message-ID: <201211122202.02082.neal.p.murphy@alum.wpi.edu>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Monday, November 12, 2012 09:49:49 PM J=C3=B6rn Krebs wrote:
> Hi guys, I got the error, that my last mail hasn't been postet, so I =
try
> again:
>=20
> I know this might have been discussed a thousand times, but actually,
> I think, not often enough.
> First my situation:
> I have a private network, iptables NATed of cause! then I have a
> Xen-VoIP-Server(Asterisk) and at last a VoIP provider.
> What I like to do is initiate VoIP calls over my VoIP Server and send
> the data (RTP audio stream) directly to my provider. The would work
> pretty good if ther wasn't my iptables NAT.

One possibility is to run siproxd on your firewall (provided your VoIP =
system=20
can use a proxy). This should resolve nearly all VoIP problems related =
to a=20
NATting firewall.
