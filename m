From: Daniel <tech@tootai.net>
Subject: Re: nftables cgroup accounting problem
Date: Mon, 5 Oct 2020 11:08:05 +0200
Message-ID: <3590b54d-0556-273d-862f-4483487b0a60@tootai.net>
References: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
 <5fb80e78-32f1-70e4-cc73-76dc2c4ddb3b@tootai.net>
 <20201005101543.Horde.lVls9cH0kEjRR1pS_9eR4E2@webmail.inetadmin.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1601888886; bh=RQ7NlcpaUFjh4crxvkr9WWroAiC0XxZtuuczJNae2A8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=b+AkZy340UaEY27I+D6aJCbos0h1alY/4XZLGFihkoQCer4pkdzWLEevMlMaKqWuG
         uVOCWsQQCsNm/ZmRc3txkobQis/e2avtr47luh271E4z03h8auS23K8z5NAZ5ntr++
         lg9LVPSvzAsxYe4ll+zVEhVlJX12Oy1+BTCxMZsc=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1601888885; bh=RQ7NlcpaUFjh4crxvkr9WWroAiC0XxZtuuczJNae2A8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=h0ABcSfIINigVsYLWkvOy5ZhS/47CtjaOYdtTdZZgGby/857RJbyPO8vT60MOEn4Z
         I9aEGbvAbxupT0j+nzngjjjOfFp3wVeHuHuqyQtgt9ra5vk3qIC1lSfTxAHnxid+NQ
         EYcs0HJKIfFZ65ftXRTgRiCV1fSzeFJJk/Z102ik=
In-Reply-To: <20201005101543.Horde.lVls9cH0kEjRR1pS_9eR4E2@webmail.inetadmin.eu>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org


Le 05/10/2020 à 10:15, azurit@pobox.sk a écrit :
>
> Citát Daniel <tech@tootai.net>:
>
>> Hello
>>
>> Le 05/10/2020 à 08:16, azurit@pobox.sk a écrit :
>>> Anyone?
>>>
>>>> [...]
>>>> iptables: No space left on device.
>> Perhaps this ...
>
>
> Sorry but i don't understand. What do you mean?
>
> If you are talking about error message 'No space left on device.' then 
> there is definitely LOTS of space on all devices, that's why i wrote 
> that this error message is 'weird'. Anyway, iptables/nftables has 
> nothing to do with storage, so it still would be weird if there's 
> really no space left.
This message also appears if you run out of inode. Run df -i to check

-- 
Daniel
