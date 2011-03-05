From: Alex <mysqlstudent@gmail.com>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 5 Mar 2011 10:12:22 -0500
Message-ID: <AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
	<314641299313152@web72.yandex.ru>
	<AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
	<alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=DljM3LlDAxrAnhz5+K1M+3rQStubw7pKKr+ka9ynZhs=;
        b=DpNKS0cwHPmsF08yM437AibPylCgPyVOsoueFH320s8lsfp5svbbGWPX9HEvWkGPZ5
         0C7Isdn69qb9+url2Jfiw+u6svl+uYt3GRR+BwJE1CriYVOOijoSlASRQCKPEjHj0cp7
         AMSMLS7CO69QU9cQQ4unmOXXdNNxG0/b1fOx8=
In-Reply-To: <alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>, netfilter@vger.kernel.org

Hi,

>>> Could you please check, does such packets match the following
>>> rule?
>>>
>>> iptables -I FORWARD -m conntrack --ctstate INVALID -j LOG
>>
>>How will I be able to recognize such an entry in the logs? Is there a
>>way I can add a tag to the log entry so I can be sure?
>
> See --log-prefix.

Yes, thanks for that. It is matching some packets.

Mar  5 10:01:51 fc14 kernel: [2726254.099180] dnat invalid IN=eth1
OUT=eth0 SRC=192.168.1.7 DST=203.81.151.80 LEN=40 TOS=0x00 PREC=0x00
TTL=63 ID=0 DF PROTO=TCP SPT=39061 DPT=52759 WINDOW=0 RES=0x00 RST
URGP=0

Mar  5 10:08:11 fc14 kernel: [2726633.762301] dnat invalid IN=eth1
OUT=eth0 SRC=192.168.1.151 DST=69.171.224.11 LEN=52 TOS=0x00 PREC=0x00
TTL=63 ID=19662 DF PROTO=TCP SPT=48270 DPT=80 WINDOW=54 RES=0x00 ACK
FIN URGP=0

Mar  5 10:08:45 fc14 kernel: [2726667.362163] dnat invalid IN=eth1
OUT=eth0 SRC=192.168.1.151 DST=69.63.181.56 LEN=52 TOS=0x00 PREC=0x00
TTL=63 ID=19949 DF PROTO=TCP SPT=44230 DPT=80 WINDOW=98 RES=0x00 ACK
FIN URGP=0

The last two are just regular requests for access to facebook from
another PC on the internal network.

Thanks,
Alex
