From: "Daniel Tiebler" <daniel.tiebler@tik.uni-stuttgart.de>
Subject: Re: iptables-normalizet: argument normalization and DNS
 resolution?
Date: Thu, 10 Apr 2014 15:16:21 +0200
Message-ID: <web-181218610@uni-stuttgart.de>
References: <web-181154039@uni-stuttgart.de>
 <CAOkSjBiFCZP4CBvj1K=tD1ApaWJ+6LswezqLemNwiQzOvv5FGA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	rus.uni-stuttgart.de; h=content-transfer-encoding:content-type
	:content-type:references:in-reply-to:message-id:date:date
	:x-mailer:subject:subject:from:from:received:received:received;
	 s=dkim20100209; t=1397135787; x=1398950188; bh=k1hpzujWaCioywTU
	FhQ0gXomqP7X7QNcHk6UOYCthD4=; b=twMMEoAQWu9d84TE2yJmh4Lueh3QMOKM
	j4bcfCkiPUrm0vCBxacJAf9J0cGZxIQ8iWsWZ5zbBoR6LuNM+3CrduewTgLIvHpg
	RKL4moVl176Tx8F7N634T01jEccbq0XZj2Hf4KU5b30OxauBPfwJhL3Hdmrnji7I
	SUsoRz+qA1A=
In-Reply-To: <CAOkSjBiFCZP4CBvj1K=tD1ApaWJ+6LswezqLemNwiQzOvv5FGA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,

On Wed, 9 Apr 2014 16:00:56 +0200
  Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com> 
wrote:
> On 9 April 2014 14:10, Daniel Tiebler
> <daniel.tiebler@tik.uni-stuttgart.de> wrote:
> [...]
>> * Is something similar possible with nftables?
> 
> In nftables, you can know a low-level (netlink) 
> representation of all nftables objects (tables,
> sets, chains, rules...) in userspace (using
> libnftnl).

Userspace is great.
Is it necessary to load the rules into the kernel 
beforehand?
It would be nice to operate in userspace completely to be 
able to compare two sets of rules.



> This representation is either XML or JSON, where DNS 
> name resolution, service name resolution and friends
> are translations to the internal kernel data structures.

If every exported or generated data has the same format, 
that is okay.



> Tracking FQDNs changes is another, different issue.

That's right.
The normalization has a higher priority for us.



At the moment we are using iptables, but if nftables will 
replace iptables, it would be nice, if it would have the 
requested features.



With kind regards,
Daniel Tiebler
