From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: stop/start iptables vs. "iptables-restore"
Date: Fri, 24 Aug 2007 10:46:32 -0400
Message-ID: <1187966792.6814.3.camel@localhost>
References: <46CE273A.50807@funkware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46CE273A.50807@funkware.com>
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
To: Alex Tang <altitude@funkware.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2007-08-23 at 17:32 -0700, Alex Tang wrote:
> Hi folks,
> 
> We run a linux based product (RHEL4 based, kernel-2.6.9-55, and 
> iptables-1.2.11). During the running of the product, when we make 
> changes to the iptables configuration, we use the SysV-like RHEL script 
> "/etc/init.d/iptables restart", which effectively stops iptables, 
> unloads all of the iptables based kernel modules, then starts iptables 
> and all the kernel stuff. 
> 
> A colleague recently asked why we're not using "iptables-restore" 
> instead of the script which does "stop/start".  I'm looking to see if 
> you know of any reasons why we should or should not use iptables-restore 
> vs. "stop/start".  Does it matter if the number of connections on the 
> system is high?  Our product can sometimes handle many millions of 
> connections per day.
> 
> Thanks.
> 
> ...alex...
> 
> 
There is a dramatic difference in the time it takes to load the rules
and rule changes.  In the ISCS network security management project
(http://iscs.sourceforge.net), we frequently generate rule sets in the
tens of thousands of rules and rule change sets in the thousands of
rules to implement micro-partitioned, highly granular security.  We
found using just iptables was a showstopper.

Thus, ISCS not only loads its boot rule set using iptables-restore but
even makes dynamic changes by writing an iptables-restore rule file and
loading it via iptables-restore -n.

Hope that helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


