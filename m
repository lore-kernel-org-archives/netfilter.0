From: "Horton, Dave" <dhorton@pactolus.com>
Subject: can a nat helper module do this?
Date: Sat, 17 Jul 2004 00:05:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CC2CB3C95C3D311ABAC009027DCD77E0196906C@flyhalf.pactolus.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


Can a userland process interact with a nat helper module, and if so how ?

I want to use NAT to forward packets to other servers, unfortunately the
"rules" for doing so are quite dynamic and controlled by an application
operating in user space.  I am thinking one approach would be to implement a
nat helper module that would interact with this application to maintain a
dynamic list of forwarding instructions, then as my 'expect' function is
called it could examine the destination ip and port against the list and, if
matched, modify the packet so as to source and dest NAT it to the remote
destination indicated in the forwarding instructions.

Is this feasible ?  What interface exists for my user process to communicate
with my nat helper module to communicate requested routing changes?

