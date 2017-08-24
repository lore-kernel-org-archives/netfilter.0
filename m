From: "Walter H." <walter.h@mathemainzel.info>
Subject: Re: IPtables and String Match
Date: Thu, 24 Aug 2017 15:43:43 +0200
Message-ID: <3a248eba3eb07108aa34a1f83a456bee.1503582223@squirrel.mail>
References: <3c4797dd17135f05badc81d9656c7e86.1503579504@squirrel.mail>
    <20170824102624.7b0ded11@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:Message-ID; bh=rZyVetzTq/cg4FjyWSiepIhRPXDNYe/YL4AlVy31MnM=;
        b=j35X5qRjPIEqz3MblNGQoB9BWNl9YrencTp4w/uLEQT9pTZXKQjRFZkjKi5gKR+au2dA3YyuGrr6AZqxqSKUKsd2Qaul0I8GeRR/hFnzIpVNpbDqSTOCj+/maHYVFfSoqIJYWiiyh+kD5mgDYlV0go5UC8GORXBq5gl0Vpg6qe8=;
In-Reply-To: <20170824102624.7b0ded11@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On Thu, August 24, 2017 15:26, Ethy H. Brito wrote:
> On Thu, 24 Aug 2017 14:58:24 +0200
> "Walter H." <walter.h@mathemainzel.info> wrote:
>
>> Hello,
>>
>> -N VERIFY-HTTP
>> -A VERIFY-HTTP -m string --to 61 --algo bm --string "GET /w00tw00t.at."
>> \
>>                         -j LOG --log-prefix "IP[HTTP-SCAN]: "
>> --log-level 7
>> -A VERIFY-HTTP -j ACCEPT
>>
>> and
>>
>> -A INPUT -i eth1 -m tcp -p tcp --dport 80 -m state --state NEW -j
>> VERIFY-HTTP
>>
>> I would expect that HTTP requests like
>>
>> wget http://thishost/w00tw00t.at.SANS
>>
>> would be logged, but it isn't
>>
>> why?
>
> Hi Walter.
>
> In a perfect world, "NEW" tcp packets does not carry any payload.
>
> "NEW", on a tcp streeam, is supposed to match the "SYN" package or the
> first on
> a "malformed" tcp stream. (more info at
> http://www.iptables.info/en/connection-state.html and many others)
>
> You should try something like:
>
> -A INPUT -i eth1 -m tcp -p tcp --dport 80 -j VERIFY-HTTP
>
> (not very effective since every packet will be scanned. I do not know what
> are
> your goals here and http servers is not may area of expertize but doesn't
> your
> http server has some traps to this?)
>
> regards
>
> Ethy
>
>
>
this doesn't work either ...

-A INPUT -i eth1 -m tcp -p tcp --dport 80 \
 -m string --to 61 --algo bm --string "GET /w00tw00t.at." \
 -j LOG --log-prefix "IP[HTTP-SCAN]: "
-A INPUT -i eth1 -m tcp -p tcp --dport 80 -m state --state NEW -j ACCEPT

but the strange thing, I have 3 identical (same Linux Distribution:
 CentOS 6, latest updates),
on two of them (these are virtual servers at webhosters) this works,
and one is phisical host (my router) this doesn't work ..., and I don't
know why ...

of course the webserver has logging facility, but the goal of this is
to replace -j LOG ... with -j DROP

Thanks,
Walter

