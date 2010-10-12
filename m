From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [PATCH 2/5] secmark: make secmark object handling generic
Date: Tue, 12 Oct 2010 19:53:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010121949320.15529@obet.zrqbmnf.qr>
References: <20101012154008.26943.44399.stgit@paris.rdu.redhat.com>  <20101012154015.26943.18385.stgit@paris.rdu.redhat.com>  <alpine.LNX.2.01.1010121824540.15529@obet.zrqbmnf.qr>  <4CB499E3.5030305@netfilter.org>
 <1286905533.2608.21.camel@dhcp235-107.rdu.redhat.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1286905533.2608.21.camel@dhcp235-107.rdu.redhat.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, paul.moore@hp.com, jmorris@namei.org, selinux@tycho.nsa.gov, sds@tycho.nsa.gov, linux-security-module@vger.kernel.org, mr.dash.four@googlemail.com


On Tuesday 2010-10-12 19:45, Eric Paris wrote:
>> >> -	.target     = secmark_tg,
>> >> -	.targetsize = sizeof(struct xt_secmark_target_info),
>> >> -	.me         = THIS_MODULE,
>> >> +	.name		= "SECMARK",
>> >> +	.revision	= 0,
>> >> +	.family		= NFPROTO_UNSPEC,
>> >> +	.checkentry	= secmark_tg_check,
>> >> +	.destroy	= secmark_tg_destroy,
>> >> +	.target		= secmark_tg,
>> >> +	.targetsize	= sizeof(struct xt_secmark_target_info),
>> >> +	.me		= THIS_MODULE,
>> >> };
>> 
>> I think that we don't need that extra tab above.
>
>Are you saying that you prefer lots of spaces to get alignment rather
>than the single tab?

This discussion has been had before, and the technical result is that 
tab's do not align, they only indent logical levels on the left side. 
(Since people could have their editors set to display tabs in non-8-wide 
fashion to either cram more onto the screen, or widen if they need it 
for clarity. Unfortunately, developers don't do the aligning 
consistently and instead, like the common Microsoft joke about how 100 
developers to insert a lightbulb, just declare 8 spaces for a tab a 
standard when that isn't really the point of a tab.)
