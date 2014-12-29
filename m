From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: Logging for NAT information with ULOG/NFLOG/LOG
Date: Mon, 29 Dec 2014 10:05:29 +0200
Message-ID: <CADtGFvmFCTc4y2iRQgRStgHNVNCe5Uk7sDaSCpL=6e+xqtcr=A@mail.gmail.com>
References: <CADtGFv=6U6U8Aosvz=rN-Wv8Bk-Ag=LMCXHLCXU99udTmdnymA@mail.gmail.com>
	<CAPJdpdDB7kPomtJGwG7=ZGMT-KyX1-0YGUp-gLJjtn_yzE6VBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=G8WRrvQLgGrbcYs3ArGDY/c89kZEclph/1GF+InGYJQ=;
        b=GNzq+GYZsDVOkfvDJNykyftqcZMN7tqDrp0IXO5BdhVYkrT1v8gEt2p6fYql/DKzbp
         p0xecTM4GicUiWIceCRo7SBpgedTbrdLJ4JyOWjUQIfulmjF7nmr7zV0upqMmJwkkZ9Z
         AzyYtwuQ8vxbbA85GokWUE77AWfd/NrJHHo4A9q1RMoS+x7uzQ8D45P6mBoWFpFm1RiA
         q7Pv5dPFet4YYhieHVWj2JuJL76Y90ka2jmDKMNcgYeXYsnSgAYoy7oOHSq648qbDVUC
         kZXDfVpIDpwAOEwjySqXEEEV/RJYUH7ZRuqMNkDeUwTOZPuG3g4MZ8Ldo8o7e+l4MpkD
         1Z2Q==
In-Reply-To: <CAPJdpdDB7kPomtJGwG7=ZGMT-KyX1-0YGUp-gLJjtn_yzE6VBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Sun, Dec 28, 2014 at 11:51 PM, Paul Robert Marino
<prmarino1@gmail.com> wrote:
> this is something ive been planing to look at for a while but havent
> had the time https://metacpan.org/pod/distribution/Net-Netfilter-NetFlow/bin/nfflowd
> this converts conntrack data into netflow data then you should be able
> to use any compatible netflow collector to d what you need.

Hmmm, still not optimal, as you have to still correlate three flows to
get the return (inbound) traffic matched to the relevant internally
NATted IP.

I'm more thinking of proposing a NetFlow V5+/V5bis/V10 to cater for
the NATting phenomena.

Have been giving me food for thought in solving/tracking my troubles,

>
> On Sat, Dec 27, 2014 at 5:02 PM, Hendrik Visage <hvjunk@gmail.com> wrote:
>> Hi there,
>>
>>
>>  I'm in need to track internal NATted/masquaraded IPs bandwidth
>> utilization, mapped to which outbound interface was used as I have
>> multiple outbound routes/interfaces as well as transparent caching as
>> an encore, and I need to account for the bandwidth used by the
>> firewall/server too as some service runs on it too.
>>
>>  What I'm looking for, is something like conntrack -L output, but for
>> each packet in each direction with it's input, output interfaces and
>> size, preferably logged via ULOG/NFLOG mechanism and not the kernel
>> logging method.
>>
>>  Any advice on how to achieve this?
>>
>> Thank you
>> Hendrik VIsage
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
