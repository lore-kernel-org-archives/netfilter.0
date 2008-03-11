From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: [SOLVED] PPPoE on a bridge, nat sees bridge as incoming interface
Date: Tue, 11 Mar 2008 15:32:06 +0100
Message-ID: <47D697E6.2050301@plouf.fr.eu.org>
References: <20080306172218.GA14566@possum.gg3.net> <47D07205.10906@plouf.fr.eu.org> <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net> <20080311110854.GA8806@possum.gg3.net> <Pine.LNX.4.64.0803111304160.24076@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803111304160.24076@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Jan Engelhardt a =E9crit :
>>
>>Problem: If a PPPoE connection is initialized over a bridge the nat
>>table will see any incoming IP packet as coming from the bridge
>>interface, and not the ppp interface.
>=20
> Solution 3: iptables -m physdev --physdev-in ppp0 -i br0
>             ebtables --logical-in ppp0 -i br0

Could you elaborate, please ?

--physdev-in expects a bridge port, which ppp0 is not.
--logical-in expects a bridge interface, which ppp0 is not.
-i in ebtables expects a bridge port, which br0 is not.
Also, the targets are missing.
