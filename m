From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: re: ip_conntrack_max vs ip_conntrack
Date: Mon, 27 Sep 2004 13:52:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <561dc32604092710524f3a8b5b@mail.gmail.com>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
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

I'd like to know what some of these proc paremeters mean as well. 
What we're experiencing is a SYN flood attack that's filling up the
connection tables.  What I'd like to do is change the timeout to 5
seconds, instead of the default 30 seconds.
-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.  
                                            If I wanted to do that,
I'd vote." --Duckman

