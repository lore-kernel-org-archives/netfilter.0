From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: filtering in mangle table
Date: Fri, 27 Jul 2007 07:59:56 -0400
Message-ID: <1185537596.6574.2.camel@localhost>
References: <dae53550707270302r6887a6a4g3c9ddfd7d070afab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dae53550707270302r6887a6a4g3c9ddfd7d070afab@mail.gmail.com>
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
To: Ganesan Natarajan <natrajputra@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2007-07-27 at 15:32 +0530, Ganesan Natarajan wrote:
> Hi,
>        My requirement is before giving the packets to user space
> application(even before routing) I need to filter the packets. This
> has to be done for all packets irrespective of particular protocol.
> 
> so I am using the the mangle table with PREROUTING chain to filter as
> well as to queue the packets using the DROP, QUEUE targets of
> "iptables". But in man pages it is specified that the filter rules
> should not be added into mangle table.
> 
> Is there any issues if I proceed with that?
> 
> Ganesan
> 
We have been doing something very similar in the open source ISCS
network security management project (http://iscs.sourceforge.net).
Although the bulk of the tens of thousands of access control rules we
create for complex internal and micro-perimeter security are added to
our filter table, we handle malicious packet checks (spoofs, ping
floods, malformed packets, etc.) in the mangle table.  Seems to be
working fine for us! - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


