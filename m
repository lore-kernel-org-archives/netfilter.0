From: "Steven M. Carter" <scarter@ornl.gov>
Subject: iptables-save and netlink question.
Date: Fri, 05 Mar 2004 09:09:45 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0403050834550.1135-100000@localhost.localdomain>
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
To: netfilter@lists.netfilter.org


I have a piece of code that proxies connections in front of one of our
supercomputers.  The code uses REDIRECT to intercept the packet, then
SNAT's it on the way out.  Currently, it is using a system() call to add
the rules.  I read that a pipe open to iptables-save is more efficient for
adding a batch of rules, but is it efficient for adding many single 
rules over the long haul?  Would I have to worry about the process dying 
over days?

Another related question, I would like to make sure that there is
something listening on the destination addr/port before I proxy the
connection (or at least before finishing the negotiation on the ingress
side).  I can intercept the initial SYN packet with netlink, then try the
destination machine.  If the destination addr/port does not answer, I can
reject the connection.  If it does answer, is there a way to inject the
initial SYN packet back into the stack to finish the handshake on the 
ingress side?  Something along these lines would be nice since it allows me 
to avoid a kernel change.

Steven.

-- 
scarter@ornl.gov
Oak Ridge National Laboratory


