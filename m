From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: how many rules can be added?
Date: Thu, 16 Sep 2004 12:49:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095353375.2064.143.camel@localhost>
References: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Alaadin <alaadin@alaadin.org>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 10:10, Alaadin wrote:
> Hello,
> 
> how many ip tables rules can i add ?
> i added already 40
> if i added untill 100 or 500 rule
> would this make problems ?
> would this make the system lag ?
> would this make the system hang
> how many ip tables rules can i add ? or its unlimited?
You can add many more than 500! For the complex security we manage on
the ISCS project (http://iscs.sourceforge.net), we frequently encounter
rule sets many times this size.

As your rule set grows, you will want to pay attention to two particular
needs:

1) Optimize the traversal of your rule sets by using user defined
chains.  This is analogous to database indexing.  Sort your packets as
they come in and direct them to a subset of the total rules.

2) Optimize the load time of the rules.  This is noticeable even with
relatively small rule sets.  Use iptables-restore -n instead of loading
each rule separately with an iptables command.

Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


