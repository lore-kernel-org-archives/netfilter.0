From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: debug iptables rules
Date: Fri, 26 Aug 2011 04:16:35 +1200
Message-ID: <4E567563.20505@treenet.co.nz>
References: <CA+b04XnYFUcukqbmQXiKbY4VjUaFs3red56Jfnzm4pj+z6ndRw@mail.gmail.com>	 <CA+b04XnQ-cKfU9KUu9j_Tf0vp0jtadnNu69_Gob1mPAXVkytMw@mail.gmail.com>	 <1314027026.2486.7.camel@kushiel.sterenborg.info>	 <CA+b04Xkw3FkDt0rENt-x-HjOfwxx+R3mYRpjE6BTKpm47ZpC4A@mail.gmail.com>	 <1314029592.2486.18.camel@kushiel.sterenborg.info>	 <CA+b04Xkwj3GPnuU8Z6YG=HiQuK3hYkQdeMRRy-dDct+vRbyfQA@mail.gmail.com>	 <1314090491.2486.37.camel@kushiel.sterenborg.info>	 <CA+b04XnZKJ9_VuCNHQELB6SDn6wEw_+r9BoW8e-PeeZvKyS3xQ@mail.gmail.com> <1314125087.2486.61.camel@kushiel.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1314125087.2486.61.camel@kushiel.sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Cc: TEJAS <tsevak@gmail.com>, netfilter@vger.kernel.org

On 24/08/11 06:44, Rob Sterenborg (Lists) wrote:
> On Tue, 2011-08-23 at 20:05 +0530, TEJAS wrote:
>> Hi,
>>
>> I set log rule for port 80 traffic logging and it is working fine. And
>> i want to log tproxy rule which is redirect traffic from port 80 to
>> port 3129 (squid tproxy). So for that what will be LOG rule for this?
>
> [snip]
>
>> Actually i want to see packet redirect from port 80 to port 3129.
>>
>> What is the use of socket match?I try to find from google and also
>> read some document , but i am not having any good understanding for
>> it.So kindly guide me that what is the use of socket match and how's
>> TPROXY match works?
>
> Sorry, can't help you there so maybe someone else can jump in: I've
> never used the socket match or TPROXY target. (According to what I just
> read the socket match replaced the tproxy match. I suppose you took your
> experiment from https://lwn.net/Articles/252545/ because it looks the
> same.)

A squid wiki cut-n-paste job.

   TPROXY rule is capturing packets to port 80 into squid port 3129.
   DIVERT is preventing packets leaving the squid from being captured.

Log marked packets after TPROXY rule to see the packets entering squid.
Log marked packets after the DIVERT sub-chain MARK rule to see packets 
exiting squid.

AYJ
