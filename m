From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Building geoip against voyage kernel source fails
Date: Tue, 27 May 2008 18:43:18 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805271833270.12937@fbirervta.pbzchgretzou.qr>
References: <5AEFF5D121FC4228B90797FB303741CD@Gamma> <74BD5BE091304EFC96F804EB2869AA99@Gamma> <alpine.LNX.1.10.0805252112590.19084@fbirervta.pbzchgretzou.qr> <DD56BDDE964B41BFA022050ADCFA948B@Gamma>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DD56BDDE964B41BFA022050ADCFA948B@Gamma>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Balnaves <david@utopia.cable.nu>
Cc: Nick Pasich <NewsLetters@NickAndBarb.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2008-05-27 14:06, David Balnaves wrote:

> Hi,
>
> Does the Xtables-addons work with iptables-1.3.6?  From what I can see this is
> part of iptables-1.4.  If I want to use earlier than 1.4 I should probably
> stick to peejix's patchlet right?

The older geoip before it was imported into xt-a had exponentially
worse scalability, was not compatible with biarch setups, endianess
was not handled at all, leading it to "not work" in a lot of
situations.
You could just upgrade iptables which received a lot of care to compile
with older kernels. You can grab the convenient package at
http://dev.medozas.de/files/xtables/xtables-combined-1.5.4.1.tar.bz2
which has everything that one would need.
(Well, except the geoip database because it changes often and is big;
it is at http://jengelh.medozas.de/files/geoip/ ; see
xtables-addons.8 manpage)
