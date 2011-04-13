From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Fwd: Iptables, timestart and timestop arguments and daylight
 saving time in UK
Date: Wed, 13 Apr 2011 19:27:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104131918110.18644@obet.zrqbmnf.qr>
References: <4DA5A6C6.7040404@open-t.co.uk> <alpine.LNX.2.01.1104131538050.1994@obet.zrqbmnf.qr> <4DA5CD09.6010503@open-t.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA5CD09.6010503@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Arcus <shop@open-t.co.uk>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-04-13 18:19, Sebastian Arcus wrote:

>
>
> On 04/13/2011 02:38 PM, Jan Engelhardt wrote:
>> On Wednesday 2011-04-13 15:36, Sebastian Arcus wrote:
>>
>>> Bump
>>>
>>> Anybody?
>>
>> See http://bugs.debian.org/615121
>>
>
>Thank you for that. From reading the bug report, I take it there is no 
>solution for it but to restart the server/machine in question after 
>each DST change?

Solution is to just always use UTC.
