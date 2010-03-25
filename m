From: Julien Vehent <julien@linuxwall.info>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 25 Mar 2010 22:49:17 +0100
Message-ID: <0218aeccc82b2aa54d3a49308be4e232@localhost>
References: <067c83163988908ef546d7ff7f560a17@localhost> <A846BBAEAA674FAA90FA2008DDD1ED12@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=lnw-dkim;
	 bh=pK/GCv9vkbTG9xDE4IzRFhEajUp+n5vzwg3AdloMxek=; b=dHfjyD2sx0Th
	ftb8daIDoISesRpXsMCtTi0VQ9IadgaaxI+xyVC+vbebd0p9lL5zFf1+Cya4y3St
	F+5/l4dGrlc0Wgzj4zs4XLgAIqzOO29IjTULjXh1fguJSbCT/IDt0jY6R2TAN0RM
	cQlMbPpyBjF+64OaqJlRX5cV1vbzxaA=
In-Reply-To: <A846BBAEAA674FAA90FA2008DDD1ED12@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikolay Rybalov <nowhere@hakkenden.ath.cx>
Cc: netfilter <netfilter@vger.kernel.org>

This seems to be correct, my initial calculation didn't take into account
the 8 bytes AAL5 tail (which I didn't know about).

So, if this reduction effect is due to the AAL5 tail, how come it only
shows on tcp acks packets ?

The rest of the time, I have an average rate that's around 680kbits/s,
which is the expected rate if I only take into account the 5 bytes overhead
from ATM without the 8 bytes overhead from the AAL5 packets.


Julien

On Thu, 25 Mar 2010 22:39:11 +0300, "Nikolay Rybalov"
<nowhere@hakkenden.ath.cx> wrote:
> ATM option accounts for ATM overhead. Single TCP ACK is a 64 byte long, 
> which is 2 ATM cells (5 byte header each)+ 2 AAL5 tails (8 octets each).
> So 
> single ack is has 16 bytes overhead, or 40%. With 200k ack peaks, HTB 
> accounts for additional 80k of overhead
> 
> --------------------------------------------------
> From: "Julien Vehent" <julien@linuxwall.info>
> Sent: Thursday, March 25, 2010 9:06 PM
> To: "Netdev" <netdev@vger.kernel.org>; "netfilter" 
> <netfilter@vger.kernel.org>
> Subject: QoS weirdness : HTB accuracy
> 
>> Hello folks,
>>
>> I observe unused bandwidth on my QoS policy that I cannot explain.
>> Conditions are: I have a HTB tree with 8 classes and a total rate of
>> 768kbits. I use the ATM option so I assume the real rate to be
something
>> close to 675kbits (about 88% of the ethernet rate).
>>
>> The sum of my 8 rates is exactly 768kbits. Some have ceil values up to
>> 768kbits.
>>
>> When class 20 "tcp_acks" starts borrowing, TC reduces the total
bandwidth
>> down to 595kbits/S (minus 79kbits/s). And I can't explain why....
>>
>> The attached graph "tc_htb_weirdness.png" shows the result: there are
>> 'holes' in the sending rate.
>>
>> I tried to play with burst sizes, r2q value and hysteresis mode, but
the
>> results are the same.
>>
>> System is debian squeeze, kernel version is 2.6.26, iproute2 version is
>> 2.6.26 - 07/25/2008.
>>
>> I have attached two files:
>> - "tcrules.txt" : the traffic control rules
>> - "tc_htb_weirdness.png" : the rrdtool graph, resolution is 1 second.
>>
>> And here:
http://jve.linuxwall.info/ressources/code/tc_hole_analysis.html
>> a sheet with some of the measures values. I used it to calculate the
size
>> of one of the hole. The last table (with green and red cells) shows
that,
>> when class 20 "tcp_acks" starts sending at unixtime 1265496813, there
is
>> a
>> lot of bandwidth left over (last column is all green). During the 95
>> seconds while class 20 is sending, 3880776 bits could be sent but are
>> not.
>> That's about 40kbits/s on average.
>>
>> Does anybody observess the same behavior? Any logical explanation to
this
>> or is it a bug ?
>>
>>
>> Julien
