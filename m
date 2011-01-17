From: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 12:57:13 +0100
Message-ID: <4D342E99.2030501@gmail.com>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu> <4D34200F.5050307@coochey.net> <alpine.LNX.2.01.1101171231200.29904@obet.zrqbmnf.qr> <4D342AF4.6070504@coochey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=VzU5+xmjPZVxqFy8e7oUQcJiq0WsCV7GFlk83AgReYo=;
        b=e0HnAQ+6Fz7aqASIKwt/LVCcHoTux3G/4DappVsv94HCqfGJGbh1XFas1rNGF46aF0
         3F4+YuovXxk3MCpZ1G0Bc9+ml9FgDU1JjF/QPS2C1za7up6SaJrzN5MpNvkZw/o3Msd3
         Mg+smvzhoG6UYDmhQO0/MQkfKwhYf+Rk+T8mI=
In-Reply-To: <4D342AF4.6070504@coochey.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Giles Coochey <giles@coochey.net>
Cc: Jan Engelhardt <jengelh@medozas.de>, =?ISO-8859-1?Q?G=E1sp=E1r_Lajo?= =?ISO-8859-1?Q?s?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>

El 17/01/11 12:41, Giles Coochey escribi=F3:
> On 17/01/2011 12:36, Jan Engelhardt wrote:
>> On Monday 2011-01-17 11:55, Giles Coochey wrote:
>>>> You should do all of the NAT-ing ON THE LOAD BALANCER:
>>>>
>>> I have to agree - if you are doing NAT you want to avoid any type o=
f=20
>>> asymmetric
>>> routing - especially you NEED to make sure that the device that is=20
>>> doing the
>>> NAT (be it for load balancing or other reasons) receives the return=
=20
>>> packets.
>> Not strictly. You could utilize a second device whose CTs are=20
>> synchronized
>> with the LB to apply the reverse transform, using conntrackd.
>> Sort of like
>>
>> digraph { internet ->  lb; lb ->  web; web ->  unnat; unnat -> =20
>> internet; };
>>
>> but it only looks feasible to me if your LB is already computational=
ly
>> crowded.
>> --=20
> It also requires the loadbalancer to be using netfilter as well.
>
> If it's a hardware load balancer with proprietary methods then you=20
> will need symmetric routing through it, unless it supports some form=20
> of TCP state sharing.
>
It works with propietary methods. The real solution if do symmetrical=20
routing, all the replies must pass through the LB.  I can't use=20
conntrackd because I can't install anything in the LB.
