From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: what filtering to do on the OUTPUT chain?
Date: Tue, 22 Oct 2002 14:57:24 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  i've had a number of people tell me that, while they put a
good deal of thought into their INPUT filtering, they simply
ACCEPT all outgoing traffic since, if their input filtering
is working properly, there's no reason to stop outgoing
packets.

  comments?  is there a FAQ that deals with what one should
filter on its way out?  i'm restricting this to the simple case
of firewalling a single host -- no routers, NAT, etc.

rday


