From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Fri, 24 Sep 2010 03:18:31 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009240315500.29164@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr>
 <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com>
 <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@googlemail.com>
 <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr> <4C9BD4F9.3020107@googlemail.com> <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr> <4C9BEFC3.6030701@shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9BEFC3.6030701@shorewall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Eastep <teastep@shorewall.net>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov

On Friday 2010-09-24 02:24, Tom Eastep wrote:

>On 9/23/10 4:59 PM, Jan Engelhardt wrote:
>
>> 
>> It is not "my" conntrack-utils by any means. If users would not
>> constantly insist on using outdated interfaces (and I _do_ grant
>> things their transition time), and if maintainers would not always
>> give in to these users, we would have less code to worry about, or
>> even have these discussions.
>
>So if the 'conntrack' utility invokes the sid->secctx translation in

As Eric mentioned, sid->secctx translation should already be done in 
the kernel since sid are not meant to be seen/used on the outside, and 
I agree to that if that is how selinux works. (And thus the discussion 
is mostly about whether the secctx is to be reported in procfs, or
via netlink.)

>formatting it's -L output then everyone should be happy. Non-programmers
>get the text output that they want and there is no need to extend the
>deprecated /proc interface.
