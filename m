From: azurit@pobox.sk
Subject: Re: nftables cgroup accounting problem
Date: Mon, 05 Oct 2020 10:15:43 +0200
Message-ID: <20201005101543.Horde.lVls9cH0kEjRR1pS_9eR4E2@webmail.inetadmin.eu>
References: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
 <5fb80e78-32f1-70e4-cc73-76dc2c4ddb3b@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=dkiminetadmin;
        t=1601885743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IjMOE31MxKQp0Q7hZGNl36YjTe95sEevYIDBsat6y1Q=;
        b=s7stNj/enn97/VkYzONkN9J/seS+pw6TpVBAIpOTZgAlzQTGbFR53F2dyqD+lCp51+g6sD
        8vnRieEc1UV91pNT+Zc6Bz1gNgk47f3Dzi2UuNWv+Ln5K+Z5z7gra2674M5CoxG7OqP3hq
        m5PAap5U/40lPNaHtTYUwI1JMOLL6ng=
In-Reply-To: <5fb80e78-32f1-70e4-cc73-76dc2c4ddb3b@tootai.net>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="Yes"
To: 
Cc: netfilter@vger.kernel.org


Citát Daniel <tech@tootai.net>:

> Hello
>
> Le 05/10/2020 à 08:16, azurit@pobox.sk a écrit :
>> Anyone?
>>
>>> [...]
>>> iptables: No space left on device.
> Perhaps this ...


Sorry but i don't understand. What do you mean?

If you are talking about error message 'No space left on device.' then  
there is definitely LOTS of space on all devices, that's why i wrote  
that this error message is 'weird'. Anyway, iptables/nftables has  
nothing to do with storage, so it still would be weird if there's  
really no space left.


