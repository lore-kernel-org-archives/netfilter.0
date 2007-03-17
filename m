From: Arnd-Hendrik Mathias <arnd-hendrik.mathias@nefkom.net>
Subject: Rule Optimization for iptables
Date: Sat, 17 Mar 2007 18:10:19 +0100
Message-ID: <45FC20FB.9060406@nefkom.net>
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

Hi everyone,
can anybody tell me, if there is a possibility to make iptables optimize 
its rulesets automatically? The situation is as follows: I use my 
"workstation" (Celeron 233MHz/128MB RAM) as gateway for two local 
networks to WAN. I keep my rulesets for different protocols and 
different scenarios well sorted in separate sections of multiple files. 
This looks like:

# Forward outgoing tcp-ftp connections from lan0 to wan
...ruleset...

# Forward outgoing tcp-ftp connections from lan1 to wan
...ruleset...

....a.s.o.

As a following of this I have some rules somewhat redundant and others 
could be combined to one with the similar effect.
I could easily reduce the number of rules to be checked (hoping to 
reduce the processing time/RAM usage of iptables) manually by combining 
many rules but this would make my rulesets less maintainable. Currently 
it's quite easy to spontaneously block for example outgoing https 
sessions from lan1 by simply commenting out the corresponding few rules 
without side effects to other protocols. So a means to optimize the 
ruleset already loaded could be quite helpful for easy administration.
Has anyone heard of such stuff?
Best regards

Arnd-Hendrik

