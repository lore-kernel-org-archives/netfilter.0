From: John Dalbec <jpdalbec@cc.ysu.edu>
Subject: ip_conntrack dropping UDP connections early
Date: Fri, 13 Sep 2002 15:09:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8237E2.40600@cc.ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm running into problems with Amanda and DNS because (at least in the 
case of Amanda) the UDP connections sometimes have no traffic for as 
long as 60s and the connection gets dropped.  Can I increase the 60s 
inactivity timeout?  Are the connections being dropped because the 
connection table fills up?  Can I increase the size of the connection 
table to fix these problems?
Thanks,
John Dalbec


