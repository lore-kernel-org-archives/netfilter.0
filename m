From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Broadcast redirecting
Date: Thu, 13 May 2010 21:22:29 +0300
Message-ID: <AANLkTillMVOffaQflD1r5oHwypoAOvxM51EwBSJRd9UV@mail.gmail.com>
References: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com>
	 <4BEC3608.5050603@uncu.edu.ar>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=GJm7iPcsm3EQmSqq7spsU4aledmgE61+uf9n8Ie/ik4=;
        b=Sb6T3VtaTZ4iq+n0GvEoECWACzuAZ4wZYcl5DNZVPx1/pUONRxdkWctE3zwduXU88l
         LSpLc7UmiKqqnMYbE96Ehzqr3NEAQRHryLDwOhdzfbBGT0y3rmBBRD2h151P/HRjEtjh
         0H9XfYLpfYEeNHGkBXa6NbUlF7JVjfvNW7QTY=
In-Reply-To: <4BEC3608.5050603@uncu.edu.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2010/5/13 Federico Alberto Sayd <fsayd@uncu.edu.ar>:
>>
>> Is it possible to redirect broadcast packets( with dst 255.255.255.255
>> ) received on one interface to another?
>> Or should I use some standalone program?
>>
>>
>
> brouting with ebtables??
> arp proxy??

Thanks, but for some reasons I cannot use bridging.
And ARP proxy works for ARP packets only.

May be, the problem consists in routing code which does not allow to
redirect broadcast packets.

Also I can write some daemon in Perl which will receive broadcast
packets and inject them on another interface. But the source address
of the injected packets will belong to the router and I need them to
be as in original packets.

-- 
Best regards
Anatoly Muliarski
