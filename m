From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 19:57:27 +0200
Message-ID: <508D7207.9090400@ngtech.co.il>
References: <5088717B.6080300@wildgooses.com> <508D4A16.5020509@ngtech.co.il> <508D5747.1000304@wildgooses.com> <508D62AA.8070304@ngtech.co.il> <508D6415.5020708@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508D6415.5020708@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

On 10/28/2012 6:57 PM, Ed W wrote:
> I compile for a non-installed (cross compiled) kernel with:
>
>      NDPI_PATH=/usr/src/nDPI KERNEL_DIR=/usr/src/linux make
>
> If you need MODULES_DIR (not sure why?) then I guess just add that
>
> You can install the kernel module easily enough, either by adding
> "modules_install" to the end of the above (lib location should be picked
> up automatically) or manually with something as simple as:
>
>      mkdir /lib/modules/your_kernel/extra
>      cp src/xt_ndpi.ko /lib/modules/your_kernel/extra
>      depmod -a
>
> Incidentally, not sure why use that /extra directory?  Anyone got a
> better suggestion on location?
>
> Obviously *also* install the netfilter module (ipt/libxt_ndpi.so) into
> your netfilter modules location
>
> Does that get you going?
>
> Ed W
I'm OK dont have any problems and done it manually already.
since it was loaded by modprobe and iptables -m ndpi -help works now I 
can test small things like marking packets to make sure it wont break 
anything.

Will look on it in the next few days.

Eliezer
-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
