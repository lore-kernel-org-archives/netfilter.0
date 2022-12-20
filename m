From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 20:41:12 +0100
Message-ID: <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 20.12.22 um 20:34 schrieb ToddAndMargo:
> On 12/20/22 11:31, Reindl Harald wrote:
>>
>>
>> Am 20.12.22 um 20:00 schrieb ToddAndMargo:
>>> Hi All,
>>>
>>> $ uname -r
>>> 6.0.12-300.fc37.x86_64
>>>
>>> Since kernel 6.0.1,
>>>     /proc/sys/net/netfilter/nf_conntrack_helper
>>> has been removed.
>>
>> the deprecation warning dates back many years
> 
> Do you have a link to that?  I could not
> find one.

i read my syslogs / dmesg and that article is 9 years old: 
https://gitlab.alpinelinux.org/alpine/awall/-/issues/1540

dmesg: nf_conntrack: automatic helper assignment is deprecated and it 
will be removed soon. Use the iptables CT target to attach helpers instead

>>> This breaks passive ftp.
>>>
>>> What do you guys do to work around the problem
>> iptables-nft -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
> 
> What is Jump to CT "-j CT"?

https://gitlab.alpinelinux.org/alpine/awall/-/issues/1540
