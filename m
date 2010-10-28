From: Sandro Tosi <sandro.tosi@register.it>
Subject: Re: netfilter stats, info and resources usage
Date: Thu, 28 Oct 2010 12:01:52 +0200
Message-ID: <4CC94A10.7010306@register.it>
References: <4CC83A67.1010202@register.it> <alpine.LNX.2.01.1010271827050.14500@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010271827050.14500@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Jesper Dangaard Brouer <hawk@comx.dk>

Hello, thanks for the reply.

On 10/27/2010 06:32 PM, Jan Engelhardt wrote:
> On Wednesday 2010-10-27 16:42, Sandro Tosi wrote:
>
>> we are using quite a lot iptables and we'd like to gather some
>> stats/information to "what's doing" and hopefully also an idea of the resources
>> used by it (in particular cpu and ram).
>>
>> 1. http://forums.cacti.net/about36629.html
>> 2. http://forums.cacti.net/about26714.html
>> 3. http://people.netfilter.org/hawk/DDoS/2010-04-12__001/list.html
>>
>> 3 is very interesting, Jesper: how did you generate it? :)
>
> JFYI, There is a lot of conntrack in there besides routing and general
> machine and interface characteristics - not much Xtables to see.

I'm not sure to get your reply right, but I'm actually open to any 
statistics for KPI of iptables/netfilter/conntrack/whatever - I just 
would like to retrieve meaningfull information about netfilter "stack" 
on these machines (and graph them, but that's unimportant here).

What I'm looking is cpu usage, and actually what netfilter does after I 
add a rule to it via iptables. I think of cpu usage since I have 
recently added rules that inspects the content of pkgs (using 'string' 
module) and we'd like to understand what's the impact of that. Also, 
having meaningful information of the netfilter operations can give us a 
better understanding of the machine status/usage.

I reported those 3 links because they are actually extracting 
information from what the kernel exports about NF on /proc fs, but I 
can't seem to find any info about what those values are (f.e. 
/proc/sys/net/netfilter/nf_conntrack_count reports ~7500 conns while 
'netstat -putan | wc -l' only ~3000, why that, what's the meaning of the 
values graphed and so on).

Thanks in advance,
-- 
Sandro Tosi
Product Engineer
Linux based Solutions
Hosting Products
R&D | Dada.pro
sandro.tosi@register.it
