From: "Oscar N" <oscar@linnea.net>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 13:49:40 +0100 (CET)
Message-ID: <50544.85.119.130.97.1197377380.squirrel@mh.linnea.com>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
    <475DCD66.5080102@rtij.nl>
    <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com>
    <475E607C.2010101@rtij.nl> <m3zlwhihtg.fsf@ursa.amorsen.dk>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3zlwhihtg.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benny Amorsen <benny+usenet@amorsen.dk>
Cc: netfilter@vger.kernel.org

> Martijn Lievaart <m@rtij.nl> writes:
>
>> Have a look at User Mode Linux (UML). It allows to run virtual
>> machines with the least overhead of all virtaul machine mechanisms I
>> know. I have no idea how you have to do the plumbing to get the right
>> packets to the right VM, but I think it can be done.
>
> UML isn't particularly lightweight -- it requires a kernel per name
> space. OpenVZ can virtualize machines with just one kernel, but the
> conntrack tables will be separate.
>
> (At least I believe that is true, I've used OpenVZ for virtual routers
> but not for virtual firewalls.)
>
>
> /Benny

I've tried UML and didn't like the approach. OpenVZ seems more interesting
and I will take a look at it before I try some conntrack modifying.
Thanks for the tip benny.

/Oscar

