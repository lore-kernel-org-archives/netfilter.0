From: Robert Pipca <robertpipca@gmail.com>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Fri, 17 Dec 2010 02:00:48 -0200
Message-ID: <AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
	<alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=PTJSCdp6jcn/IxAprNf8Zx/h+UEfzeh/nV8Md+hSm9U=;
        b=d2EUwrLf1NGsGa9ZaKzQ2rIGfp13U/Bva1gOe0kH2cZi2LLU/WtCJetPjfQP/Tn88H
         o3SOLlPOIlcsfTqXlGDX8P+XC/LrhiAhNcTVQ1un9bbjjEREJnk2smJ+0IuBbNb8HVuy
         CPGKtq5aM/SnLWt72ClOq0y1mibhU6pPvTaH4=
In-Reply-To: <alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Mr. Engelhardt,

2010/12/17 Jan Engelhardt <jengelh@medozas.de>:
> If the above is fine to you, why would you even execute these two:

Apart from trying to understand the correct usage of ebtables rules, I
use it to _exclude_ IPs from a webproxy redirection.

Something like:

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst
200.152.32.0/24 -j redirect --redirect-target ACCEPT
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-src
200.152.32.0/24 -j redirect --redirect-target ACCEPT

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
--ip-dport 80  -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
--ip-sport 80  -j redirect --redirect-target DROP

But, like I said, it doesn't work as expected. The packets don't get
"bridged" like when the policy applies.

I just used the easier example to show the issue :-)

Cheers,

- Robert
