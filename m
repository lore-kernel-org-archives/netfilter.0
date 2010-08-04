From: Alex Bligh <alex@alex.org.uk>
Subject: Re: [Bridge] ebtables PREROUTING -drop
Date: Wed, 04 Aug 2010 13:31:28 +0100
Message-ID: <51AC42EFFBC60FE7E630D78B@Ximines.local>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
 <4C5953C8.2040708@free.fr>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5953C8.2040708@free.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: =?UTF-8?Q?Nicolas_de_Peslo=C3=BCan?= <nicolas.2p.debian@free.fr>, ratheesh k <ratheesh.ksz@gmail.com>
Cc: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>, Alex Bligh <alex@alex.org.uk>



--On 4 August 2010 13:49:28 +0200 Nicolas de Peslo=C3=BCan=20
<nicolas.2p.debian@free.fr> wrote:

> Did you read http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html a=
nd
> http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png ?

A useful improvement to those would be documenting where libpcap
(which does both input and, less well known, output) samples/injects
packets. I /think/ sampling is right on the left and injection right
on the right.

--=20
Alex Bligh
