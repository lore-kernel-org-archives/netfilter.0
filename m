From: Ilo Lorusso <sneak147@gmail.com>
Subject: Re: port based routing - help with tcpdump
Date: Tue, 9 Nov 2010 15:19:06 +0200
Message-ID: <AANLkTikRY6mYY5fAAN4Ey-BaOQSOiXtx-StUejyQGG+x@mail.gmail.com>
References: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>
	<4CD7CD88.6010100@plouf.fr.eu.org>
	<AANLkTimeCfv9i13L9PFpOxTRbzG4c4Qpa7XO5quK2CEY@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=HfshuAy9Q74BY4+DKhIXLfpYUWpa2UMTEgE2sfDtefk=;
        b=vG73RMlEiUXATyUMwXPt+czwoW/+sAw5b3FAYtHi0lmFXgCIy9r7ClSdDc3yQCzSy5
         mmQqaprWh/UHYVdVYjyHcVqstpWezD3fnIRaPz2Y6TZ0zuLaDlbXAOZ2L4IMZum6NXeP
         z+jUhiCDs+QFNNQ6yAPZcSV4vrmHrBEBjvIpA=
In-Reply-To: <AANLkTimeCfv9i13L9PFpOxTRbzG4c4Qpa7XO5quK2CEY@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

Hi ,,

im having simalar problem , i set the below up for traffic that gets
forward though my linux box..
I can see the traffic returning though the alternate interface yet the
port does not connect..

I have turned of RP_filtering on all my interfaces and there is are no
conflicting Deny statements on my iptables .. is there anything else
that I would cause this?

On Mon, Nov 8, 2010 at 12:36 PM, Ilo Lorusso <sneak147@gmail.com> wrote=
:
> thanks it was the RP_filter on the alt interface..
>
> Awesome.
>
>
> On Mon, Nov 8, 2010 at 12:14 PM, Pascal Hambourg
> <pascal.mail@plouf.fr.eu.org> wrote:
>> Hello,
>>
>> Ilo Lorusso a =E9crit :
>>>
>>> I implement port based routing using a howto I found from a website
>>> (http://www.sparksupport.com/blog/tag/port-based-routing),
>>> which I can see is working based on various tcpdumps from
>>> various boxes. The problem is the port I route out to the alternate
>>> interface does not connect even though I do see the traffic comebac=
k
>>> so I know the routing is working fine.
>>
>> Any filtering rules in INPUT which may drop the replies ?
>> Is rp_filter disabled the alternate interface ?
>>
>
