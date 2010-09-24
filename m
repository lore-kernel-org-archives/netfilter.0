From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Fri, 24 Sep 2010 01:27:10 +0100
Message-ID: <4C9BF05E.5070106@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@goog
 lemail.com> <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr> <4C9BD4F9.3020107@googlemail.com> <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=4sQBpCWk+PrM7McdJR0WgMmmCl6yZMnGoy7yUB19qA0=;
        b=tPAlkGkAMWnGrmRZsYcLd2luvKrvjG/YOi0CXRtZunjzrj7/r9lY84l/xirGcjKtrT
         gtMphH3iH5n5RZ7wnt+RbeTaej3oTJt8LKp5xtYyObvHqdJaf8s0BRLOakVG/7uJKHHM
         Hfc0IRsVg1L2bzJN6nbGJN83hKmJDSPymQNbg=
In-Reply-To: <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


> In a way, it did display the secmark. :-)
Of course it doesn't. This is a number generated internally by the sel 
engine (it is called sid). End users were never meant to see this number 
- at all. selctx is the field which is designed for user space and for 
'general' consumption.

>  Just like ipt_LOG prints
> nfmark or IP addresses. The values may not mean much to the outside
> world, but that's what we have DNS and selctx (James's original
> naming) for.
>   
Again, all of the above is meant to be in userspace, sid isn't.


>  If users would not
> constantly insist on using outdated interfaces (and I _do_ grant
> things their transition time),
Who are you to judge what consumers - both users and developers alike - 
should or shouldn't use?

>  and if maintainers would not always
> give in to these users, we would have less code to worry about, or
> even have these discussions.
>   
Yeah right, so if I need to see a secmark on a particular connection 
instead of typing a simple 'cat /proc/net/nf_conntrack', or, as is in my 
case use an existing tool (Shorewall) to check for such contexts, lets 
just bloat my system with yet another set of useless tools, install 
conntrack-utils and execute 'conntrack -L' for that privilege instead?! 
You should be working for Microsoft!

I am not, for a moment, suggesting that netfilter tools should not be 
able to map and get the context - what I am saying is that consumers 
(both users and developers) should be given a choice to use both methods 
- either via /proc (as is the case right now) as well as by other 3rd 
party userspace tools - the choice is theirs to make.
