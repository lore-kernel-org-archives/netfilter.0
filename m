From: Chris Green <cmg@dok.org>
Subject: Re: Traffic accounting over ULOG inefficient?
Date: Thu, 10 Jun 2004 14:25:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m2u0xjgthu.fsf@catbert.dok.org>
References: <200406102005.20214.arny@ats.s.bawue.de>
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
To: netfilter@lists.netfilter.org

Thilo Schulz <arny@ats.s.bawue.de> writes:

>
> I am still inexperienced with kernel programming, I would be
> grateful for any pointers or hints on how to achieve this "real time
> traffic tracking" without either having to read out any iptable
> counters every 10 minutes or queue entire packets to userspace.
> Would a small kernel module do the trick?

There is a patch in patch-o-matic for ctnetlink that implements a
different type of interface to get these counters from connection
tracking but I can't seem to find out any information on it aside
from questions about it go unanswered.  
-- 
Chris Green <cmg@dok.org>
"Yeah, but you're taking the universe out of context."


