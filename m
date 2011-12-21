From: =?ISO-8859-1?Q?Niccol=F2_Belli?= <darkbasic@linuxsystems.it>
Subject: Re: Filtering on bridges
Date: Wed, 21 Dec 2011 16:36:41 +0100
Message-ID: <4EF1FD09.80306@linuxsystems.it>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxsystems.it;
	s=linuxsystems.it; t=1324481654;
	bh=vRm2PBcNgFDuLFwWyIobYfaFBse2tJ0EvPeT68VK9M0=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=Ij2yMM138PhNkPlwf3ziP0S/g/to3D52iJBuVBOldGLaoG9Qha1eJv45Hnm1a5BC5
	 RymoZRylNhzYQ54esWJWe5NlmklSpczqmHRfbLqPrOz77txe+Lz1e2iTOJQFrtJxv6
	 Z7dy1pFJDimqLub1MMcIC1uj92wgj8HvlJiJLlKw=
In-Reply-To: <4EF1E3B0.6080200@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

You *can't*, that's simple.
=46orget the ebtables/marking shit, I did a firewall with it (which wor=
ked=20
flawlessly of course) and then I trashed it after seeing how disgusting=
=20
was the code. Do not use linux, it simply can't do the task in a=20
feasible way. We are really gone backwards concerning bridging firewall=
s.

Niccol=F2
