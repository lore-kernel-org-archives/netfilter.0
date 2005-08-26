From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Documentation for /proc/sys/net/ipv4/
Date: Fri, 26 Aug 2005 14:31:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0508261430410.5480@mercury.sdinet.de>
References: <200508260947.09491.vladislav.kurz@webstep.net>
	<Pine.LNX.4.62.0508261425330.5480@mercury.sdinet.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0508261425330.5480@mercury.sdinet.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Vladislav Kurz <vladislav.kurz@webstep.net>
Cc: netfilter@lists.netfilter.org

On Fri, 26 Aug 2005, Sven-Haegar Koch wrote:

> On Fri, 26 Aug 2005, Vladislav Kurz wrote:
>
>> Is there a reference documentation for the dozens of files in
>> proc/sys/net/ipv4/ and subdirectories, especially
>> proc/sys/net/ipv4/netfilter ?
>> I have tried googling, serching the sources, but didn't find it.
>
> Some of them are documented in the kernel source under 
> Documentation/networking/ip-sysctl.txt. But my box (currently debian's 
> 2.6.12-1-686) does not have a proc/sys/net/ipv4/netfilter subdir at all.

Small follow up:
the subdir is there, I should have looked onto a box that has netfilter at 
least loaded ;)

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

