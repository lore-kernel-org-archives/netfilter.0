From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: nftables
Date: Tue, 28 Apr 2020 11:45:38 +0300
Message-ID: <19b20b79-a741-68fa-56da-0e0c16c6d08b@gmail.com>
References: <c8a517b2-3e1e-f7f5-53d6-b3e4daf638bc@gmx.de>
 <16ac0a06-b73e-dd66-c858-ae9ea26034d6@gmail.com>
 <169e18be-82c8-47b7-2ca6-44e03c86eebd@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=qmdFC8b6+paBLvYQH+BFaMC13zDn7/vJlGZ3dQPcFFI=;
        b=JpwlEOT996/YUjXbpeDFHrZrrb7c6HYhalr7e4i0B+YIEoys0LGuYusx78ABna1lOr
         pvXMb7iBbC4vcv6f6wDXsovZbFCchgQO9X5AQOzBoU/8PRgNAx6p4bVnvAZQFKwc5V4Z
         S/7HEiQWEOBKOcTE1ia3WV6WgzsMiDG+uMFExDz2/iGo4a8Nbg9WXYPasCeG7vSa9r1U
         RyWuenLOanNM5TqVFsQTUBNIhJFBTfTm1a9hFii4Wn9VEOzEaisKpSldltN8sCK/IjDY
         hVpEzu8qG4ZQgmbK5IQ7euo9pf0nF6vZGxjN90NX+6yhguR7wqVHDZUTzEGOcJH0n6Bw
         hm6w==
In-Reply-To: <169e18be-82c8-47b7-2ca6-44e03c86eebd@gmx.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Greiff <Patrick7878@gmx.de>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

http://wiki.nftables.org/wiki-nftables/index.php/Scripting

I think you should follow this guide and I send to example link to below.

https://github.com/chr0mag/geoipsets


Fatih USTA

On 28.04.2020 11:33, Patrick Greiff wrote:
> hi many thanks i was looking for that :)
> have a few more questions. I am still a beginner in the field and so I
> just learn ^^.
> I created nft add set ip filter blackhole {type ipv4_addr \;} and
> introduced an ip. but where is this file located?
> nft add rule ip filter input ip saddr @blackhole drop do I have to add
> this to my main.conf? or in the standard nftables.conf.
>
> Am 28.04.2020 um 09:50 schrieb Fatih USTA:
>> Hi
>>
>> You can use sets in nftables like iptables ipset.
>>
>> http://wiki.nftables.org/wiki-nftables/index.php/Sets
>>
>>
>> Fatih USTA
>>
>> On 28.04.2020 10:38, Patrick Greiff wrote:
>>> Hi everyone,
>>> i have a question about nftables.
>>> at iptables i had a blacklist where i wrote in the ip that wanted to
>>> hack me.
>>> how can I integrate something into nftables? and also restart when the
>>> ips are updated.
>>>
