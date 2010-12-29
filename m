From: Robert Pipca <robertpipca@gmail.com>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Wed, 29 Dec 2010 16:48:45 -0200
Message-ID: <AANLkTik9XEM-0EwAs0m5atpXigQp88zQM+uxFd=bg1Ng@mail.gmail.com>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
	<alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
	<AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
	<alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pgqinx3p6OMWwiTcIOrS2XCtrDzRJIEbVXyMeEYU79w=;
        b=VZSm/VPPauk1GR0puHhnbV9aziTw/k/0+lN3QgJWOO5+w28b4oyQX/MEBADZME644J
         B0q06ZPOVG2M3dg0BQCbVrLx4RVkxe/kF8xSX9x1X5hlUYsXgYf6x4WnofMuUk3ldlZN
         HTi1MEl3/lDu1zlA9byVDsTWprB1BaFFoliJk=
In-Reply-To: <alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Amos Jeffries <squid3@treenet.co.nz>

Hi Mr. Engelhardt,

2010/12/17 Jan Engelhardt <jengelh@medozas.de>:
>>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst
>>200.152.32.0/24 -j redirect --redirect-target ACCEPT
>>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-src
>>200.152.32.0/24 -j redirect --redirect-target ACCEPT
>
> Odd combination of redirect with BROUTING. I am surprised ebtables
> even allows the use of "redirect" outside its nat table.

It's a recommendation from the squid guys:

http://wiki.squid-cache.org/Features/Tproxy4#ebtables_on_a_Bridging_dev=
ice

>>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
>>--ip-dport 80 =A0-j redirect --redirect-target DROP
>>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
>>--ip-sport 80 =A0-j redirect --redirect-target DROP
>

Do you have any other suggestions on how to do something like this:
"Bridge all the traffic. Route tcp/80....BUT if it's from this
network, then bridge it".

This is my goal with these rules.

If there's a document I can read to create this, I'd appreciate any poi=
nters.

Cheers,

- Robert
