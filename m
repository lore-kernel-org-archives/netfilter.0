From: zrm <zrm@trustiosity.com>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Thu, 11 Jan 2018 20:43:03 -0500
Message-ID: <83aeb478-2c2e-a939-3d90-203b05dd1ad8@trustiosity.com>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
 <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
 <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
 <20180109134054.47146cc3@playground>
 <ce12540c-18d8-dd3a-1935-33a954054fee@trustiosity.com>
 <20180111171743.0458e838@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1515721341; bh=NrxGvwJAfC7r3RSHfXwYU+YmCuYmu9+EyCqzUgwwli4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZqnChIF+LH4XGKvFwjXb3KMhfTK1+VCwyEuhAhKt4CH/65VTLxc5qBZY/PKmh/ZVb
         6AfMuo1Sd8Pbnh43n/Yf0qy1LpF3g2Ap3omAeIEGYRYaaFEVDI8BkuYSN1L0oLY/HG
         SQrWMBFuGm/A4eENEapQIc+R5fPybRvVuUhQWOqM=
In-Reply-To: <20180111171743.0458e838@playground>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

> The hotel owns its network and has the duty to do what is reasonable to prevent the dissemination of malware (viruses, trojans, phishing, bot net controls, etc.), either inbound or outbound. End-to-end encryption precludes the hotel management from doing its duty. I'll even go so far as to say that end-to-end encryption fosters the spread of all manner of malware because it prevents all intermediate points from recognizing malware in the first place.

That has no bottom. Why have a hotel read all my email but not their 
ISP, or their ISP's transit provider, or the recipient's ISP, or the 
hardware vendors, or the software vendors, or the government of every 
jurisdiction the bits pass through, or all foreign governments?

In every case it would be true that if you gave them the plaintext they 
would have an opportunity to identify malware. That doesn't demand 
giving them all the plaintext.

> Endpoint detection is nice in theory. But, far too often, it doesn't exist, isn't up-to-date, or just cannot detect enough. That is, while you may be utterly diligent in keeping your endpoint detection systems up-to-date and operational, Joe Sixpack is almost certainly not going to be very diligent at all because that is not his area of expertise. Good security is multi-level: endpoints, firewalls, and other intermediate points. Having different detection methods in use and using different malware databases increases the probability that any given piece of malware will be detected and blocked.

It's possible to have multiple layers entirely within the endpoints. The 
operating system and browser can each have their own malware database. 
Each host is a layer of defense for the others, because each protected 
host doesn't get infected and spread the malware; herd immunity and all 
that.

It's also possible to add specifically trusted intermediaries. An 
enterprise may put its users on a proxy server that checks for malware. 
A home user could subscribe to a VPN service that does the same. Then 
the proxy can be trusted and cryptographically secured to the endpoints 
rather than making everyone trust every random wifi gateway they use 
that might well be operated by an attacker.

>> But it would be useful for the gateway to at least know what services
>> are being used. You know there shouldn't be any CIFS or NFS traffic
>> across the public internet.
> 
> Port numbers no longer necessarily correspond to specific services. Other than proxies, what is to prevent a miscreant from using port 21, 22, 23, 53, 80, 123, 443, 587, 993, 995, or any number of other commonly accessible ports to distribute malware or control bot nets?

Nothing, that's the point. That was never a thing it prevented. 
Information theory says you can't stop two colluding hosts from 
communicating arbitrary information unless you prevent them from 
communicating whatsoever. If one port is open between them then they 
might as well all be. They can even disguise their traffic as whatever 
protocol it's supposed to be.

The benefit of identifying traffic is when one of the endpoints is not 
malicious. For example, if you know you aren't operating any mail 
servers, block outgoing SMTP. A compromised host can't just use another 
port because the victim receiving mail server only accepts mail on the 
standard port.

>> Sadly the people using outgoing default deny have screwed us all. All it
>> takes is for a large enough minority to block everything but TLS/443 for
>> everyone to respond by using TLS/443 for everything, and then you can't
>> distinguish any of it. Which leaves everyone worse off than having
>> outgoing default allow with specific exceptions for services known to be
>> problematic.
> 
> One could just as easily say that people using TLS everywhere have screwed us all by preventing intermediate points from recognizing and blocking malware.

It's not a choice, it's selective pressure. If you create a new protocol 
using its own port and people are using default deny, you're default 
blocked even if you're innocent. Administrators won't create an 
exception for a protocol until it becomes popular and it won't become 
popular while it's blocked.

The application will either look like an existing allowed protocol or 
die, so all the new applications that didn't die look like an existing 
allowed protocol. Which is problematic.

> Like all freedoms, freedom of communication comes with duties and responsibilities. Utter freedom (that which is devoid of duties and responsibilities) is anarchic, and anarchy is the antithesis of society. For society to grow and flourish, it needs at least some rules and regulations that provide a level-ish playing field. The same applies to the internet. When the owners of private networks have their control wrested from them, then their property has been taken from them; I might even say their property has been stolen from them.
> 
> So at the risk of sounding crude, I's'll repeat myself. Owners of private networks must have the ability to examine data passing into and out of their networks so that they may recognize and block malware and miscreants.

I think you're making two separate arguments.

One is that you should have a _right_ to see the plaintext of anything 
on your network. Which is fine, block TLS on your private network if you 
like. Then most people won't want to use your network.

The other is that you should have a _duty_ to see the plaintext of 
everything on your network. This is where we disagree. I think it should 
be permissible to let someone use your wifi without requiring them to 
divulge their secrets to you.

> And to bring this back on topic, netfilter must evolve and continue to help people to do their parts in controlling the spread of malware and shrinking the influence of internet miscreants.

If you can't have a discussion about the consequences of particular 
networking filtering policies on a list for a network filtering 
framework, where are you supposed to have it? :)
