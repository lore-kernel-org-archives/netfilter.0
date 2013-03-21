From: Nikolai Zhubr <n-a-zhubr@yandex.ru>
Subject: Re: [libvirt-users] netfilter+libvirt=(smth got broken?)
Date: Thu, 21 Mar 2013 14:32:17 +0400
Message-ID: <514AE1B1.4050203@yandex.ru>
References: <5149AFD3.2070108@yandex.ru> <5149BC91.4090502@yandex.ru> <20130321023046.GA4189@localhost> <514A7BFD.5060401@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1363861290;
	bh=mOlMl0RHFRCVdtIF4qfw3EAOmK/cSutwjaN5NbneBhg=;
	h=Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=K8L/Sp4PaIVYlZ31Dq2GqJk6aW1gPkK4/iGEL573zU6vtPSfbdD3S/E67+X0nUcEr
	 phrpOhHPXJZ8fcloxbzmiwcmJEYTOthtfytzk6W0th+EYv0Uihg8C/hoiltPJX9ATD
	 jrKE80oKJSNg3xVdG3Doc+CehWf1G/CULI50TU9M=
In-Reply-To: <514A7BFD.5060401@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Blake <eblake@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, libvirt-users@redhat.com, netfilter@vger.kernel.org

Hello all,
21.03.2013 7:18, Eric Blake:
[...]
>> --ctdir was broken and it was fixed in patch:
>
> In other words, the kernel folks made a silent change in ABI.  Eww.
>
> How can we reliably tell which kernels have the old behavior, and which
> have the new, so that libvirt knows which sense to use?

There are so many customized kernels in the wild with whatever mix of 
patches applied and whatever custom versioning involved that IMHO no one 
can now really know without some special flag added for that (other than 
try and see)

[...]
>> It's unfortunate nobody noticed this rule was incorrect so far (even
>> if it was working).

In this case I'd say it was rather just somewhat inconsistent with it 
own documentation. Not a big deal. IMHO it would be OK to just add a 
notice to documentation saying that "for historical reasons" behaviour 
is inverted, instead of changing the code in question to make it wrose.

Alternatively, upon noticing unwanted inversion, netfilter could just 
introduce some new correct --ctdir2 and subsequently depreciate and 
remove original --ctdir, allowing some time for adaptation.

>
> It's also unfortunate that the kernel folks did a silent ABI change,
> without offering any witness of which behavior is in operation.
>

Yes, netfilter is extremely valuable and extremely respected project. 
However, breaking the work of other people so easily, for almost no 
reason, without even a word of discussion and without any proposed way 
to relaibly handle the situation seems surprising at least. Huge number 
of people depend on netfilter, really! Sorry for some rant.


Nikolai
