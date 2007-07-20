From: Patrick McHardy <kaber@trash.net>
Subject: Re: even hash tables sizes, FAQ entry
Date: Fri, 20 Jul 2007 19:50:37 +0200
Message-ID: <46A0F5ED.5010207@trash.net>
References: <469FE2DC.90300@relevad.com>	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>	<469FF52F.5010301@relevad.com>
	<20070719234741.GB17253@internet24.de>	<Pine.LNX.4.63.0707191712150.23721@qynat.qvtvafvgr.pbz>	<20070720074134.GB17809@internet24.de>
	<Pine.LNX.4.63.0707201044390.24729@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0707201044390.24729@qynat.qvtvafvgr.pbz>
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
Content-Type: text/plain; charset="us-ascii"
To: David Lang <david.lang@digitalinsight.com>
Cc: netfilter@lists.netfilter.org

David Lang wrote:
> On Fri, 20 Jul 2007, Thomas Jacob wrote:
> 
>> On Thu, Jul 19, 2007 at 05:13:11PM -0700, David Lang wrote:
>> [..]
>>
>>>> Is this still true? What is the reason for this? And: Does
>>>> any odd hashtable size work as well as other odd hash tables sizes
>>>> in the same order of magnitude?
>>>
>>>
>>> changing conntrack_max is not chaning the hash bucket count, that change
>>> can only be done in the code or as a module parameter at module load
>>> time.
>>
>>
>> Sure, I meant odd hash bucket counts of course, so is this
>> FAQ still accurate?
> 
> 
> as far as I know.


None of this is :) hash_buckets can be changed at runtime through the
sysfs module parameter and the size can be chosen arbitary, in fact
the current -git tree will round it up to the next multiple of
PAGE_SIZE / (sizeof(struct hlist_head)) to avoid memory wastage.

