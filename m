From: Konstantin Svist <kostya@relevad.com>
Subject: Re: need advice for high traffic network
Date: Thu, 19 Jul 2007 17:18:19 -0700
Message-ID: <469FFF4B.5030704@relevad.com>
References: <469FE2DC.90300@relevad.com>	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>	<469FE85B.3010502@relevad.com>	<20070719225931.GA17114@internet24.de>	<469FF100.5020509@relevad.com>	<20070719232836.GA17202@internet24.de>	<469FF52F.5010301@relevad.com>
	<20070719234458.GA17253@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070719234458.GA17253@internet24.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

alright, so far I have:

net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_syncookies = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.netfilter.ip_conntrack_max = 1024000


what would you recommend for the buckets? is default (8192) reasonable?




Thomas Jacob wrote:
> Hmm, not sure really, but lower TIME WAIT settings should keep
> your conntrack table afloat at least ;-)
>
> I'd rather increase ip_conntrack_max and ip_conntrack_buckets
> to the values suggested by David, 
>
>
> http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.7
>
> On Thu, Jul 19, 2007 at 04:35:11PM -0700, Konstantin Svist wrote:
>   
>> Sorry, I meant:
>> Which parameters are those and what values would you recommend?
>>
>> Thanks!
>>
>>
>> Thomas Jacob wrote:
>>     
>>> On Thu, Jul 19, 2007 at 04:17:20PM -0700, Konstantin Svist wrote:
>>>  
>>>       
>>>> How do I reduce those timers?
>>>>    
>>>>         
>>> echo <VALUE>  > /proc/sys/net/ipv4/netfilter/<SETTING>
>>>
>>>  
>>>       

