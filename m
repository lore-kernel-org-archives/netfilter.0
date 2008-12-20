From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FW: Using iptables for configuring VRF
Date: Sat, 20 Dec 2008 12:20:32 +0100
Message-ID: <494CD500.1070401@plouf.fr.eu.org>
References: <ABDEBDCB7615474A9DFC1D52A19A6B6301D293BA@GRPGEPWMX0011.grptop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ABDEBDCB7615474A9DFC1D52A19A6B6301D293BA@GRPGEPWMX0011.grptop.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Cheli Monia a =E9crit :
> I found in the internet that ip6tables does not support the TOS targe=
t
> or equivalent traffic class setting.

If your kernel (>=3D2.6.23) and iptables (>=3D1.4.0) versions support t=
he=20
'u32' match, you may use it to check the traffic class value in the IPv=
6=20
header.
