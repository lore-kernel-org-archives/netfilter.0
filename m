From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Problem with FORWARD hook
Date: Tue, 11 Nov 2003 16:59:10 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311111655550.29271-100000@csa.bu.edu>
References: <20031111191318.84468.qmail@web13114.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031111191318.84468.qmail@web13114.mail.yahoo.com>
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

When I dump the output of all the packets traveling thru my machine, I
notice that none go thru FORWARD hook. So, I tried to make a packet have
to go thru the FORWARD hook (ie by changing the packet dest at PREROUTING
hook), but the packet never goes to the FORWARD hook, but disappears.

Can there be some incorrect configuration on my machine that would cause
it not to be able to forward packets?

Thanks.



