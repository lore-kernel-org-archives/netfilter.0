From: Robert Pipca <robertpipca@gmail.com>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Wed, 29 Dec 2010 17:59:24 -0200
Message-ID: <AANLkTi=WQJ-vgWaryTYwJHm+L=+N4+3wo0tzuOC2YBG_@mail.gmail.com>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
	<alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
	<AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
	<alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
	<AANLkTik9XEM-0EwAs0m5atpXigQp88zQM+uxFd=bg1Ng@mail.gmail.com>
	<alpine.LNX.2.01.1012292026440.28059@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=amJ7aj36DG3vIPTcg4J18zlB0ABY/N68px4NqQW+UEM=;
        b=nr7LnDxaUqRHD9lMPAFsybZsYq286gLgqWTo3fTJUiB+k4h1qNODEPRcZUON7AMyVz
         +1crpfz5u7WHSMaFv67fFxNb1r70Ig3fMohKLSyzUKdbnPOG39tiAJVrE5WogRVNVJn1
         MOhdFgqyOkm1ejrbPYmvYkc0Z4HJYCo7LkkWQ=
In-Reply-To: <alpine.LNX.2.01.1012292026440.28059@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Amos Jeffries <squid3@treenet.co.nz>

Hi Mr. Engelhardt,

2010/12/29 Jan Engelhardt <jengelh@medozas.de>:
> ebtables -t broute (...condition for "this network"...) -j ACCEPT
> ebtables -t broute -p tcp --dport 80 -j DROP
> ebtables -t broute -j ACCEPT

Right, but now is the possible bug I told on the original email: This
doesn't work as expected.

On a test-network 192.168.0.0/24, on the bridge machine I do:

ip route add 192.168.0.100 via 192.168.0.20 dev br0

Being 192.168.0.20 just some bogus route, if I do "ebtables -t broute
-F", which is  "apply ACCEPT on all packets", the client 192.168.0.100
browses just fine.

If I do what you just did, the machine stops browsing (ie, that bogus
route is used)...which is not suppose to happen, right?

I tested this on kernel 2.6.31.14, 2.6.32.27, 2.6.34.7 and
2.6.36.2...with the latest ebtables version. Same result.

Do you see this as expected behaviour? Or is it a bug?

Cheers,

- Robert
