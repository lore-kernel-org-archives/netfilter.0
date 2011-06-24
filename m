From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: iptables links
Date: Fri, 24 Jun 2011 01:06:15 +0100
Message-ID: <4E03D4F7.9040609@abpni.co.uk>
References: <4E03BB34.70704@abpni.co.uk> <alpine.LNX.2.01.1106240143500.20064@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106240143500.20064@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


On 24/06/2011 00:44, Jan Engelhardt wrote:
> On Friday 2011-06-24 00:16, Jonathan Tripathy wrote:
>
>> Hi Everyone,
>>
>> Is there any quick command that I can use with iptables to remove all links to
>> a chain, as well as removing the chain itself?
> No, -F would clean the chain, and -X would remove them, which are
> currently two separate operations with the iptables(8) frontend.
Hi There,

Thanks for this, however I already knew those commands. I'm looking for 
a command to clear the links to the chain (the commands above clear the 
chain itself), however I'm guessing is there none?

Thanks
