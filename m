From: Will Kuhn <willkuhn76@yahoo.com>
Subject: question about the order of the rules of iptables
Date: Thu, 8 Sep 2005 05:01:14 -0700 (PDT)
Message-ID: <20050908120114.76595.qmail@web60421.mail.yahoo.com>
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


Will the order of the following two rules make any
difference in the outcome ? I personally feel that it
should not. Can anyone confirm ?

My intention is to have the incoming mails first
checked by the local anti-spam process listening at
port 1025 before being forwarded to the local mail
server. 10.1.1.100 is a private ip address of the
local mail server.

Local Mail server ----- [eth0] LinuxBOX [eth1] ----
internet

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport
25 -j DNAT --to 10.1.1.100

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport
25 -j REDIRECT --to-port 1025

-Will

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

