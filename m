From: Tom Crane <tom@mklab.ph.rhbnc.ac.uk>
Subject: --limit 1/day problem
Date: Fri, 27 Sep 2002 21:21:34 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209272021.g8RKLYu11395@mklab.ph.rhbnc.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org
Cc: Tom Crane <tom@mklab.ph.rhbnc.ac.uk>

Hello,

I've just installed iptables-1.2.7a and am getting to grips with it. I 
I have the following problem; 

iptables -A INPUT -s 134.219.128.69 -j LOG -m limit --limit 1/day

gives 'iptables: Invalid argument'. Using '2/day' or higher or x/hour
works fine. According to the source '1/day' is the maximum acceptable
value. Is this a know bug or am I overlooking something obvious?

Thanks
Tom.

ps. system details; 
kernel: 2.4.19
Distro: Slackware 7.1
gcc: egcs-2.91.66

-- 
Tom Crane, Dept. Physics, Royal Holloway, University of London, Egham Hill,
Egham, Surrey, TW20 0EX, England. 
Email:  T.Crane@mklab.ph.rhbnc.ac.uk or T.Crane@rhul.ac.uk
SPAN:   19.875
Fax:    +44 (0) 1784 472794

