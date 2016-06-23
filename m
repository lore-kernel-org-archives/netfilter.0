From: "Irwin L." <biatche@gmail.com>
Subject: Re: nftables: drop ssh brute force with ip block
Date: Thu, 23 Jun 2016 18:55:31 +0800
Message-ID: <576BC023.4040001@gmail.com>
References: <5766E34B.4040008@gmail.com> <20160623103430.GA10616@salvia> <576BBC72.8030507@gmail.com> <20160623104847.GA18850@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=9jsRNFoqxIskVgs6iRqGVCWi9kG2pmB91xyk9KyAHt4=;
        b=yRT5lTz6KGzH+NOZ7yWK28TWI7i8T9B+YO7fknKWduPjZ2GXTdqZUO09U3OqxyXwLq
         jFAixSIkhXnwnqP9fZHX+6zhlrSFchnVPo6NVFKLzkMFjgpr6LLoPjaxcZ40uhDJLtMy
         m+YPQUzJRctKXsk38E/94i+/bhFaxxWpep5CNSrjGngvoi5tyzdsgZFlukZb/ECJFRlV
         x8y0ZMbuX2My3NdjrD64ER3SMe8mtklShjT+BID3fmAT2rMv1xJnDX3Z+urMob9A+dIR
         Jd1uaaQ0J5H8/2zKxzAC9aDxHHIeF+BhCOi3sB2F0ormDPVR2jZKDkDCJ2mIzVA63SBL
         iu5g==
In-Reply-To: <20160623104847.GA18850@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 2016-06-23 18:48, Pablo Neira Ayuso wrote:
> On Thu, Jun 23, 2016 at 06:39:46PM +0800, Irwin L. wrote:
>> I currently use:
>> tcp dport {22222,40022,42222} ct state new counter flow table bruteforce {
>> ip saddr limit rate 3/minute } counter accept comment "limit bruteforce"
>>
>> Is this ok?
> Looks good to me. I would probably check for ct state new in first
> place, given that this only matches the first packet a new TCP
> connections. It will save you the tcp dport set lookup.
>
> Note that you can even limit this per port, ie.
>
>          ct state new tcp dport {22222,40022,42222} counter \
>                  flow table bruteforce { ip saddr . tcp dport limit rate 3/minute } \
>                          counter accept comment "limit bruteforce"
>
> using the 'ip saddr . tcp dport' concatenation. But I guess you want
> globally ban anyone spamming you to those ports anyway.
>
>> I wanted to ban spamming ips altogether, but I've since learned that this is
>> the job of 'fail2ban'
> fail2ban is nice to have to simplify this administrative hassle, but I
> think it is still using iptables (it's been a while a I didn't look at
> that code), we can do much better now with nft to resolve this problem.

By that do you mean "counter ct state new" instead of "counter flow table" ?

Thing is with this method, it only limits, I wonder if nft can blacklist 
the ip for 1 day or even 1 week with the option of manually removing 
blacklisted ips manually.

