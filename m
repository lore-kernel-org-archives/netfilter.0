From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 09:32:46 +0200
Message-ID: <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
 <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
 <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1624865567; bh=VQyOpnzQPTLmiKaqTv6MI6raTb+qh+FTliNfMQC/8LY=;
        l=1318; h=To:References:From:Date:In-Reply-To;
        b=Ce7a5dt0H35myS19jMusirXSlCXxT/xmXYB1VN6icAcqDzKR6RIjvnBnI7IBeIgRc
         l7LrgczsJvHPkhMeMH5S9MEae9WJu/kLtuQO7xzzHmS/dEfHuXPx0m92w12Ev/gR2j
         c/qD/YOUhFyQiynYILAPyHPe8xvv0xTWhoLE9oaY2LMYCf/ZELVI8uqpV+A+n
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On Sat 26/Jun/2021 12:43:45 +0200 Reindl Harald wrote:
>>>
>>> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
>>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>> /usr/sbin/sysctl -q --load=/etc/sysctl*.conf
>>>
>>> that way first all rules are loaded atomic and *then* "ip_forward" and 
>>> friends are set to avoid a leak at boot
>>
>> it may be good for you pro administrators with complex configurations...I 
>> have all in one file and do not need to bother about 1ms lost during reload 
>> nor seeking 10 different config files for simple tasks and wasting hours by 
>> config. I like easy life.
> 
> mixing things together which don't belong together like iptables and sysctl is 
> the opposite of simple as well as running a ton of commands at boot where it 
> should be a oneliner is also the opposite


I'm with David here.  Besides sysctl and ipset, there are lots of ip commands, 
modprobe's, vconfig, and a couple of home-brewed daemons (ipqbdb).  A soundly 
commented script captures the logic of the network and can be maintained with 
more coherence than raw commands accumulated along the way.  The only drawback 
is that most changes, for example punching a hole in the firewall, have to be 
applied twice, in the boot script as well as directly in a terminal.


Best
Ale
