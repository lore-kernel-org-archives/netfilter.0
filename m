From: Jean Hoderd <jhoderd@yahoo.com>
Subject: Re: Accounting for national/international traffic
Date: Wed, 22 Dec 2004 00:24:41 -0800 (PST)
Message-ID: <20041222082441.57205.qmail@web42101.mail.yahoo.com>
References: <20041221085518.92203.qmail@web42105.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041221085518.92203.qmail@web42105.mail.yahoo.com>
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

And thanks to both people who have answered my question! Accounting for
national/international traffic using the "ipt_account" module seems
quite straightforward now. However, since the list of national IP
ranges is quite long, it might introduce a serious performance penalty.
In that respect, the "dscp" module seems to be a better option -- if
supported by my ISP. (It also has the advantage that the classification
is always up-to-date with the list of national IP ranges).

Anyway, looking at the long list of IP ranges, it occurred to me that
this is essentially a decision tree problem, which could be optimised
using known algorithms.  My googling has returned empty-handed, so my
question is: does someone know of any project which aims at optimising
iptables rules based on decision trees?  If not, I would gladly take a
look at the problem when I find some time.

Cheers,
Jean



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - now with 250MB free storage. Learn more.
http://info.mail.yahoo.com/mail_250

