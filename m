From: Abylai Ospan <aospan@netup.ru>
Subject: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 19:48:57 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096400937.3163.134.camel@alkaloid.netup.ru>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, all !

May be this question in FAQ but I can't find it ;-( I have 3 (or more)
identical rules in one (for example - INPUT) chain.
If I do command:
iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT 

the first rule is deleted only. Is there any command line option to
remove all identical rules in one chain ?

wbr, Abylai


