From: Payam Chychi <pchychi@gmail.com>
Subject: Re: What is so special about 172.31.254.254
Date: Wed, 04 Apr 2012 09:05:36 -0700
Message-ID: <4F7C7150.4040401@gmail.com>
References: <4F7C6804.8090702@freemail.hu> <4F7C6EEE.4090305@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1XAA/+9MdMTMV/2XyALMhcyJpk5I5gpNHmG/76BRkEo=;
        b=FpOyEzcwavqSS1IyJUvFgJGGzR4+oCLJQDFF52ZGRIRY9FWOvfdo637YesVZn9SvtT
         I0qfWmxCvC3nONXEzG/r4zLVFdlXBqROqmriNYDgh/ZkqTB01bK76L/FIAcHk5WjxSDw
         E70huRHkffrLnEsEm0B/oOYlRGC2yoaocRc49wQWjLNlkdJyB89zvI0UkDc8qDe+Vx05
         Nla28GDbquBZWsn/nVeiNxHlQjYGSyc+FyAR/mqB9V/yJ6LQGNMJEORRWTKJhvpfFQOX
         vUjp2cx8rvJQ4ld+KvKP9m3+P+viRBTfJ4zhfG5nAJmTB8GnOagQoXC4HLweBNCOQI4x
         KCpw==
In-Reply-To: <4F7C6EEE.4090305@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mike Wright <mike.wright@mailinator.com>
Cc: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>

how are they "not" seeing each other? we talking on layer2, 3, 4, or 7 =
?
do you have a local arp table on the system showing the neighboring sys=
tem?
do you have a transparent firewall in between enforcing layer2 policies=
?
do you have arp-proxy or gratuitous arp setup on your devices?


-P



On 12-04-04 8:55 AM, Mike Wright wrote:
> On 04/04/2012 08:25 AM, G=E1sp=E1r Lajos wrote:
>> Hi list,
>>
>> I have a strange scenario.
>> For test reasons I had setup two PC-s.
>>
>> 1. 172.31.254.1
>> 2. 172.31.254.254
>>
>> Netmask 255.255.255.0
>>
>> They do not see each other...
>> But if I change the second IP (for example to 172.31.254.253) then i=
t
>> all good...
>>
>> What am I missing?
>
> Hi Swifty.
>
> Could it be that x.x.x.254 is somewhere defined as a default gateway?
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

