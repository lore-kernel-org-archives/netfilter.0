From: christopher.f.ulherr@exgate.tek.com
Subject: logging of successful tcp connections
Date: Thu, 21 Apr 2005 09:38:37 -0700
Message-ID: <F97948CF897D7B46802A18845A8B9BFD471A31@us-rich-m01.global.tektronix.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I would like to know if there is a way I can log only successful tcp
connections. I'm only interested in successful (established)
connections, and not just syn "connection attempts". I guess what I need
is a way to log a single packet if it caused a state transition from NEW
to ESTABLISHED. It would also be helpful to log the packet that
terminated the connection (state change from established). In this
manner, we could easily tell what connections were made, and their
duration (and not rely on the userland application to log this info).

I've looked into using the state matching, but couldn't achieve this
specific functionality with that.


Is there some trivial way to accomplish this I am overlooking?


Thanks,
Chris

