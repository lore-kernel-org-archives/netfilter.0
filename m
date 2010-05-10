From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue: mark-value byte ordering? --oops, pls discard
 previous copy
Date: Mon, 10 May 2010 16:54:27 +0200
Message-ID: <4BE81E23.7000206@netfilter.org>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com> <4BE7E519.7080600@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE7E519.7080600@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: David F <netfilter@meta-dynamic.com>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

Alessandro Vesely wrote:
> David F writes:
>> Pablo Neira Ayuso wrote:
>>>
>>> I have applied the following patch. I think that, at least, new users
>>> will not hit this problem again. I'm very sorry that this was not fixed
>>> before. Let me know if you are OK with it, we're still in time to revert
>>> the patch attached.
> 
> Waiting one version before deprecating might allow smoother changing.
> 
>> For what it's worth, I had previously prepared this patch which just
>> clarifies the documentation on this parameter.  I think it still has
>> value since I also added some missing return-value docs and changed the
>> descriptions of a few parameters that I had found to be confusing.
> 
> Good work. Is the (current) generated doc available? I've found an older
> version in http://www.nufw.org/doc/libnetfilter_queue/
> 
> I attach a patch aimed at fixing the example, which is confusing, since
> rv can simultaneously be != 0 and >= 0 only if it is > 0. I haven't
> resisted an attempt at enumerating verdicts, though.

Applied. Thanks.

Please, next time include a Signed-off-by tag, short description on the
patch and title, it makes it easier for me to apply it.
