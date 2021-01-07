From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Matching streaming services
Date: Thu, 7 Jan 2021 01:37:58 +0100
Message-ID: <e415c783-47a5-8319-ba5a-c6ee4ae2ec49@thelounge.net>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
 <ae566d41-2114-536e-9f86-6392a0e4ef76@thelounge.net>
 <10397770845846a7270a3b3922772f1a84de9684.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <10397770845846a7270a3b3922772f1a84de9684.camel@lusan.id.au>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nikolai@lusan.id.au, netfilter@vger.kernel.org



Am 06.01.21 um 20:37 schrieb Nikolai Lusan:
> On Wed, 2021-01-06 at 19:18 +0100, Reindl Harald wrote:
>> the point of https is to clap on dirty fingers of anyone in the
>> middle
>> of the connection, no matter if his intention is good or bad
> 
> My initial thinking was that the https port was just being used, and
> not that it was actually https traffic, although this seems not to be
> the case (verifying would require a deeper dive into the packet stream
> than I have time for right now).
> 
> 
>> if you can distinct the content of https traffic we have a problem
>> houston
> 
> I agree - but it doesn't stop people using port 443 for other data
> transmission, for example ssh on port 443 often allows you to bypass
> proxies or overly strict firewalls. Just because it's "reservered" as a
> port for secure http transmission doesn't mean that's what it's being
> used for. I suspected it might be sctp traffic, but again I can't
> verify anything with my current time constraints.

don't change the fact that you have no business to mangle around in 
encrypted traffic - that's the whole point of encryption
