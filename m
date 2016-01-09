From: Hannes Frederic Sowa <hannes@stressinduktion.org>
Subject: Re: Configure ICMP error source address
Date: Sun, 10 Jan 2016 00:01:24 +0100
Message-ID: <56919144.4060508@stressinduktion.org>
References: <568F8207.9040305@heinlein-support.de>
 <20160108152448.5251154.50977.21786@gmail.com>
 <568FDFBF.3010300@stressinduktion.org>
 <20160109035708.5251154.82433.21820@gmail.com>
 <5690D98B.7070003@stressinduktion.org> <56913852.4030608@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	stressinduktion.org; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=kWrC0LHTxgcpzDx6
	cKlUYVYvjg0=; b=LjO/q4/jUItz1fhKoGgdE71RPpsK4gIfCZT1Yua6hiPfy7tw
	hzfWcTpF5/Avkx67KN/CvqMXFDXJUj+wt7/MguCW9jmkpccpbOkdSIPJwSxPlhP+
	If5u756Euk6cpcpFZMcu7iEOt4zFoAOHIexz2MoJ/C8lT7B0yHwKgbDSz1w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=kWrC0LHTxgcpzDx
	6cKlUYVYvjg0=; b=p7yLyUPKxWWWnhF0MEu7hYrhEBRgrbobC2KQ+tj1bKFVPbr
	ZuVkkd47YirI9Dbb/bQGPT059vuV0DDIX5Hr79IFCi+zoM+SZTEVxN7+eJB0CUFc
	O3NLz302xxklBNbA9K4P19BojzgZoCcc86pCE//L1VGA6k97djhwMgYa9DHY=
In-Reply-To: <56913852.4030608@heinlein-support.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Sander <r.sander@heinlein-support.de>, netfilter@vger.kernel.org, netdev@vger.kernel.org

On 09.01.2016 17:41, Robert Sander wrote:
> Hi,
>
> Am 09.01.2016 um 10:57 schrieb Hannes Frederic Sowa:
>>
>> I would also use dummy interfaces in production systems, merely to split
>> the statistics from dummy.
>
> Thank you for discussing the merits of dummy interfaces. I will consider
> your arguments. But unfortunately this did not answer my question.

Yes, I know. :) I tried to answer it in the other reply.

> Let me rephrase it:
>
> Is it a good idea to set a specific global IPv4 address as source
> address for outgoing ICMP error messages?

Not sure if this generic enough.

So my idea was to have a specific routing table and ip rule you can 
install merely for selecting the source address of an icmp errors.

Not sure yet how complicated that is, it would require a match in the 
rule lookup logic to specifically use another routing table when the 
source address for an icmp packet is generated. We already supply the 
protocol in the flow4 information, maybe this can be used plus another 
input/flag in the flowi4 struct?

I can see situations were it is necessary to actually select the source 
address depending of the interface.

> Would it be OK to create a /proc/sys/net/ipv4/icmp_errors_source where
> you could write an arbitrary IPv4 address into? And that would get used
> as the source address of ICMP errors?
>
> My questions did contain the loopback interface as I first thought it a
> good source of a globally routable IPv4 address (at least in our case).
>
> Secound thought: Instead of writing an IPv4 address to
> /proc/sys/net/ipv4/icmp_errors_source write an interface name to that
> file and take the first global IPv4 address from that interface as
> source for ICMP errors. Then you could create a dummy interface for that
> use case, too.

I am not a fan of such implicit assumptions. I would prefer the direct 
specification of the source ip address over writing interface 
information to a procfs file.

> Still: Is it a good idea to do so?

I agree, there should be a solution for this as this is a common setup 
for BGP routers.

Bye,
Hannes

