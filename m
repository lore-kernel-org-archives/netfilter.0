From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Why doesn't MASQUERADE handle local packets?
Date: Thu, 18 May 2006 14:14:33 -0700
Message-ID: <BAY106-F5B1C306A466F2FD42A55ED6A60@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Good day,

In attempting to use the MASQUERADE target for some traffic that is locally 
generated (as opposed to forwarded traffic) I found that the source IP 
address was not being changed even though the rule was clearly being used.

A quick review of ipt_MASQUERADE.c turned up these lines at the beginning of 
function masquerade_target():

	/* FIXME: For the moment, don't do local packets, breaks
	   testsuite for 2.3.49 --RR */
	if ((*pskb)->sk)
		return NF_ACCEPT;

If I comment out the return statement, MASQUERADE of locally generated 
packets seems to work without any problems.

My question are:

1) Why doesn't MASQUERADE handle local packets?
2) What would the damage be if I patched the source to comment out that 
return statement?  If it is simply a matter of causing an old test suite to 
fail then that seems harmless enough to me but is there more to this story?

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


