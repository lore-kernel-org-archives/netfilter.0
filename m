From: zrm <zrm@trustiosity.com>
Subject: Re: Attaching nfct timeout policy
Date: Thu, 15 Dec 2016 20:07:34 -0500
Message-ID: <cec10adc-1f04-9d13-a2bc-7a62e64ef499@trustiosity.com>
References: <a3a12638-9927-e514-f3f3-9ef28be31060@trustiosity.com>
 <20161215205315.GA3768@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1481850454; bh=p69GB996tgxbfVBiBpumAUKUjdZJ10ovULw+4cS/pGo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=cufbAtrFYnWzvGZyKOfyibFk99imH7aFniu1YApQkEy+GE8uiqQzKhGCPd7TEp3BN
         +oX8zyuY6T0p3X2wY2PMIjLL62VdAfKDLhzGzkppClbBDwyLzIf7YkuJy2knz9YYcw
         jG1WP6dJYky91t4bJ3f0NJYYyJ/lxl+L68ZKQ1ng=
In-Reply-To: <20161215205315.GA3768@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/15/2016 03:53 PM, Pablo Neira Ayuso wrote:
> On Thu, Dec 15, 2016 at 01:46:46PM -0500, zrm wrote:
>> The nfct command allows creating a custom timeout policy. The man page
>> describes how to attach the timeout policy using iptables.
>>
>> How do you attach it when the flow is created using the conntrack API with
>> NFCT_Q_CREATE, or attach to a flow that already exists?
>
> You have to use libnetfilter_cttimeout.
>

I can see how to use libnetfilter_cttimeout to create a timeout policy 
pass it to the kernel.

But I might have previously created some flow with 
libnetfilter_conntrack e.g.:

udp  17 142 src=192.168.1.5 dst=203.0.113.10 sport=54422 dport=2345 
src=203.0.113.10 dst=198.51.100.50 sport=2345 dport=54422 [ASSURED] 
mark=0 use=1

How can I change the timeout policy for this flow to use the newly 
created one?

I would have expected to see something like

	ATTR_TIMEOUT_POLICY,	/* string */

in "enum nf_conntrack_attr" in libnetfilter_conntrack.h, but no luck.

What am I missing?
