From: Jean Hoderd <jhoderd@yahoo.com>
Subject: Accounting for national/international traffic
Date: Tue, 21 Dec 2004 00:55:18 -0800 (PST)
Message-ID: <20041221085518.92203.qmail@web42105.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

Here's the situation: in many countries it is customary for IPS's to
have separate quotas for national/international traffic (in my case the
limits are 20GB/2GB per month).

Now, given an IP address, knowing whether it is national or
international is a solved problem: there are publicly available lists
with the ranges of national IP addresses.

The problem: how to keep track of the monthly internet usage divided
into national/international traffic.

Please note that I am not interested in enforcing quotas per se (the
"quota" module, I believe).  Rather, I would simply like to know what
is the total traffic per category since the beginning of the month.

I have searched netfilter's repository, and it seems that the
ipt_account module might do the trick.  However, since I am still a
newbie with netfilter, I am having some trouble defining the actual
rules to make it work.  Let us imagine, for instance, that I have n
ranges of national IP addresses.  Adding them to a "national" counter
seems easy:

iptables -A INPUT -m account --addr "range1" --aname national
iptables -A INPUT -m account --addr "range2" --aname national
...
iptables -A INPUT -m account --addr "rangen" --aname national

The question is: how do I implement the logic for all non-matching
ranges, which should be added to an "international" counter?
Furthermore, I have already plenty of rules in my firewall, and I wish
that the traffic accounting would not interfere with them.

Thanks in advance for any help you can give me!
Regards,
Jean




		
__________________________________ 
Do you Yahoo!? 
Send a seasonal email greeting and help others. Do good. 
http://celebrity.mail.yahoo.com

