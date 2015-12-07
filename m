From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Marking frames with ebtables for iptables
Date: Mon, 07 Dec 2015 23:39:11 +0100
Message-ID: <56660A8F.2000802@plouf.fr.eu.org>
References: <loom.20151202T145721-935@post.gmane.org>	<5662CACC.9010809@plouf.fr.eu.org> <CA+KjHfaK=qGZAvwCEZ1XNGcLBSQ6VE9z69E0XSxX_mfkHQ8TgA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+KjHfaK=qGZAvwCEZ1XNGcLBSQ6VE9z69E0XSxX_mfkHQ8TgA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oliver Graute <oliver.graute@gmail.com>
Cc: netfilter@vger.kernel.org

Oliver Graute a =E9crit :
>=20
> I just tried a "simple" example with "mac" match to understand the
> ebtables/iptables mix.
> But the real goal is to mark frames coming from a tagged port with a
> 3-bit PCP Field.(IEEE 802.1p/ 802.1Q)
> Later on I want to proceed these marked frames on IP-Layer to
> set some ToS Bits. How is that done?

I don't know what the PCP field is. Is it the same as the 3-bit user
priority field in a IEEE 802.1Q header ? If so, you can use the vlan
match in ebtables.

To set TOS bits with iptables, you can use the TOS or DSCP target.
