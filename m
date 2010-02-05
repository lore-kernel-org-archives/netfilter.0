From: Dan Daugherty <rescue@ddaniscool.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 15:01:19 -0500
Message-ID: <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
	 <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
	 <1265394296.3910.19.camel@casper.meteor.dp.ua>
	 <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
	 <1265399439.3910.29.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=jNks1ATnxAFFew70hLef9quzSQqGoNn3/B0SWyfyQMY=;
        b=JUwEmuPuQuM6tbeHVVHcU3MVVKBCJoah3RMfj1TveSNz/TblBjCJqsXWFv6DUd7eiv
         lkBWobPluCD2iGSvYP25d8muupbkndgQ2MGrhBPD+VkXBKda2emAhz7Cx7PvxJwfseHE
         0F3QE0zDGUTVt92th1b97RoT4BXMGq+iesPYQ=
In-Reply-To: <1265399439.3910.29.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

> Are you using /16 netmask?
No, I just took the 10.117 part off the ip's to shorten the message.
>
>
> None of them got SNATed. Why? Should they go out through eth0? Try to
> remove "-o eth0".
Removed it and no change
>
> Also do you have ip.forwarding enabled (sysctl -a | grep forward")?
net.ipv6.conf.eth0.forwarding = 0
net.ipv6.conf.default.forwarding = 0
net.ipv6.conf.all.forwarding = 0
net.ipv6.conf.lo.forwarding = 0
net.ipv4.conf.eth0.mc_forwarding = 0
net.ipv4.conf.eth0.forwarding = 1
net.ipv4.conf.lo.mc_forwarding = 0
net.ipv4.conf.lo.forwarding = 1
net.ipv4.conf.default.mc_forwarding = 0
net.ipv4.conf.default.forwarding = 1
net.ipv4.conf.all.mc_forwarding = 0
net.ipv4.conf.all.forwarding = 1

>
> Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 1521)?
>
Negative, but the command from sethra fails immediately with nothing
showing in the logs

There has also been mention of a FORWARD chain being necessary.  I
haven't done anything outside of the commands listed in this thread.
