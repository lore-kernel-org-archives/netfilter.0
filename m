From: Dan Daugherty <rescue@ddaniscool.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 15:04:12 -0500
Message-ID: <81ed8b881002051204q42413b75p6e83564f055a35aa@mail.gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
	 <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
	 <1265394296.3910.19.camel@casper.meteor.dp.ua>
	 <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
	 <1265399439.3910.29.camel@casper.meteor.dp.ua>
	 <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=yViCfCfIGwd4OxYmeEVoj8+UuHeRL2XvwEjJS36oyEk=;
        b=G+K0JyQhRLRD/j/BDLLsBhwHVBw8qtmpyATvADqog42byv5/6w5Jqcb8eIywdPq1KE
         p7kI5D9c/hhxuM+H9O3z/xrdLXT5VFI3mV8IjNB2s/jeOsCr0gJgGPRah90flpnGMxYR
         oycDlboO8/Uh5amTzRMx/JAB1jd+7ANI/hJz8=
In-Reply-To: <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

=46orgot to mention I'm on a Redhat Enterprise Linux 5 box with the
stock kernel.  Tried to compile my own and the build fails
immediately.  I assumed that since I can route requests locally, the
kernel was compiled properly for iptables.

On Fri, Feb 5, 2010 at 3:01 PM, Dan Daugherty <rescue@ddaniscool.com> w=
rote:
>> Are you using /16 netmask?
> No, I just took the 10.117 part off the ip's to shorten the message.
>>
>>
>> None of them got SNATed. Why? Should they go out through eth0? Try t=
o
>> remove "-o eth0".
> Removed it and no change
>>
>> Also do you have ip.forwarding enabled (sysctl -a | grep forward")?
> net.ipv6.conf.eth0.forwarding =3D 0
> net.ipv6.conf.default.forwarding =3D 0
> net.ipv6.conf.all.forwarding =3D 0
> net.ipv6.conf.lo.forwarding =3D 0
> net.ipv4.conf.eth0.mc_forwarding =3D 0
> net.ipv4.conf.eth0.forwarding =3D 1
> net.ipv4.conf.lo.mc_forwarding =3D 0
> net.ipv4.conf.lo.forwarding =3D 1
> net.ipv4.conf.default.mc_forwarding =3D 0
> net.ipv4.conf.default.forwarding =3D 1
> net.ipv4.conf.all.mc_forwarding =3D 0
> net.ipv4.conf.all.forwarding =3D 1
>
>>
>> Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 152=
1)?
>>
> Negative, but the command from sethra fails immediately with nothing
> showing in the logs
>
> There has also been mention of a FORWARD chain being necessary. =A0I
> haven't done anything outside of the commands listed in this thread.
>
