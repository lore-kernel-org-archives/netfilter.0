From: Andrew Beverley <andy@andybev.com>
Subject: Re: Connlimit and linux-2.6.17
Date: Wed, 19 Jul 2006 22:21:36 +0100
Message-ID: <44BEA260.2050702@andybev.com>
References: <44BE4C27.7050602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BE4C27.7050602@gmail.com>
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
To: Adlan <adlan.elm@gmail.com>
Cc: netfilter@lists.netfilter.org

> I got similar problems after I moved to 2.6.17.6 from 2.6.14
> I've downloaded latest POM and patched kernel manually
> I didn't notice if there were any warnings when building kernel.

I suspect the warnings I got means it's got problems - but I am not a C programmer!

The code in question is the highlighted lines below:

static struct ipt_match connlimit_match = {
         .name = "connlimit",
         .match = &match,               <--
         .checkentry = &check,          <--
         .destroy = &destroy,           <--
         .me = THIS_MODULE
};

> This is what I get when I try to use connlimit match
 >
> iptables: Unknown error 18446744073709551615

I was getting a very similar error when using iptables 1.3.5. The error changed to 
"iptables: Invalid argument" when I used iptables-1.3.5-20060508.

> and, finally dmesg tells me:
> 
> ip_tables: connlimit match: invalid size 0 != 24
> ip_tables: connlimit match: invalid size 0 != 24

I get 'connlimit match: invalid size 0 != 16'

I will email netfilter-devel and see if I can get an answer there. It looks like 
no one is maintaining connlimit - last date in the code is 2002!

Andy Beverley


