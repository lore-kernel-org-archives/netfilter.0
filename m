From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: netfilter and IPsec?
Date: Sat, 02 Oct 2010 23:36:57 +0200
Message-ID: <20101002233657.50131qtofq9apla8@webmail.physik.uni-muenchen.de>
References: <20101002201135.20008i4gzdc62t3s@webmail.physik.uni-muenchen.de>
 <alpine.LNX.2.01.1010022245280.13529@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=user-agent:content-transfer-encoding
	:content-disposition:content-type:content-type:mime-version
	:in-reply-to:references:subject:subject:from:from:date:date
	:message-id:received:received:received:received; s=sel-2010; t=
	1286055417; bh=lZDNyPCDFMUqCNYsfzKYbuYm6DUw1lkkUs97oZplIoU=; b=i
	Henq3VZPcO41F88X7Jrx21BERKkrFy2vyCNWaw+zycC/8AE+zAse4simETwKwDoz
	iQzqgi/4iq7zrPalU86vs181NuoxLeMvWEtMzirEqo+dxooRuO1YTVOop1Lx5v5R
	Fx8TS7IcJzeNBKdATuWLp9PrFNvzNfhK7REY7IRTW4=
In-Reply-To: <alpine.LNX.2.01.1010022245280.13529@obet.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Quoting Jan Engelhardt <jengelh@medozas.de>:
>> #allow IKE to/from these hosts without IPsec
>> -A ipsec-only   --protocol udp  -m udp  --source-port isakmp
>> --destination-port isakmp -j ACCEPT
>> -A ipsec-only   --protocol udp  -m udp  --source-port isakmp-nat
>> --destination-port isakmp-nat -j ACCEPT
> But in the NAT scenario, the source port may no longer be 4500.
> I think you want --dport here in both cases.
Ah,.. good point, but why in both cases? With the non-NAT scenario,  
aren't both ports 500?


>> 1) As you see, I tried to first allow from/to hostB: udp/500 and  
>> udp/4500 for
>> the key negotiations.
>
> 4500 is also used for espinudp transport, not just IKE.
Mhh,... what's that? Is this the encapsulation in UDP packet  
(forceencaps in strongswan)?

Are there any other ports or so I have to open?

> Well where's your rule to it?
I've not yet done one, because I didn't knew how policy work, and with  
just adding a normal rule like (e.g. I want to allow tcp/4369 from  
hostB (but ONLY when encrypted) to do erlang/ejabberd clustering) like:
-A INPUT --destination eth0_ip --protocol tcp -m tcp  
--destination-port  4369 -j ACCEPT
it would be filterd out by above rules, as the source address is that  
of hostB, and proto != esp, right?


>> So when during netfilter are packets still esp, and when are they
>> authenticated/decrypted, and I see (and can match) the "normal" IP packet?
>
> The normal ones with -m policy.
Is there some more elaborate description on this, than that of the manpage?
I must admit that I don't understand how to use it, an what it  
actually matches :/

>> Does the INPUT/OUTPUT queues even ever see esp packets?
> Of course.
How does this conceptually work, when I have encapsulated protocols  
like with ESP/AH where I have IP within IP.
Is first the ESP packet going through netfilter/IP stack, then it's  
decrypted authenticated and the resulting IP packet goes through it  
again?


Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

