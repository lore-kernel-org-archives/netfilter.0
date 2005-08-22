From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: building a iptables-firewallcluster
Date: Mon, 22 Aug 2005 13:50:48 +0200
Message-ID: <200508221350.48867@nienna>
References: <20050802120309.GA5501@256bit.org>
	<20050821133749.GB20106@256bit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050821133749.GB20106@256bit.org>
Content-Disposition: inline
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
To: Marc Schoechlin <ms@256bit.org>
Cc: netfilter@lists.netfilter.org


  Hi,

On Sunday 21 August 2005 15.37, Marc Schoechlin wrote:
> > Is this now part of the linux-kernel or are there now other
> > strategies to build firewallclusters for load-balancing and/or
> > high-availability ?
> >
> > Where can i get detailed information about the installation of a
> > iptables-based firewall-cluster ?
>
> No resonse for two weeks - am i right to assume that this
> project is dead ?

  Almost, but not completely dead.

  Current code can be found in the netfilter SVN repository, take a look 
at these URLs:
 
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/branches/netfilter-ha/linux-2.6/
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/branches/netfilter-ha/linux-2.6-actact/

  The linux-2.6 branch is the current (actually quite old) code for 
2.6.10; the linux-2.6-actact branch is Harald's latest development 
version (configurable through sysfs, capable of participating in 
multiple sync groups, etc.). This latter branch is even more 
experimental than the linux-2.6 branch, of course...

  Some of the infrastructure necessary for this code (namely conntrack 
events) will be part of Linux 2.6.14 (it's already in David Miller's 
2.6.14 networking branch). Unfortunately Harald's -actact branch is far 
from being complete, and porting this code for the (slightly changed) 
Linux-2.6.14 infrastructure is to be done. Slightly more information 
can be found in the netfilter-ha mailing list archive (yes, I know, 
that list seems to be dead as well).

  Unfortunately Harald does not seem to have the time necessary to work 
on this project right now, and neither do I. (Apart from this, I also 
don't have the devices necessary to do _any_ testing apart from 
compiling the code...)

  Sorry for the late answer, but the case is that I very rarely read the 
'netfilter' mailing list.

-- 
 Regards,
  Krisztian Kovacs

