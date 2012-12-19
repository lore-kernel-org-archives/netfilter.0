From: Born Without <blackhole@airpost.net>
Subject: ipset net:hash and nomatch option
Date: Wed, 19 Dec 2012 18:30:23 +0100
Message-ID: <50D1F9AF.4080701@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=VrDHLpuMIW
	Eh48VfPrz8aECwkIY=; b=pAkxMyiLJy60pw+UZwD3Z5GWtm98IL0heenQjiS0Tt
	EKlW3Fji6s1IEyGn4p2IVzR+3R11ohVwDEhlOsD0LFdh605pA0Ddfj3WBuQ0/8Ae
	ryDtIXpJgBmnPkg/9l+SA1vFI/HUoDMIEinyxMC/SwLDxPX9XZiNuuZdsyQDwJbp
	g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type:content-transfer-encoding;
	 s=smtpout; bh=VrDHLpuMIWEh48VfPrz8aECwkIY=; b=I2sl8Sf8yqzHCzPLT
	094Gpme8QqMllTRvZ8Xrq5dJ/jEDJtngfHedKuBTJoE+Mruko/Ok93YJczIzOFtA
	ritKz2Ky/5/m+mHRbz4fsEqodMyWPU6Xj1D/P5RC6I2nOnTYzsXlvQxKR7zdkTlF
	OBk559MYpjyRCXiKUd/YqXQnTE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list,

adding entries to a hash:net type of set using the 'nomatch' option 
gives me this error (using the example from the man page):

# $IPSET create foo hash:net
# $IPSET add foo 192.168.0/30 nomatch
ipset v6.16.1: Unknown argument: `nomatch'
Try `ipset help' for more information.

kernel: 3.2.35 (vanilla)

 From what the man page says that should work. Am I missing something?

Thanks for your help!
