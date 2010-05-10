From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Mon, 10 May 2010 12:48:02 +0200
Message-ID: <cone.1273488482.7686.21362.1000@north>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273488482; bh=7QKdRrmHjJQoDO/0WZxQuDiX5adO9D+0FzvxqT5Q1t0=;
	l=1000;
	h=References:Message-ID:From:To:Cc:Date:Mime-Version:
	 Content-Transfer-Encoding;
	b=jSoH/EAxebGG0Hx9OJtbHM2h1MQpo8Z3TPxIJmpnuNsEyRh5JQX/iIuzw43sQ71ur
	 xwrhCi4Lz7DiYs24TvCsZMQ964XSXj7YnZcZ4dfhwfheSzv9u+Dz8e7mBWVHoW6A6M
	 waFUuamK+ESHFf1FMV34GgWfM+g3xzhibUGRm22o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: David F <netfilter@meta-dynamic.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

David F writes:
> Pablo Neira Ayuso wrote:
>>
>> I have applied the following patch. I think that, at least, new users
>> will not hit this problem again. I'm very sorry that this was not fixed
>> before. Let me know if you are OK with it, we're still in time to revert
>> the patch attached.

Waiting one version before deprecating might allow smoother changing.

> For what it's worth, I had previously prepared this patch which just 
> clarifies the documentation on this parameter.  I think it still has 
> value since I also added some missing return-value docs and changed the 
> descriptions of a few parameters that I had found to be confusing.

Good work. Is the (current) generated doc available? I've found an older 
version in http://www.nufw.org/doc/libnetfilter_queue/

I attach a patch aimed at fixing the example, which is confusing, since rv 
can simultaneously be != 0 and >= 0 only if it is > 0. I haven't resisted 
an attempt at enumerating verdicts, though.

