From: Martijn Lievaart <m@rtij.nl>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 18:46:46 +0100
Message-ID: <475ECD06.1090000@rtij.nl>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com> <475DCD66.5080102@rtij.nl> <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com> <475E607C.2010101@rtij.nl> <m3zlwhihtg.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3zlwhihtg.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Benny Amorsen <benny+usenet@amorsen.dk>
Cc: netfilter@vger.kernel.org

Benny Amorsen wrote:
> Martijn Lievaart <m@rtij.nl> writes:
>
>   
>> Have a look at User Mode Linux (UML). It allows to run virtual
>> machines with the least overhead of all virtaul machine mechanisms I
>> know. I have no idea how you have to do the plumbing to get the right
>> packets to the right VM, but I think it can be done.
>>     
>
> UML isn't particularly lightweight -- it requires a kernel per name
> space. OpenVZ can virtualize machines with just one kernel, but the
> conntrack tables will be separate.
>   

Thanks, I wasn't aware of OpenVZ, will look into that.

M4

