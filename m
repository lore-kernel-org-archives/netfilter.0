From: dummy@sapmail.pg.com
Subject: Port forwarding without masquerading..???
Date: Sun, 27 May 2007 20:21:36 -0600 (MDT)
Message-ID: <3143.67.190.128.248.1180318896.squirrel@webmail.usermail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All,

I am changing data centers and want to forward traffic hitting server A to
Server B in another data center.  I was using masquerading and it was
working fine, however a problem has popped its ugly head.  Server B needs
to know the IP address of the client connecting to it.  If it gets
forwarded through Server A, the IP address of Server A is what is given.

I tried to make this work without masquerading but I break the port
forwarding.  I've also Googled myself silly.

Any thoughts?

TIA,

Q


