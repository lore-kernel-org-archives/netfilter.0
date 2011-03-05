From: Alex <mysqlstudent@gmail.com>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 5 Mar 2011 18:33:08 -0500
Message-ID: <AANLkTinpb3WCQ=aSO_OhtTCbmTb8yQp5357S6CZLhHZ-@mail.gmail.com>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
	<314641299313152@web72.yandex.ru>
	<AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
	<alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr>
	<AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
	<514701299338286@web59.yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=3aWgJx1FSEb03aXC1g7N8DZBwI9vkfuQ2a8HufcWIpo=;
        b=dwf4MnWwTdHLlYRCPsOtrtKDTkbSJk7l4ZqSnqBr6sylE/xCyVdjp2VHQO9n3+553H
         OKfIAB4MN50mpT1D+AMBPF3KZ6rjVoTOoT/HHiDLNtGQXJ+BIz04L9Cq766sB/FQDOPM
         ga4yp/QXJrgzyGiMil83ownEjQIvkqy2+tLp4=
In-Reply-To: <514701299338286@web59.yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Hi,

>> The last two are just regular requests for access to facebook from
>> another PC on the internal network.
>
> This packets can be out-of-order or duplicate packets with FIN flag.
> They are not connected to any conntrack entry, so there is no way
> to do NAT transformation for them.

I'm not sure if I'm misunderstanding what you are saying, or you're not clear.

I'm trying to dnat bittorrent traffic, but there are many rejects in
the kernel logs that I believe are a result of my dnat rules not being
correct, and I thought the rule below would help me isolate those
packets:

# iptables -I FORWARD -m conntrack --ctstate INVALID -j LOG
--log-prefix "dnat invalid "

there is a periodic match (maybe a few every other minute).

However, they are apparently matching packets that are not related to
my bittorrent traffic and shouldn't be dnat'd. How can I determine why
these facebook packets are invalid and why my bittorrent traffic is
not properly being dnat'd?

Thanks,
Alex
