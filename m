From: halfdog@gmx.at
Subject: User space firewall
Date: Wed, 24 May 2006 19:09:07 +0200
Message-ID: <44749333.5080805@gmx.at>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I want to write a (simple) user space firewall. All packets not acceptable for 
the iptables go to as netlink message (ulog) to the user space. All established 
connections are kept. The user is then to decide, if he accepts the connection.

Use case: Lets assume a Tcp-Syn hits the iptables, gets rejected, captured by my 
software. What should I do to make the connection stable?

* Just push the Syn into the stack again, will this make the connection 
established? If yes, where to put it so that I do not have to care about Nat and 
so on, so it should go rather the same way an accepted packet would have gone.

* Modify the conntrack tables first and then push the syn back?

* Do I have to go an more complicated way?

Thanks for your input,

halfdog





