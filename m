From: Sandro Tosi <sandro.tosi@register.it>
Subject: Re: netfilter stats, info and resources usage
Date: Thu, 28 Oct 2010 15:47:23 +0200
Message-ID: <4CC97EEB.3020404@register.it>
References: <4CC83A67.1010202@register.it> <1288261736.29275.20.camel@firesoul.comx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1288261736.29275.20.camel@firesoul.comx.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jesper Dangaard Brouer <hawk@comx.dk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Jesper,

On 10/28/2010 12:28 PM, Jesper Dangaard Brouer wrote:
> On Wed, 2010-10-27 at 16:42 +0200, Sandro Tosi wrote:
>> we are using quite a lot iptables and we'd like to gather some
>> stats/information to "what's doing" and hopefully also an idea of the
>> resources used by it (in particular cpu and ram).
>>
>> Probably my google search karma is very low today, given the only
>> reference to CPU usage I could find was vague refs to softirq data, and
>> for stats some links like:
>>
>> 3. http://people.netfilter.org/hawk/DDoS/2010-04-12__001/list.html
>>
>> 3 is very interesting, Jesper: how did you generate it? :)
>
> I use the tool "rrdcollect" to sample a lot of different proc values.
>
> See the rrdcollect.conf config here:
> http://people.netfilter.org/hawk/DDoS/rrdcollect_scripts/rrdcollect.conf
>
> The RRD data files are created by a perl script.
>
> I have put the perl script here:
> http://people.netfilter.org/hawk/DDoS/rrdcollect_scripts/rrdcollect-create-datafiles.pl
>
> I use the tool 'drraw' to show the graph data, but I have not uploaded
> those files... Don't know if its the right tool for the job, but it was
> very easy to change things to start with, then when the number of graphs
> grew, it sort of got annoying to maintain via drraw.

Thanks a lot for sharing, I'll definitely look at this! but... is there 
some docs about what those values are? :) If I look at kernel 
Documentation/filesystems/proc.txt there's almost no doc about /proc/net 
let alone /proc/net/stat or conntrack.

Thanks,
-- 
Sandro Tosi
Product Engineer
Linux based Solutions
Hosting Products
R&D | Dada.pro
sandro.tosi@register.it
