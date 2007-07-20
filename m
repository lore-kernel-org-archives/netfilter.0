From: David Lang <david.lang@digitalinsight.com>
Subject: Re: need advice for high traffic network
Date: Fri, 20 Jul 2007 10:51:59 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0707201044550.24729@qynat.qvtvafvgr.pbz>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com> <20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com> <20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com> <20070719234458.GA17253@internet24.de>
	<469FFF4B.5030704@relevad.com> <20070720074854.GC17809@internet24.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070720074854.GC17809@internet24.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@lists.netfilter.org

On Fri, 20 Jul 2007, Thomas Jacob wrote:

> On Thu, Jul 19, 2007 at 05:18:19PM -0700, Konstantin Svist wrote:
>> alright, so far I have:
>>
>> net.ipv4.tcp_window_scaling = 1
>> net.ipv4.tcp_syncookies = 1
>> net.core.rmem_max = 16777216
>> net.core.wmem_max = 16777216
>> net.ipv4.tcp_rmem = 4096 87380 16777216
>> net.ipv4.tcp_wmem = 4096 65536 16777216
>> net.ipv4.tcp_no_metrics_save = 1
>
> AFAIK those values do not influence netfilter performance,
> just local tcp socket performance.
>
>> net.ipv4.netfilter.ip_conntrack_max = 1024000
>>
>>
>> what would you recommend for the buckets? is default (8192) reasonable?
>
> At the moment I am always setting this to the value of ip_conntrack_max
> (on the theory that this should result in constant lookup times), as I
> can spare the memory. But I haven't run any real performance tests with
> lower hash bucket counts....

you should run the tests. doing a hash across too many buckets ends up costing 
performance as well.

you want the list per bucket to not be too long, but you also don't want to 
spend more effort and ram on empty buckets.

setting conntrack_max equal to the number of buckets doesn't mean that you will 
have one entry in each bucket, it means that you will have a lot of empty 
buckets and other buckets with several items in them.

hash algorithms have collisions (cases where different input generates the same 
output) cryptographicly strong hashes mean that it's really hard to create a 
second input that results in the same output as some other existing input. but 
collisions do happen there.

> The FAQ says though, that one should use odd hash bucket counts, so you
> might want to decrease that by one.

it's not unusual for simple (i.e. cheap to use) has algorithims to have 
pathalogical results for specific sizes. ideally you want the bucket count to be 
a prime number, if it's not (for example a even power of 2) you can get 
situations where it only puts things in a very small number of buckets.

David Lang

