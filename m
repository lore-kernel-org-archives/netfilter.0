From: James Rhett Aultman <jaultman@cise.ufl.edu>
Subject: running commands when packet matched
Date: Sat, 03 Dec 2005 17:39:32 -0500
Message-ID: <43921EA4.7060905@cise.ufl.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Dear Netfilter users,

I'm trying to put together a prototype for a project at the moment and
I'm trying to think about the proper architecture to use for it. 
Basically, I need to be able to run a certain program when a given
machine sees certain kinds of traffic coming across it.  I'm looking
into doing this with iptables, but the tutorials I've read don't cover
cases like mine.  Again, to explain the mechanism I need: when the
machine encounters a packet matching a rule, I want the machine to run a
specific program and drop the packet.

Is something like this possible using iptables or another netfilter project?

--
Rhett.





