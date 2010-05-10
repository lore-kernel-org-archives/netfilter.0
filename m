From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Mon, 10 May 2010 13:01:43 +0200
Message-ID: <4BE7E797.1020203@netfilter.org>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com> <cone.1273488482.7686.21362.1000@north>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cone.1273488482.7686.21362.1000@north>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
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

The deprecated version will wait there, I don't plan to remove it, I 
don't want to break any existing application. As for now, the 
deprecation will spot a warning during compilation and, if the developer 
reads the documentation, it will notice that is better to use the new 
version.

At least new users will take the new function instead of the deprecated 
one, I would expect.

I'll apply your patches once I arrive home, I'm planning to release 
libnetfilter_queue 1.0 after this round, this has been tagged as beta 
stage for so long. If you have more patches, let me know.

Thanks everyone!
