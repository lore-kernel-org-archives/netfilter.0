From: Frank Wunderlich <frank-w@public-files.de>
Subject: nft show counter
Date: Wed, 31 Mar 2021 19:47:42 +0200
Message-ID: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617212862;
        bh=npFjHNsIXvBE6oUlb0xXwGt0ODuGcCgD8cxIBOv6DgI=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=Y7Wcvp/FRUnQ04Fmt5Q9RdrJkhX3TANCpSyUV9AesIWV0r1euWulXcVH7R8ydNuiP
         XSprGer3NJcYMY/ax3GyHcm8vcmh70y/9TOhdqFNCG/yECGRuxBMiOgBg/5gj95XuX
         paonm7gSdIUa3wntfGK1+pi6/4hSC/kA4Uss2JuI=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i want to read counters defined in nftables, but have not found a solid way to do this

nft list table ip filter

shows me the rules from specific table with all chains, rules and counters, e.g.

	chain voip1 {
		counter packets 3226 bytes 780864 accept
	}

	chain voip2 {
		counter packets 1640 bytes 119449 accept
	}

this needs to be parsed with grep/sed/awk, so maybe there is an easier way to read the counters. found nothing in manpage or google, so i just ask here. maybe there is a way to show the last x min traffic. i need this to check if connections is "alive"

regards Frank

