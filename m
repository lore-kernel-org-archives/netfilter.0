From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Fri, 11 Jan 2013 09:19:13 +0100
Message-ID: <50EFCB01.3070008@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net> <20130109115232.GA19321@1984>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=GpynhLFJ/KKkBi7T2Pb+mHGOtek=; b=GmAQZlTbik6Jf0fb0g
	hnGWsrJXf9OmEJPMyH3v18x8JiAuVz9mvE+WaHp+cmrkefcL2+nUydgycBb6avXm
	IY7pIYSyy8MYfoFQ4P2I+iBqBjmBikfeUwKKRF7tVCHnnL4VqZgZcODANfTl3fJq
	jjxp94DTqPNrr5HwdPALifAZ0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=GpynhLFJ/KKkBi7T2Pb+mH
	GOtek=; b=UEvnFZnP4b5hvna6IPBevMhDfE7U2fFjlcufCfcNeML5SdiLOz79g7
	NkTy73S8VEWJDFpQRLMZsharMY2KAdWSqcKnmRNdN8nxIdyBv3SRJq9ZTG3Y3dk1
	EXtWLi3LhjQghQ9PTa3+DIABaUsGk5nXJ+6x6P/bvom2Lqy5w8QLI=
In-Reply-To: <20130109115232.GA19321@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 09.01.2013 12:52, Pablo Neira Ayuso wrote:
[...]
>>>> On Sunday 2013-01-06 04:50, Born Without wrote:
[...]
>>>>>>> I wrote a little wrapper script (for the bash shell) to support them.
>>>>>>> For those who like, you'll find it attached.

[...]

> And if you use the same license than ipset, it may help Jozsef to
> consider adding that to some contrib directory. Or you can just
> publish it in your personal website.

for the ease of use and maybe a good place to store, it's now on github 
also:

https://github.com/AllKind/ipset_list

Best regards

