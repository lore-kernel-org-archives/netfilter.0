From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Thu, 11 Jan 2018 17:17:43 -0500
Message-ID: <20180111171743.0458e838@playground>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
        <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
        <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
        <20180109134054.47146cc3@playground>
        <ce12540c-18d8-dd3a-1935-33a954054fee@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU w0BMHl7r007698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1515709067; i=@wpi.edu;
        bh=azNipgApS2oGI3mt+QeE4jBCUThXhkP61uAMwwYxmEQ=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=xlzIR/PjhNht95wnqHOWMJIA0vK1kit/Szwqzq4E6b97kXhLgPkLqoU2NQ94j11xS
         Ha8HgQ6S22raN67p6hoEi304MRlnOmOiZEcFHC+QYq3Skvgf63yqvgnzoXIlYdJth7
         L38iCozM38c76zHv8ivLSw2PfucQeVFStG6sCmPw=
In-Reply-To: <ce12540c-18d8-dd3a-1935-33a954054fee@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

On Thu, 11 Jan 2018 16:28:26 -0500
zrm <zrm@trustiosity.com> wrote:

> On 01/09/2018 01:40 PM, Neal P. Murphy wrote:
> > I would say lack of awareness is the main reason they resist. The same lack of awareness and the dearth of easy-to-admin firewalls is the main reason there are still so many bot nets, so much malware, and so many miscreants around the internet. Another reason is that far too many people believe that end-to-end encryption will solve most of the problems of the internet; but they are wrong. TLS-everywhere has one major drawback; it prevents owners of private internets (like you and me) from detecting and blocking malware and micreants from crossing our perimeter firewalls. The correct solution is host-to-gateway, gateway-to-gateway, and gateway-to-host encryption; OE would allow owners and operators of private networks to prevent malware and miscreants from entering--and leaving--their n
 etworks.  
> 
> It would be good to have that for certain metadata but not for content. 
> It's clearly wrong for the gateway at some hotel where I'm checking my 
> email to have access to the plaintext of the email. And it's not as if 
> the gateway can do any magic content-based malware detection that 
> couldn't be done on the endpoints.

The hotel owns its network and has the duty to do what is reasonable to prevent the dissemination of malware (viruses, trojans, phishing, bot net controls, etc.), either inbound or outbound. End-to-end encryption precludes the hotel management from doing its duty. I'll even go so far as to say that end-to-end encryption fosters the spread of all manner of malware because it prevents all intermediate points from recognizing malware in the first place.

Endpoint detection is nice in theory. But, far too often, it doesn't exist, isn't up-to-date, or just cannot detect enough. That is, while you may be utterly diligent in keeping your endpoint detection systems up-to-date and operational, Joe Sixpack is almost certainly not going to be very diligent at all because that is not his area of expertise. Good security is multi-level: endpoints, firewalls, and other intermediate points. Having different detection methods in use and using different malware databases increases the probability that any given piece of malware will be detected and blocked.

> 
> But it would be useful for the gateway to at least know what services 
> are being used. You know there shouldn't be any CIFS or NFS traffic 
> across the public internet.

Port numbers no longer necessarily correspond to specific services. Other than proxies, what is to prevent a miscreant from using port 21, 22, 23, 53, 80, 123, 443, 587, 993, 995, or any number of other commonly accessible ports to distribute malware or control bot nets?

> 
> Sadly the people using outgoing default deny have screwed us all. All it 
> takes is for a large enough minority to block everything but TLS/443 for 
> everyone to respond by using TLS/443 for everything, and then you can't 
> distinguish any of it. Which leaves everyone worse off than having 
> outgoing default allow with specific exceptions for services known to be 
> problematic.

One could just as easily say that people using TLS everywhere have screwed us all by preventing intermediate points from recognizing and blocking malware. The owner of a network decides what may not enter or leave her network. Guests who disagree with said policies are free to find another net to use.

Like all freedoms, freedom of communication comes with duties and responsibilities. Utter freedom (that which is devoid of duties and responsibilities) is anarchic, and anarchy is the antithesis of society. For society to grow and flourish, it needs at least some rules and regulations that provide a level-ish playing field. The same applies to the internet. When the owners of private networks have their control wrested from them, then their property has been taken from them; I might even say their property has been stolen from them.

So at the risk of sounding crude, I's'll repeat myself. Owners of private networks must have the ability to examine data passing into and out of their networks so that they may recognize and block malware and miscreants.

And to bring this back on topic, netfilter must evolve and continue to help people to do their parts in controlling the spread of malware and shrinking the influence of internet miscreants.

N
