From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 18:51:54 +0200
Message-ID: <508D62AA.8070304@ngtech.co.il>
References: <5088717B.6080300@wildgooses.com> <508D4A16.5020509@ngtech.co.il> <508D5747.1000304@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508D5747.1000304@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

On 10/28/2012 6:03 PM, Ed W wrote:
> Test??  What does that word mean? :-)
>
>
> I think the error means that you don't have libxt_ndpi.so in a location
> that your iptables expects to find it?  Often it's /usr/lib/xtables or
> /lib/xtables.  Check where other things are and place the file
> appropriately
>
> Does that fix it?
/usr/lib it is, /lib/ .. dosnt work for me.

also notice that the "MODULES_DIR" and "KERNEL_DIR" are needed for my 
system.
If and only if you have an idea how to make the Makefile recognize the 
proper "lib" directory and install the module it will be much more 
helpful to others.

Thanks,
Eliezer

>
> Ed


-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
