From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptaccount/shaping
Date: Thu, 1 Sep 2011 22:44:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109012241510.8863@frira.zrqbmnf.qr>
References: <1314894806.28901.574.camel@worklian.computerisms.bob>  <20110901201918.390de5b4@catus> <1314906476.28901.608.camel@worklian.computerisms.bob>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1314906476.28901.608.camel@worklian.computerisms.bob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Miller <bob@computerisms.ca>
Cc: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org


On Thursday 2011-09-01 21:47, Bob Miller wrote:
>> You should get something like this:
>> 
>>     RX: bytes  packets  errors  dropped overrun mcast   
>>     714301652  713443   0       0       0       3494   
>>     TX: bytes  packets  errors  dropped carrier collsns 
>>     79328329   501677   0       0       2       0
>> 
>> Stats show actual data sent/received (since reboot) including layer2
>> headers. Gathered data should exacly match your isp stats.
>> 
>When I ran the command I found my numbers didn't add up to even close to
>what bandwidth usage should have been since last reboot, and a bit of
>investigation says that is because the byte count will wrap.

On 32 bit it may.

>This will
>require some creativity to use this tool properly, but should provide at
>least some of the answers I seek.

Don't try to parse that. While ip(8) in general is more
parser-friendly than the old tools, and while ip also has an -o
option that is even more parser-friendly, it fails to DTRT with
statistics. You can use /sys/class/net for probably the most
parser-friendly interface.
