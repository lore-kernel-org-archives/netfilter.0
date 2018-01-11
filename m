From: zrm <zrm@trustiosity.com>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Thu, 11 Jan 2018 16:28:26 -0500
Message-ID: <ce12540c-18d8-dd3a-1935-33a954054fee@trustiosity.com>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
 <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
 <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
 <20180109134054.47146cc3@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1515706068; bh=sLTyijEz/JDVpkGOS7bFpPzvaF0p2/W7xabOTEcjzpQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=M2bpGGDdwSuKqC24qvmn9bvU2nSrnju1LNKyKpBGORkOAr5SIWExKfdNxOp9h5OzT
         pRqBhgsG9BnaE2aQ3Peyrmvm1dJyAd+ik/76sw60ozW9sNUeyHyfoyiVblWLJRUNNk
         yE6OxrKJedTY6qfPNXGVyFLoBs0wRbUrSXOARiZE=
In-Reply-To: <20180109134054.47146cc3@playground>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On 01/09/2018 01:40 PM, Neal P. Murphy wrote:
> I would say lack of awareness is the main reason they resist. The same lack of awareness and the dearth of easy-to-admin firewalls is the main reason there are still so many bot nets, so much malware, and so many miscreants around the internet. Another reason is that far too many people believe that end-to-end encryption will solve most of the problems of the internet; but they are wrong. TLS-everywhere has one major drawback; it prevents owners of private internets (like you and me) from detecting and blocking malware and micreants from crossing our perimeter firewalls. The correct solution is host-to-gateway, gateway-to-gateway, and gateway-to-host encryption; OE would allow owners and operators of private networks to prevent malware and miscreants from entering--and leaving--their net
 works.

It would be good to have that for certain metadata but not for content. 
It's clearly wrong for the gateway at some hotel where I'm checking my 
email to have access to the plaintext of the email. And it's not as if 
the gateway can do any magic content-based malware detection that 
couldn't be done on the endpoints.

But it would be useful for the gateway to at least know what services 
are being used. You know there shouldn't be any CIFS or NFS traffic 
across the public internet.

Sadly the people using outgoing default deny have screwed us all. All it 
takes is for a large enough minority to block everything but TLS/443 for 
everyone to respond by using TLS/443 for everything, and then you can't 
distinguish any of it. Which leaves everyone worse off than having 
outgoing default allow with specific exceptions for services known to be 
problematic.

>    - DROP all internet-side traffic to and from private addresses unless you know that there are some
>      private LANs between you and the actual internet.

A good way to do this is to add "unreachable" routes for all the private 
address ranges using the worst possible metric, and enable reverse path 
filtering. Then private addresses don't go to the default route 
(internet) but if a private network is directly connected or has a 
specific route it still works.
