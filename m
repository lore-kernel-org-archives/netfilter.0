From: Daniel Lakeland <dlakelan@street-artists.org>
Subject: Re: nft icmp type all?
Date: Sat, 25 Jan 2020 18:24:30 -0800
Message-ID: <7f7b3f05-f0cf-1694-b61e-ab627fa4e176@street-artists.org>
References: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
 <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=street-artists.org; h=
        subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        street-artists.org; bh=TkaYayMZ5sib6PsOs7wpZyP9Qkc=; b=fe2kJlwzn
        6654A2ko8uvMXwhJh7LfLgon0l8sMWLt2ONliLdQKHtyOpW5gtEEUcCf+3FcluoH
        Uu/zq4E+uudkvaOeSAtP3FkJTLao43KCz+jTfz3hjX4K2n+PC84VJLkQ63yaiChD
        19ibvFZeOHEKcvsWq4BaAIgsgTvdJyBrw0=
In-Reply-To: <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kfm@plushkava.net, netfilter@vger.kernel.org

On 1/24/20 1:29 PM, kfm@plushkava.net wrote:
> On 24/01/2020 21:16, Robert Sander wrote:
>> Hi,
>>
>> how do I specify a rule to match all ICMP packages?
>>
>> nft add rule ip filter input icmp accept
>>
>> does not work.
>
> nft add rule ip filter input meta l4proto icmp accept
>
I think this also works:

nft add rule ip filter input ip protocol icmp accept


