From: Robert Pipca <robertpipca@gmail.com>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Fri, 17 Dec 2010 10:24:34 -0200
Message-ID: <AANLkTin+p+BbpxnP=sD=fVv9usBu3KGTE4bMEpfPJrUO@mail.gmail.com>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
	<alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
	<AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
	<alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=5/9AREf7kFb5tfyi2+Qe92DkN5F5bLJIG2mUHtAgBsY=;
        b=InOh8tN5VjrRV8RTp+GP6Z/2TKcGcfUgwu6mpLAF6iLVhHB8qDnkg+f+PbfeYSamaq
         1Ss1nK5qOe797tNOYzifAq9Jt6Kit9OtG3io2gK82V3rXqgEZ2KQOEJUwJOD64k+8vPn
         z/3pSaf71otxzNnySUrfo4UXynNT/F1TA+PKM=
In-Reply-To: <alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Mr. Engelhardt,

2010/12/17 Jan Engelhardt <jengelh@medozas.de>:
> Complete rulesets, please. Per ebtables-save.
> Otherwise it is impossible on whether rules have any effect:

These are my complete ebtables rules:

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst
200.152.32.0/24 -j redirect --redirect-target ACCEPT
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-src
200.152.32.0/24 -j redirect --redirect-target ACCEPT

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
--ip-dport 80  -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
--ip-sport 80  -j redirect --redirect-target DROP

I have nothing else on any table/chain...

Cheers,

- Robert
