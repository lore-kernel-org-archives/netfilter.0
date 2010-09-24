From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Fri, 24 Sep 2010 01:32:59 +0100
Message-ID: <4C9BF1BB.6040309@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@goog
 lemail.com> <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr> <4C9BD4F9.3020107@googlemail.com> <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr> <4C9BEFC3.6030701@shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=7NEhPvC5VQljT1+Qs4ejFAG0balRhWWwhlD1T38FlHY=;
        b=igCzcao1EnF4rCdpBbskFkQOIdHXyZsMkMO6z9kM3V1jpYQkNbmByVuPzvgrIy/BaM
         lvFBGaZikvkHnPzRuxG4APMCeg77ZD/Xwd0QAy+m7bvtiAajKY6BToKQM0cfimOQJy0z
         v83X/aVRMnb1K3lLEGyDm2454Bu+5RQDQid/0=
In-Reply-To: <4C9BEFC3.6030701@shorewall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Eastep <teastep@shorewall.net>
Cc: Jan Engelhardt <jengelh@medozas.de>, Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


> So if the 'conntrack' utility invokes the sid->secctx translation in
> formatting it's -L output then everyone should be happy. Non-programmers
> get the text output that they want and there is no need to extend the
> deprecated /proc interface.
>   
The point I am making (well, actually, two points) is this:

1) The existing /proc interface has secmark, albeit showing the wrong 
output/field, whatever you want to call it and, for me, that isn't right 
and needs to be fixed; and

2) Why should I have bloat my system any further and install yet another 
set of tools (which will have no further use apart from 'conntrack -L') 
when I can get exactly the same functionality via the OS without further 
hassle of having to maintain the said set of tools?
