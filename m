From: Venelin Mihaylov <venelin@fcolor.bg>
Subject: -m owner --uid-owner problems
Date: Fri, 24 Dec 2004 13:08:17 +0200
Message-ID: <1103886497.2491.8.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hello,
 I implemented an firewall, which is very strict (at least this was my
goal :) ) when it comes to permitting output packets. I used --uid-owner
to permit outgoing packets only for the user qmailq (I am using qmail as
a mail server). The thing is that in my firewall logs for the rejected
packets I get too much entries for packets ending a connection - with
ACK,FIN, and eventually PSH flags set. Also, as it seems packets with
only a RST flag set are rejected too.
  This is in the OUTPUT chain, for ports 80,25.

  Any ideas, how I can get rid of this ? As far as I can tell all
connections are carried out successfully, but these entries are flooding
my logs, and would distract from any dangerous happenings ;).

Venelin Mihaylov, CCNA
System Administrator
HostColor LLC


