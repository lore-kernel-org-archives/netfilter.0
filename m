From: Daniel <tech@tootai.net>
Subject: Re: nftables static routing fails
Date: Mon, 13 Jan 2020 22:28:42 +0100
Message-ID: <72c8c914-929e-9d0d-dae3-26e3ed567ea2@tootai.net>
References: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1578951053; bh=5cg6yp1QmeP18xUZhSSmiz/4+JOX8W9dIsiosKM33Zo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=tJb20Y7a3DJF52G2KBDDYIJ2/BXO9C8n4Iu896dkYwlmABTQ5q9yg3PE+m0dGLAWU
         piqg9XE0CmQ6mpLPVz2Vlt2HZojYVX4Uqzi8/Sj1yHkULQIe5QqHkfOldmfH602jag
         3lbcMkoSQGYFNAROPydRxSazyFy7vRM5YrCuDtks=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1578951053; bh=5cg6yp1QmeP18xUZhSSmiz/4+JOX8W9dIsiosKM33Zo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=tJb20Y7a3DJF52G2KBDDYIJ2/BXO9C8n4Iu896dkYwlmABTQ5q9yg3PE+m0dGLAWU
         piqg9XE0CmQ6mpLPVz2Vlt2HZojYVX4Uqzi8/Sj1yHkULQIe5QqHkfOldmfH602jag
         3lbcMkoSQGYFNAROPydRxSazyFy7vRM5YrCuDtks=
In-Reply-To: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org


Le 13/01/2020 à 22:13, david NEW a écrit :
> hi,
>
> I am trying to route blocked ip set to IP:8080 where is info about 
> "you have been blocked"
>
> table ip raw {
>     set bad_ip {'
>         type ipv4_addr
>         elements = { xxx.xxx.xxx.xxx }
>     }
>
> chain prerouting {
>
>     type filter hook prerouting priority -500; policy accept;
>     nft add raw preroute ip saddr @bad_ip tcp dport { 80, 443 } ip 
> daddr set xxx.xxx.xxx.xxx tcp dport set 8080 notrack
> }
>
> }
>
> netfilter doesn't complain about this rule but nothing 
> happens...connection timed out and nothing happened. I see no errors 
> in Apache2 logs.
>
> I can see connection attempt in tcpdump but it is not redirected.
>
> any suggestion, please?


With nft 0.8.2 I could'nt make redirect working, I used dnat insteed.

-- 
Daniel
