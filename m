From: azurit@pobox.sk
Subject: Re: nftables cgroup accounting problem
Date: Mon, 05 Oct 2020 11:11:41 +0200
Message-ID: <20201005111141.Horde.JPWYzrpCsWRxYJi-Q4R57se@webmail.inetadmin.eu>
References: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
 <5fb80e78-32f1-70e4-cc73-76dc2c4ddb3b@tootai.net>
 <20201005101543.Horde.lVls9cH0kEjRR1pS_9eR4E2@webmail.inetadmin.eu>
 <3590b54d-0556-273d-862f-4483487b0a60@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=dkiminetadmin;
        t=1601889102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cK27rpYio+4zZPuSqxiemTVt/CynBwGBiIUp+65UNOs=;
        b=neLFQ7NRngeC9DZYQG9y3xYjLjTiY3kNooCO9SXGFhdh0pyKH/VX6cxh9opumzzg+VwWWS
        JbRFWY/Q+ghGY5tSE1TNCQf4+2VQMxvFonh7ZGT7er/mNC98At4iPXWVXlop3era13wi/5
        /4Fmj6Obi1Bo1fpwbQwdnqQgmNhPdas=
In-Reply-To: <3590b54d-0556-273d-862f-4483487b0a60@tootai.net>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="Yes"
To: 
Cc: netfilter@vger.kernel.org


Citát Daniel <tech@tootai.net>:

> Le 05/10/2020 à 10:15, azurit@pobox.sk a écrit :
>>
>> Citát Daniel <tech@tootai.net>:
>>
>>> Hello
>>>
>>> Le 05/10/2020 à 08:16, azurit@pobox.sk a écrit :
>>>> Anyone?
>>>>
>>>>> [...]
>>>>> iptables: No space left on device.
>>> Perhaps this ...
>>
>>
>> Sorry but i don't understand. What do you mean?
>>
>> If you are talking about error message 'No space left on device.'  
>> then there is definitely LOTS of space on all devices, that's why i  
>> wrote that this error message is 'weird'. Anyway, iptables/nftables  
>> has nothing to do with storage, so it still would be weird if  
>> there's really no space left.
> This message also appears if you run out of inode. Run df -i to check
>
> -- 
> Daniel




# df -i
Filesystem       Inodes   IUsed    IFree IUse% Mounted on
/dev/root      19660800  326821 19333979    2% /
devtmpfs        1020722     347  1020375    1% /dev
tmpfs           1021029       1  1021028    1% /dev/shm
tmpfs           1021029     640  1020389    1% /run
tmpfs           1021029       4  1021025    1% /run/lock
tmpfs           1021029      17  1021012    1% /sys/fs/cgroup
/dev/vdd        2621440   60315  2561125    3% /flash
/dev/vdc       19660800 3999257 15661543   21% /home
tmpfs           1021029      10  1021019    1% /run/user/0




# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       296G  9.8G  274G   4% /
devtmpfs        3.9G     0  3.9G   0% /dev
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           3.9G  387M  3.6G  10% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/vdd         40G   24G   16G  60% /flash
/dev/vdc        295G  214G   81G  73% /home
tmpfs           798M     0  798M   0% /run/user/0


