From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: tcpdump and iptables ..
Date: Sat, 06 Mar 2004 11:16:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078589808.2066.3.camel@localhost>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local>
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
To: Mussie Gebregziabiher <mussieg@comcast.net>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-03-06 at 10:59, Mussie Gebregziabiher wrote:
> Dear All,
> 
> When I run tcpdump I seem to be getting data after it is being processed by
> iptables.   Can someone tell me where 'tcpdump' resides in the order of
> priority?  Have the packets I'm seeing been subjected to 'PREROUTING' rules
> such as 'MANGLE' and 'NAT'?  
<snip>
I'll relate my experiences trying to trace the interchange between
iptables and openswan but it is only from observation.  If someone who
knows the code responds, please take their word for it over mine.

I believe you will see the packet on the inbound interface before it
hits the PREROUTING chain of the mangle table.  You will see it on the
outbound interface after it has passed through POSTROUTING (I don't
recall off the top of my head if nat or mangle is last.

If there is a hand-off to another interface during packet processing,
you will see it again in tcpdump on the new interfaces again,
pre-PREROUTING and then post-POSTROUTING.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


