From: Marcus Mikolaiczyk <marcus.mikolaiczyk@carmedialab.de>
Subject: Re: 'Cross' Compiling iptables
Date: Tue, 15 Mar 2005 10:14:00 +0100
Message-ID: <4236A758.6060306@carmedialab.de>
References: <42369D6B.7060502@carmedialab.de>
Reply-To: marcus.mikolaiczyk@carmedialab.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42369D6B.7060502@carmedialab.de>
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
To: netfilter@lists.netfilter.org

Ok I found some differences in the ported linux sources.

 > I got a problem compiling iptables for an embedded system (kernel
 > 2.4.19, ported gcc version 2.95.3 ). I use the folowing make command
 > which stops in compiling extensions/libipt_TCPMSS.o

linux/netfilter_ipv4/ipt_TCPMSS.h is different to the original one from 
kernel.org.
linux/netfilter_ipv4/ipt_TOS.h is missing but there is a 
linux/netfilter_ipv4/ipt_tos.h

Can anyone explain the differences between the 'capital'(uppercase) 
ipt_TCPMSS.h and the lowercase ipt_tcpmss.h ?

Greetings Marcus

