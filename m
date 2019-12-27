From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nft 0.9.2] cannot get sets to work - Error: Could not process
 rule: Not supported
Date: Fri, 27 Dec 2019 20:30:44 +0000
Message-ID: <c7d31750-7de4-d394-e02d-5b565e706c38@gmx.net>
References: <6aa06206-7b72-c828-0090-b94d046e01cc@gmx.net>
 <20191227201210.d6f78c7180afd569527ead9e@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577478644;
        bh=JD7Lm4bBEA17BxcwVLsJTWo+5oRVXiqDg9CrlsFlNVY=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=CiVyFZxuHADP6Q9lpasFLTXmCwf1YKjksfN0AmbdyIH0gVQUimz/E4sEQYxGCijiq
         NRkqjewJrfKGRqX0j4GkqeNgOAlcO51jDtVkp99sbiZEUfp1Zkc8Dv5AmvoewNzeHv
         giwC+JM4rrFlwSi0XfpyGIxyGuQR4HhrQ40i9rzQ=
In-Reply-To: <20191227201210.d6f78c7180afd569527ead9e@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


On 27/12/2019 20:12, kfm@plushkava.net wrote:
>
> Check the status of CONFIG_NF_TABLES_SET.
>

Ouhmpf, there we go... thanks for the pointer!

 > CONFIG_NF_TABLES_SET is not set

