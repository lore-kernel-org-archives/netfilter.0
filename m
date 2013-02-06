From: Born Without <blackhole@airpost.net>
Subject: [Announce] ipset - programmable completion (bash)
Date: Wed, 06 Feb 2013 22:26:52 +0100
Message-ID: <5112CA9C.1040802@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=B9E8CFswYH
	S3gPeHEc82xQ8o9ZI=; b=mluMZgmx2GMPsYlHh+ME55YloYn98Evqqgt1rHx7+c
	jHs0K5Ar8aZl46nowRgHigIEYn//YHqIQ3NKJC9zk3qEQkHZB/wLdCOx310cpV6e
	OiYNEScR7VkYkyZbvW0yFxvurpSnYKxyyXr9QLCFKPFXJ1aK2FE7bJyvTR/zWZVT
	A=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:content-type
	:content-transfer-encoding; s=smtpout; bh=B9E8CFswYHS3gPeHEc82xQ
	8o9ZI=; b=MJsOXxWWYEG/Vuhx2GXctGDrT6pdlqlXcWzRYvZznOXJr3lHKO+4Yc
	Ty9EyzMEJFmqVcGp9zC1bJFDJwx2R/k3FVwYVG5f7PP3qk6tjYHtTO8ycTp5r99J
	7+npUZoaLMMJepc7uRkB0EA4mVnpg78SQ/q26u3UIxeDT8BmqtXPU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Hello community!

I've written programmable completion code for ipset.
This can be used in your bash shell, to interactively show and complete 
options, commands, set names and types for you.

Code and files are available here:

https://sourceforge.net/projects/ipset-bashcompl/
https://github.com/AllKind/ipset-bash-completion

I hope this becomes useful for the one or the other.
Constructive comments, ideas, etc are of course very much welcome.

@Jozsef: feel free to include it ...

Best regards

