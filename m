From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Matching 10000's of IP ranges
Date: Mon, 03 Jan 2005 13:17:54 -0500
Message-ID: <1104776274.3277.22.camel@jasiiitosh.opensourcedevel.com>
References: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Brian Gunlogson <bmg300@yahoo.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sun, 2005-01-02 at 14:50 -0800, Brian Gunlogson wrote:
> Hello list,
> 
> What is a reasonable way to match around 80000 IP ranges with iptables?
> 
> Thanks,
> Brian G.
<snip>
I'm not entirely sure of what you mean.  Do you mean 80000 distinct IP
address ranges or 80000 addresses that fall into IP ranges which are not
on subnet boundaries?

The iprange patch will enable you to define ranges in iptables.  If you
do not want to patch, you can use SubnetCreator
(http://subnetcreator.sourceforge.net).  This will take a range and
break it into subnets.  In fact there are some Qt objects included in
the application for doing this programmatically although I really need
to update them as we have made substantial improvements to them lately.
In fact, we use it as part of the ISCS network security management
project.  If the chosen gateway has the iprange patch applied, we create
rules with ranges; if not, we use the subnetcreator routines to create
rules with subnets that together recreate the range.

You will also want to ensure that you load the rules with iptables-
restore or iptables-restore -n rather than using a script with lots of
iptables commands.  At your size, individual iptables commands would
take forever to load.
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


