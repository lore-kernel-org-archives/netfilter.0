From: Richard Palmer <richard.palmer@gmail.com>
Subject: Death in Userspace
Date: Thu, 17 Feb 2005 12:47:03 +1100
Message-ID: <100c0ba705021617471b585003@mail.gmail.com>
Reply-To: Richard Palmer <richard.palmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

  I have a application that is handling packets received from iptables
via the QUEUE target. The user space programme does it's stuff, then
accepts the packets. All is working fine, however in the event of a
error (the user space programme dies for some reason), is there any
way of telling iptables to no longer try to pass packets onto the
QUEUE target ?, i.e. some sort of libipq flag to automatically accept
all packets if it thinks the peer has died. Currently the only options
I can think of are a signal handler that manipulate the iptables rules
(not good), or a wrapper script around the user space programme to
monitor it and remove the rule if it dies. Any other options ?

This is with a 2.4 kernel btw.

Thanks,

Richard.

