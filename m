From: AllKind <AllKind@fastest.cc>
Subject: Re: [ANNOUNCE] ipset 6.21 released
Date: Wed, 05 Mar 2014 08:04:49 +0100
Message-ID: <5316CC91.2080704@fastest.cc>
References: <alpine.DEB.2.10.1403042207250.17838@blackhole.kfki.hu>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=IH87DaL9FzSvh5s98htvDydpwgk=; b=ObNp7FDLC2RaaPBTJ/
	eWqtoG5c1NM41tnkFuYRk/wqMRtmG8+E1ZSubo1qcjkmXnJiRHHUVCQrlhT668Dk
	cpAD1xfKalVa1CO+W1tBC3zFPBWQY2Wzk5E5zJOC0wkWGO/k6FDwXg5GuBFlK99/
	+7++v1MBVMyZTmW88V2LJsNvk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=IH87DaL9FzSvh5s98htvDy
	dpwgk=; b=lEMdQ8OizARIR9xg1w4xyiKznXFoWmi+VBbk4OrZgf8lEdeJV2t1ZF
	X1sxOpRtY5bLp7noTx7ivm+KjuyOSGCFPFx9zxlQ/X1b0QQ1Izv6WB2ueTdj8mAV
	T8n/8FpV8D7MVEX5nuqVAlNEOVtHIVBoPTfB0E93uPamVmWDTxlCE=
In-Reply-To: <alpine.DEB.2.10.1403042207250.17838@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On 04.03.2014 22:12, Jozsef Kadlecsik wrote:
> Hi,
>
> I'm happy to announce ipset 6.21, which, besides bugfixes and corrections,
> includes the new set type hash:ip,mark from Vytas Dauksa and the forceadd
> option from Josh Hunt. See the updated manpage about these new features.
[...]

Hello,

unfortunately the utils were not updated with this release.

You can download the newest version of ipset_bash_completion including 
markmask and forceadd support from here:

https://sourceforge.net/projects/ipset-bashcompl/files/latest/download?source=navbar


Also a newer and more powerful version of ipset_list is available here:

https://sourceforge.net/projects/ipset-list/files/latest/download


Something that also might be useful to you is the current development 
version of iptables-bash_completion, which includes the features that 
are currently only available via the netfilter git repository:

https://sourceforge.net/p/ipt-bashcompl/code/ci/dev/tree/

Best regards

AllKind

