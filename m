From: Andreas Gaupmann <andreas.gaupmann@gmx.net>
Subject: Schedule while atomic
Date: Sat, 6 May 2006 13:56:34 +0200
Message-ID: <200605061356.35270.andreas.gaupmann@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I have registered a callback function in a kernel module with the Netfilter 
hook NF_IP_LOCAL_IN. In the function the following statements lead to a 
kernel freeze:

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(HZ);

Another try (with the same result) for letting the hook function sleep for a 
certain amount of time:

while (time_before(jiffies,jiffies+HZ));

The error message for the kernel oops is "scheduling while atomic" for both 
attempts.

Why is this error ocurring? Are the Netfilter hooks atomic?
How can a sleep in a hook function be achieved?

Regards,
Andreas Gaupmann

