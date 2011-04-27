From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons "--without-kbuild" not listed in ./configure
Date: Wed, 27 Apr 2011 14:57:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104271452260.19268@obet.zrqbmnf.qr>
References: <4DB758F4.8010000@googlemail.com> <alpine.LNX.2.01.1104271405380.12564@obet.zrqbmnf.qr> <4DB80A27.3080501@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB80A27.3080501@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2011-04-27 14:20, Mr Dash Four wrote:

>>>I have just discovered this option by looking at the changelog on 
>>>v1.35 (yeah, I know!). Is there any reason why this option isn't 
>>>listed in ./configure --help?
>>>    
>>
>>The option was not officially supported in xt-a.
>
>Is it officially supported in 1.35?

After reviewing the situation, it can be declared supported in 1.34 and 
up. The documentation will be updated.

>Is it going to be dropped in future releases?

No, it shall in fact replace the earlier method (which was calling 'make 
user-all-local') that was used to skip kernel modules.
