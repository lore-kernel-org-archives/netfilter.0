From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Forwarding traffic destined to local machine
Date: Sat, 8 Nov 2003 12:08:52 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311081206340.22835-100000@csa.bu.edu>
References: <Pine.SOL.4.20.0311071828040.14674-100000@csa.bu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311071828040.14674-100000@csa.bu.edu>
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

How can I forward traffic(to some different machine) that is destined to
the local machine using netfilter?

Changing destination address at the prerouting hook doesn't seem to work.



