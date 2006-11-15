From: Mahmoud Aghapour <maabox@yahoo.com>
Subject: NAPT with loab balance does not work with iptables 1.2.11, RHEL 3
Date: Wed, 15 Nov 2006 06:23:06 -0800 (PST)
Message-ID: <729782.32953.qm@web55015.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Dear All

I want to use iptables to translate incoming
destination port 500 to
10000-10009 with (round robin or any other method)
load balancing.
I used the following command in RHEL 3 with iptables
2.11:
 
       Iptables -A PREROUTING -p tcp --dport 500 -j
DNAT --to :10000-10009

But always port 10000 are used for translation and
other ports never used.
 
Please help
Thanks in advance,
MAA



 
____________________________________________________________________________________
Sponsored Link

$420k for $1,399/mo. 
Think You Pay Too Much For Your Mortgage? 
Find Out! www.LowerMyBills.com/lre

