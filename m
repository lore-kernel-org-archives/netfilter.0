From: James Mullens <mullensja@ornl.gov>
Subject: RE: IPTables State Tracking
Date: Fri, 29 Aug 2003 20:11:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d601c36e8b$394be310$7309db80@ornl.gov>
References: <0C7C6E1720E8D74FB52EBEF93649730A0116BF07@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <0C7C6E1720E8D74FB52EBEF93649730A0116BF07@2k099exm01.compucom.local>
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
To: Josh.Berry@compucom.com, netfilter@lists.netfilter.org


I believe that a UDP packet that passes through the filters opens a 30
second window for replies.  If a reply comes this is considered to be a
conversation and the window is extended to 180 seconds.  I think the
window is extended as long as the conversation continues.  

For ICMP I believe only types echo, timestamp, info request, and address
can open a 30 second window for a single reply.  The window is closed
when a reply is received.  

This is from netfilter Red Hat 8, kernel 2.4.18.  

Someone who has actually worked on the code may know better.

jim mullens

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
Josh.Berry@compucom.com
Sent: Friday, August 29, 2003 10:39
To: netfilter@lists.netfilter.org
Subject: IPTables State Tracking


Does IPTables track virtual state of ICMP and UDP packets?  I know that
UDP and ICMP are not stateful connections, but does IPTables perform
pseudo-stateful tracking of these connections such as some other
firewalls that basically timeout UDP/ICMP connections after a specific
time?

Thanks,
Josh Berry
Information Security Group
972-856-5402




