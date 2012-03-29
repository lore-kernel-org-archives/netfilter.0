From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iptables "-m time" option doesn't update when the clock
 changes
Date: Thu, 29 Mar 2012 12:45:52 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203291240390.26716@frira.zrqbmnf.qr>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr> <4F742BAD.20002@open-t.co.uk> <alpine.LNX.2.01.1203291157170.3606@frira.zrqbmnf.qr> <4F7437C3.5060306@open-t.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7437C3.5060306@open-t.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Arcus <shop@open-t.co.uk>
Cc: netfilter@vger.kernel.org

On Thursday 2012-03-29 12:21, Sebastian Arcus wrote:

> Hi Jan
>
> On 29/03/12 11:00, Jan Engelhardt wrote:
>>
> </snip>
>>
>>  The  caveat  with  the  kernel timezone is that Linux distributions may
>>  ignore to set the kernel timezone, and  instead  only  set  the  system
>>  time.  Even if a particular distribution does set the timezone at boot,
>>  it is usually does not keep the kernel timezone offset - which is  what
>>  changes  on DST - up to date.  ntpd will not touch the kernel timezone,
>>  so running it will not resolve the issue. As such, one may encounter  a
>>  timezone that is always +0000, or one that is wrong half of the time of
>>  the year. As such, using --kerneltz is highly discouraged.
>>
> Thanks for taking the time to give a detailed reply. Just to make sure I
> understand correctly - would this mean that there is no reliable way to run
> time based iptables rules and have them keep up with DST changes correctly and
> automatically - without restarting the machine when the DST kicks in or out?

UTC is reliable, no? :)

If you can reliably update the kernel TZ [that is, whenever a DST switch 
occurs], you can reliably match on non-UTC. This is possible from 
userspace (anything else would be surprising, since the kernel does 
not read arbitrary files).
