From: Joe Judge <joe_judge@guardium.com>
Subject: to patch, or not to patch?
Date: 27 Mar 2003 10:27:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048778825.17439.7.camel@midgard.guardium.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Should I do the Patch-o-matic to get the ROUTE patch?
or is there a way to do this?


	-joe

I have a netfilter box on a monitoring port (span port)
of a switch (eth0).

I want to:
  - pick out the packets from  *-->server and
  send them out the back-end eth1 interface.
  - pick out the packets from  server-->* and
  send them out the other back-end eth2 interface

Long ago, in my solaris days, I used ipfilter -- which had a feature
like the current ROUTE p-o-m patch, a "bypass system routing, go out
this interface now" jump.


-- 
Joe Judge <joe_judge@guardium.com>
Guardium


