From: budi wibowo <bwibowo@gmail.com>
Subject: Re: router and masquerade
Date: Thu, 12 Sep 2013 11:29:25 +0700
Message-ID: <CAKnRR0bfVCa9x_cXSmzp2kV4TggC_3ckiMHmqgF3cZDw4cB=fw@mail.gmail.com>
References: <CAKnRR0ZrEyKL1oQTLiP8AoWhoC7kyTajbzboHdPn6-9RLxoBtA@mail.gmail.com>
	<523088AA.3050509@saasplaza.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=b+luo66QAp7t3mbxmoWerIZzC2tfI6RpCll0vBRl01E=;
        b=rTal0k4PfQ9/JdVZsV88RHNRu0LRoYYkzhZBav/ENamI5OJ7sbqxfKL9jfFsIKiyQz
         FqI9MXE/Ast0m0k3wnTz8Z+/AiyYuxsiJdRwNTvvbnj4ILV3j+CfgIV3X6AMjXxT38T2
         dylkLrY+dYjeINW+LBc4a9AUGfuYAIA0F+vYPJMXoeKCKllYm1X0y9RmRTu2npnkBs0g
         HzFiRVdxZADXubOLVytJQq69r8vTftWapOMKQ5arqcNWKfLfqxnYkvrmoi6vdv2Kss6d
         HqwuOKvvZNOwh7ws+JWVRpaigR6enQVVvhs4zBVX02l9TQb9W02XjdMNAcx3MajbpEi4
         yJVw==
In-Reply-To: <523088AA.3050509@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

outside IP is 8.8.8.8 google DNS.
the ubuntu running BIRD for BGP and bgp connection is established.
for ubuntu all search result after enable ip forwarding then do masquerade.
and then i conclude that ubuntu cant be used as BGP core router, only
can do routing is interface is masquerade.
change OS to freebsd 9.1 and everything is working perfectly.
Bird is working and no Nat required


On Wed, Sep 11, 2013 at 10:13 PM, Tom van Leeuwen
<tom.van.leeuwen@saasplaza.com> wrote:
> With "outside" you mean an ip on internet?
> What IP address does your client have that you don't want to MASQUERADE.
>
> Sounds like the outside world doesn't have a route to get back to your
> client.
>
> Regards,
> Tom
>
>
> On 09/09/2013 01:41 AM, budi wibowo wrote:
>>
>> Hi
>> i have question and i hope the question is on the right list .
>>
>> i setup PC router running on ubuntu 10.12, since it is router all IP
>> address are public IP.
>> Topology will be like this
>>
>>
>>
>> Router_to_Intl             Router_to_local_IX
>>         |                                   |
>>         |                                   |
>>         |                                   |
>>         |                                   |
>>          \                                 /
>>            \                              /
>>              \                           /
>>                \                        /
>>                 \                     /
>>             Distribution Router
>>                           |
>>                           |
>>                      Client
>>
>> on Router_to_Intl i have define rule to ACCEPT all INPUT OUTPUT and
>> FORWARD
>> chain, also have enable ip_forward in sysctl.
>> the result is client cant ping outside, but when i define MASQUERADE, ping
>> and connection to internet are working normally.
>> i dont want masquerade happen in this case
>>
>>
>> anything missing on my configuration?
>>
>> Regards
>>
>> Budi Wibowo
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
