From: =?iso-8859-2?B?SvpsaXVzIEJlbbk=?= <julius.bems@gmail.com>
Subject: adding rules - slow
Date: Fri, 27 Jul 2007 23:30:11 +0200
Message-ID: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:content-language:message-id;
	b=rJAtxGqOO6capMjWp5RvQB7hY8Zwu74i5HYuIImUfvzfTf0lVahvzApgrcmLkBjkShXNSMILg3Lvnlcmm3KkFKUfgOy5qhfBd5TOX8NkY9B4GBmGRgA4evaL/YPZRuDZcNDLSIa9GUzGYjXXK4hpJ6lRhAF6VwGLhnxIaGwfNMM=
Content-Language: sk
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

Hi,

When I need to add som rules (in my case 100) to some chain it takes various
time, depending on the number of existing rules in the chain. So when I add
100 rules to empty chain, it takes 1.8sec. If tehere is 1000 rules int the
chain, it takes 4.5sec and if there is 10000 rules it takes 21sec. 

My problem is, that i need to add this rules to chain which contains 20000
rules in short time. I think, that the way of adding rules into chain is
very innefective. 

Could someone tell me how the adding works internally? What data structures
are used? Because I need solve this and find the way how to add new rules
quickly.

Thanks for replies


