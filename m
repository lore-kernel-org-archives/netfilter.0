From: Ed W <lists@wildgooses.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 16:57:57 +0000
Message-ID: <508D6415.5020708@wildgooses.com>
References: <5088717B.6080300@wildgooses.com> <508D4A16.5020509@ngtech.co.il> <508D5747.1000304@wildgooses.com> <508D62AA.8070304@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508D62AA.8070304@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

On 28/10/2012 16:51, Eliezer Croitoru wrote:
> On 10/28/2012 6:03 PM, Ed W wrote:
>> Test??  What does that word mean? :-)
>>
>>
>> I think the error means that you don't have libxt_ndpi.so in a location
>> that your iptables expects to find it?  Often it's /usr/lib/xtables or
>> /lib/xtables.  Check where other things are and place the file
>> appropriately
>>
>> Does that fix it?
> /usr/lib it is, /lib/ .. dosnt work for me.
>
> also notice that the "MODULES_DIR" and "KERNEL_DIR" are needed for my 
> system.
> If and only if you have an idea how to make the Makefile recognize the 
> proper "lib" directory and install the module it will be much more 
> helpful to others.

I compile for a non-installed (cross compiled) kernel with:

     NDPI_PATH=/usr/src/nDPI KERNEL_DIR=/usr/src/linux make

If you need MODULES_DIR (not sure why?) then I guess just add that

You can install the kernel module easily enough, either by adding 
"modules_install" to the end of the above (lib location should be picked 
up automatically) or manually with something as simple as:

     mkdir /lib/modules/your_kernel/extra
     cp src/xt_ndpi.ko /lib/modules/your_kernel/extra
     depmod -a

Incidentally, not sure why use that /extra directory?  Anyone got a 
better suggestion on location?

Obviously *also* install the netfilter module (ipt/libxt_ndpi.so) into 
your netfilter modules location

Does that get you going?

Ed W
