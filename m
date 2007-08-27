From: David Lang <david.lang@digitalinsight.com>
Subject: Re: netfilter optimization.
Date: Mon, 27 Aug 2007 09:48:34 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0708270948160.4742@qynat.qvtvafvgr.pbz>
References: <20070825232124.GA26316@internet24.de>
	<57F9959B46E0FA4D8BA88AEDFBE5829024F4BC@pxtbenexd01.pxt.primeexalia.com>
	<20070826105855.GB15249@internet24.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070826105855.GB15249@internet24.de>
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

On Sun, 26 Aug 2007, Thomas Jacob wrote:

>> net.netfilter.nf_conntrack_max=1048576
>> net.netfilter.nf_conntrack_buckets=1048576
>>
>> But it only does for nf_conntrack_max.  I did overwrite it by going to
>> /sys/modules/nf_conntrack/parameters/hashsize and it did take it on the
>> second try.  The first time it complained about file descriptors.  The
>> second time it seemed to set it, which I verified by looking at
>> /proc/sys/net/netfilter/nf_conntrack_buckets.
>>
>> Is there a way to set this on startup?
>
> Oh yes sorry,  you can't set it in sysctl.conf then, since the
> module must probably already be loaded if you can use that. Try
> the module load parameters instead (options ip_conntrack hashsize=XXXX
> in /etc/modprobe.d/somefile worked in older kernels).

how can you do this if you don't use modules?

David Lang


