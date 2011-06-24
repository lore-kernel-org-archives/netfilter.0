From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables links
Date: Sat, 25 Jun 2011 00:12:06 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106250007250.16290@frira.zrqbmnf.qr>
References: <4E03BB34.70704@abpni.co.uk> <alpine.LNX.2.01.1106240143500.20064@frira.zrqbmnf.qr> <4E03D4F7.9040609@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E03D4F7.9040609@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Friday 2011-06-24 02:06, Jonathan Tripathy wrote:

>
> On 24/06/2011 00:44, Jan Engelhardt wrote:
>> On Friday 2011-06-24 00:16, Jonathan Tripathy wrote:
>>
>>> Hi Everyone,
>>>
>>> Is there any quick command that I can use with iptables to remove all links
>>> to
>>> a chain, as well as removing the chain itself?
>> No, -F would clean the chain, and -X would remove them, which are
>> currently two separate operations with the iptables(8) frontend.
> Hi There,
>
> Thanks for this, however I already knew those commands. I'm looking for a
> command to clear the links to the chain (the commands above clear the chain
> itself), however I'm guessing is there none?

Indeed there are none.
