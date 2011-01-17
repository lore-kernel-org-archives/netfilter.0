From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 23:52:58 +1300
Message-ID: <4D341F8A.5030005@treenet.co.nz>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com> <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr> <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com> <alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr> <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com> <alpine.LNX.2.01.1101170351140.25976@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1101170351140.25976@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ben K <benkloester@gmail.com>, netfilter@vger.kernel.org, Pablo Neira Aysuo <pablo@netfilter.org>

On 17/01/11 16:41, Jan Engelhardt wrote:
> On Monday 2011-01-17 03:44, Ben K wrote:
>
>>> Matching across packets would incur unwanted complexity.
>>
>> Just curious, does the current string match implementation match
>> across packets? If not, then surely adding replace functionality (with
>> the same compromise) is not overly complex?
>
> The string match does indeed not work across packets. I do not know why
> we have it, it won't have much use for stream protocols either and was
> probably devised for datagrams. I can't say for sure what the original
> authors' intentions were. xt_string also works on the entire IP packet,
> so there is a chance for false positives if one only wants to match
> actual L7 payload.

It has some favor amongst the NAT interception / transparent proxy crowd.

The use-case is to distinguish real HTTP traffic to be intercepted vs 
weird binary abusing port 80. Or the reverse, to only catch HTTP going 
over general ports like 8080 which may get anything.
In this type of case only the first dozen or so bytes are relevant and 
almost always guaranteed to be in one (first) packet.

AYJ
