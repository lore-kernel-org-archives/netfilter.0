From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Maximum chain name length
Date: Mon, 08 Dec 2003 06:31:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070883092.1932.2.camel@jasiiitosh.nexusmgmt.com>
References: <1070674657.3314.9.camel@jasiiitosh.nexusmgmt.com>
	 <1070780614.4839.25.camel@jasiiitosh.nexusmgmt.com>
	 <20031208094253.GA16045@orthanc.gambrl01.md.comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208094253.GA16045@orthanc.gambrl01.md.comcast.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Michael Rash <mbr@cipherdyne.org>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-12-08 at 04:42, Michael Rash wrote:
> On Dec 07, 2003, John A. Sullivan III wrote:
> 
> <snip>
> 
> > AppliedTechnologies/Engineering/NewProducts/SanFranciscoLabs/ProjectB
> > 
> > is not out of the ordinary.  This runs us up against the 30 character
> > limit of chain names very quickly.  Working around this by substituting
> > numbers for names or some other such workaround will greatly complicate
> > the project and reduce ease of troubleshooting in the field.
> > 
> > 	Is there any way to extend the maximum allowed chain name length in
> > iptables? Thanks - John
> 
> (Re-posting this since my original post did not seem to make it through).
> 
> On way to extend the chain name length would be to modify
> IPT_FUNCTION_MAXNAMELEN in both the userspace and kernel versions of
> the ip_tables.h header file (or create a new #define just for the chain
> length since several things depend on IPT_FUNCTION_MAXNAMELEN).  You
> might try posting to the netfilter-devel list, but this is not exactly
> a trivial modification (how to maintain backward compatibility with
> older kernels, etc.).
> 
> --Mike
> 
> Michael Rash
> http://www.cipherdyne.org
> Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

Thanks for the suggestion to post to the development list.  I'm always
hesitant to do that but I'll go ahead.  What are the kernel issues with
using longer chain names?
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


