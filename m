From: utteerna <utteerna@gmail.com>
Subject: Re: Small doubt from a newbie :)
Date: Tue, 07 Nov 2006 16:56:36 +0530
Message-ID: <45506D6C.5040804@gmail.com>
References: <45504519.3070907@gmail.com>
	<63384.193.173.147.3.1162891542.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <63384.193.173.147.3.1162891542.squirrel@webmail.sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

I tried this. But whatever patch, i try to apply i get the message "n 
missing files "(n=1,2,3 etc..) and patch fails. Is it possible to apply 
only the random patch and skip others. Also why am i getting these 
missing file messages. I took the iptables source from the location

ftp://ftp.netfilter.org/pub/iptables/iptables-1.3.6.tar.bz

Thanks
Uttee

##########################################################################
Welcome to Patch-o-matic (1.17)!

Kernel:   2.6.17, /usr/src/linux-2.6.17.13
Iptables: 1.3.6, /usr/src/iptables-1.3.6
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
02_linux-2.4.24.patch does not match your source trees, skipping...
Already applied: 01_iptables-1.2.10.patch 01_linux-2.6.3.patch

Testing 02_linux-2.6.4.patch... not applied
The 02_linux-2.6.4.patch patch:
   Author: Various
   Status: Mandatory

This patch contains all netfilter changes between stock kernel
versions 2.6.4 and 2.6.5.

+ Fix ip_conntrack_helper dependency in ip_conntrack.h
  (Sergio Monteiro Basto)
  
(http://lists.netfilter.org/pipermail/netfilter-devel/2002-November/009928.html)
+ Missing null mapping for local->local traffic
  with CONFIG_IP_NF_NAT_LOCAL disabled (KOVACS Krisztian)
+ ipt_MASQUERADE.c bugfix to compile it cleanly when debugging
  is enabled (Harald Welte)
+ Let the user send reset packet for bridged frames in the
  FORWARD chain with ip forwarding disabled (Bart de Schuymer)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
cannot apply (2 missing files)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
##################################################################################################

Rob Sterenborg wrote:
> On Tue, November 7, 2006 09:34, utteerna wrote:
>   
>> Hi all,
>>
>>
>> I want to use the iptables "-m random" option.
>>
>>
>> I visited - http://www.netfilter.org/documentati...O-2.html#ss2.1
>> <http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-2.htm
>> l#ss2.1>
>>
>> to get p-o-m but login failed. Can anyone guide me on how to install this
>> patch.
>>     
>
> To download a new pom (pom-ng nowadays) go to the Netfilter FTP site
> (ftp.netfilter.org/pub/patch-o-matic-ng/) and download it there; one of the
> snapshots should do.
>
>   
>> In the iptables source dowloaded from net i see the libipt_random.c but
>> when i do a make it doesn't complile to generate a ".so".
>>     
>
> You have to configure your kernel to include "random" support and install it.
> I just checked but the "random" match is not in 2.4.33.3 or 2.6.18.2 so you'll
> have to patch your kernel for this to work. Then compile and install iptables.
>
> To patch the kernel:
> - untar kernel source
> - untar iptables source
> - untar pom-ng source
> - run:
>   KERNEL_DIR=/path/to/kernel \
>   IPTABLES_DIR=/path/to/iptables \
>   ./runme extra
>
>
> Grts,
> Rob
>
>
>
>
>   

