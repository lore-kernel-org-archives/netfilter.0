From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables --string-replace
Date: Fri, 21 Jan 2011 11:09:35 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101211105350.9744@obet.zrqbmnf.qr>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com> <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr> <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com> <alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr>
 <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com> <alpine.LNX.2.01.1101170351140.25976@obet.zrqbmnf.qr> <4D395A38.90904@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D395A38.90904@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Ben K <benkloester@gmail.com>, netfilter@vger.kernel.org

On Friday 2011-01-21 11:04, Pablo Neira Ayuso wrote:

>On 17/01/11 04:41, Jan Engelhardt wrote:
>> On Monday 2011-01-17 03:44, Ben K wrote:
>> 
>>>> Matching across packets would incur unwanted complexity.
>>>
>>> Just curious, does the current string match implementation match
>>> across packets? If not, then surely adding replace functionality (with
>>> the same compromise) is not overly complex?
>> 
>> The string match does indeed not work across packets. I do not know why 
>> we have it, it won't have much use for stream protocols either and was 
>> probably devised for datagrams.
>
>Could you tell me why is not useful for stream protocols?

Because the stream may be segmented at about any point, thereby
splitting the very string the user was trying to match on
across two packets.

>
>> I can't say for sure what the original 
>> authors' intentions were. xt_string also works on the entire IP packet, 
>> so there is a chance for false positives if one only wants to match 
>> actual L7 payload.
>
>It's easy to extend it to make it start after the IP header. I'll send a
>patch for this.
>
>I guess that it's going to be hard to find some pattern that matches in
>the IP header, so that false positive that you mention has a very low
>probability.

That does of course depend on the length of the pattern.
If you only search for "GET", you could for example match
on the sequence number.
