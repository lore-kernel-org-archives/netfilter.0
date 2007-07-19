From: David Lang <david.lang@digitalinsight.com>
Subject: Re: need advice for high traffic network
Date: Thu, 19 Jul 2007 16:16:13 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0707191615490.23721@qynat.qvtvafvgr.pbz>
References: <469FE2DC.90300@relevad.com> <20070719224909.GA17077@internet24.de>
	<469FEB68.2070905@relevad.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <469FEB68.2070905@relevad.com>
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
To: Konstantin Svist <kostya@relevad.com>
Cc: netfilter@lists.netfilter.org

On Thu, 19 Jul 2007, Konstantin Svist wrote:

> as I said, the current (and default) value is 65536
> what would you suggest changing it to?

I have it set to 256000 on my low traffic boxes and 1024000 on my high traffic 
boxes.

David Lang

> Thomas Jacob wrote:
>>> I'l looking at nf-HiPAC right now - will probably try it some time soon. 
>>> Beyond that, I'm out of ideas for the moment.
>>> 
>> 
>> nf-HiPAC won't help there if you just have 25 rules
>> ( => http://people.netfilter.org/kadlec/nftest.pdf ), the problem is
>> very likely down to you using the default parameters for the conntrack hash 
>> table,
>> just like the other reply indicated.
>>
>> 
>
>

