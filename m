From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [Bridge] ebtables PREROUTING -drop
Date: Wed, 4 Aug 2010 14:33:10 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008041432380.6031@obet.zrqbmnf.qr>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com> <4C5953C8.2040708@free.fr> <51AC42EFFBC60FE7E630D78B@Ximines.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51AC42EFFBC60FE7E630D78B@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Bligh <alex@alex.org.uk>
Cc: =?UTF-8?Q?Nicolas_de_Peslo=C3=BCan?= <nicolas.2p.debian@free.fr>, ratheesh k <ratheesh.ksz@gmail.com>, bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Wednesday 2010-08-04 14:31, Alex Bligh wrote:
>
>> Did you read http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html and
>> http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png ?
>
> A useful improvement to those would be documenting where libpcap
> (which does both input and, less well known, output) samples/injects
> packets. I /think/ sampling is right on the left and injection right
> on the right.

pcap grabbing and injection is completely outside any of the graphs 
currently floating around.
