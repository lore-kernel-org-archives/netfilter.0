From: Peter Schobel <pschobel@porchlight.ca>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 16:56:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <956E27D0-4225-11D8-AFEE-000393677A36@porchlight.ca>
References: <200401082107.37792.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401082107.37792.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


On Thursday, January 8, 2004, at 04:07  PM, Antony Stone wrote:

> On Thursday 08 January 2004 8:05 pm, Peter Schobel wrote:
>
>> ok, I downloaded the source ball for iptables 1.2.9, and compiled 
>> using
>>
>> make KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>>
>> i got an error from config.h telling me to use the glibc version so i
>> symlinked /usr/src/linux-2.6.0-1.107 to /usr/include/linux/config.h
>
> I'm not sure I like the implications of this - what version of the 
> kernel
> headers do you have in /usr/include/linux?

I'm using the kernel-source rpm package that matches my kernel package

kernel-source-2.6.0-1.107

this is what my original config.h file looks like

#ifndef _LINUX_CONFIG_H
#define _LINUX_CONFIG_H

#include <linux/autoconf.h>
#ifndef __KERNEL__
#error including kernel header in userspace; use the glibc headers 
instead!
#endif
#endif

*****************************
Peter Schobel
Network Administrator
Porchlight.ca
Unlimited Internet
*****************************
In a world without walls or fences
We will have no need for gates or windows
*****************************


