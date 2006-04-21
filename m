From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: Re: iptables is complaining with bogus unknown error
 18446744073709551615
Date: Fri, 21 Apr 2006 10:22:27 -0400
Message-ID: <a06230913c06e96f75f32@[129.98.90.227]>
References: <a06230910c06e2510acfa@[129.98.90.227]>
	<20060421111530.GE5286@rama>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060421111530.GE5286@rama>
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
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

Thank you for your reply.

>Hi Maurice.
>
>Didn't you report this bug already to bugzilla.netfilter.org (and maybe
>eben to the bugme.osdl.org)?  Reporting a bug in three distinct places,
>even though it has been replied to at one place is not really going to
>use developer resources efficiently, don't you think?

Sorry, to post it multiple times. Actually, two places netfilter and 
then kernel bugzilla. I made the second report after it appeared 
there'd would be no feedback to the first one and another kernel 
revision had been issued with the problem still evident. (The first 
feedback on the netfilter report crossed in the mail with the kernel 
report.)

>However, your problem seems to be something different.  I suspect that
>all rules with '-p tcp' or '-p udp' don't work, whereas others do.  You
>seem to be missing the xt_tcpudp.ko module, which implements that
>feature in 2.6.17-rcX kernels.

Yep, that's it. How could one know that there is such a module called 
xt_tcpudp.ko, especially since there is no corresponding config 
option? Wouldn't up-to-date and complete documentation explain how to 
set up the kernel config and indicate which modules should be loaded?

On the other hand, shouldn't this module be loading automatically?
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

