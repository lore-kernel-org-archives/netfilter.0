From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Fri, 03 Sep 2010 22:43:28 +0200
Message-ID: <4C815DF0.10402@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A6D11.8090306@httrack.com> <4C7A8040.7040002@plouf.fr.eu.org> <4C81321F.4010106@httrack.com> <alpine.LNX.2.01.1009031942001.31358@obet.zrqbmnf.qr> <4C813FC3.3050008@httrack.com> <alpine.LNX.2.01.1009032230210.3766@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283546615; bh=BbXCSRGSM5RzjWOxTCfGbND91sYN/DdJduOSUMCzMxQ=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=HZ+o/DK+bCjGv2hYYkhiIF0UBs9kCXkKejube/zF3Z1d7DFIZL0VVaq8NwPvqnfQA
	 ugDqjpVrWCcCw1yTLXTKCCaazlUGh+RgA0hkQUmvuRGDimUI+plNTkv3gNPt9HRsAe
	 n8/AR5eTNaZHDqBZ/Rh2rkJQQWJW8pJ/JUV3U2Fc=
In-Reply-To: <alpine.LNX.2.01.1009032230210.3766@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Jan Engelhardt a =C3=A9crit :
> Of course it is for routing. That is why it is in the *drumroll*
> routing table!

Sure. But my point was related to the main topic of this thread: the=20
damn source address is NOT at all concerned. Obvious or not, routing=20
won't help.
