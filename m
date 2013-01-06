From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: FW: Packets missing the NAT table
Date: Sun, 6 Jan 2013 17:54:56 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301061753140.6663@nerf07.vanv.qr>
References: <00a901cdec28$006d1c10$01475430$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00a901cdec28$006d1c10$01475430$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: netfilter@vger.kernel.org

On Sunday 2013-01-06 17:08, Steve (Telsat Broadband) wrote:

>Hi All,
>
>I?m just trying to debug an issue on our network and I?ve noticed that=
 some
>packets are being missed from some rules in the NAT table.=C2=A0=20
>
>Do all packets go through the NAT table or is there some exclusion?=C2=
=A0 I?m
>seeing the packet hitting the mangle table as well as the filter table=
, but
>not the NAT?

The nat table is a configuration database of sorts that is only=20
consulted when necessary.
