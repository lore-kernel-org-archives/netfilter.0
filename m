From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: ROUTE extension for linux 2.6.3 HELP
Date: Sun, 07 Mar 2004 01:57:20 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404AF200.60200@smgtec.com>
References: <1078615714.12327.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078615714.12327.10.camel@localhost>
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
To: Bruce Henshaw <salacious@redphive.org>
Cc: netfilter@lists.netfilter.org

You don't need the route extension to do "policy routing". All you need 
is CONNMARK, and a customized iproute2 setup that has multiple routes 
set up.

Pseudo-tasks:

Add routing tables for each WAN interface
Add routing rules that link FWMARK's with the routing tables previously 
created.
Add CONNMARK and MARK entries to PREROUTING and/or OUTPUT in order to 
keep track of sessions and direct traffic to the routing table you 
desire by setting the packet's firewall MARK.
Profit!

If you've exhausted researching what I have described above, come back 
and I'll give some more detail. I am pretty tired at this point, so I 
wouldn't be much help (2:00 am)..



Bruce Henshaw wrote:

>Hello,
>
> I have a need to direct certain traffic out certain WAN interfaces,
>which have dynamic addresses.
>
> I'm unable to patch my 2.6.3 kernel with the ROUTE extension though. :(
>is there another way to do that?
>
>I tried the new patch-o-matic-ng CVS and it says ROUTE requires kernel <
>2.6.0
>
> But I do see this file.
>
> patch-o-matic-ng/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c
>
> How I can add ROUTE in my 2.6.3 kernel?
>
> Thanks very much for reading about my problem.
>
>Bruce Henshaw
>
>
>  
>

