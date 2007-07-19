From: aragonx@dcsnow.com
Subject: Please help redirecting locally generated traffic
Date: Thu, 19 Jul 2007 18:45:23 -0400 (EDT)
Message-ID: <18563.192.35.79.70.1184885123.squirrel@www.dcsnow.com>
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

I have a situation where an application on my box wants to talk to the
wrong IP address.  The developers will gladly fix the bug in the next
version but I need a quicker fix.

Here is the situation.  I have traffic that is going to 10.0.0.1 and needs
to got to 198.162.0.1.  It's created on the machine that I need to do the
routing on.  It's a Linux machine using iptables 1.2.9.  Neither SNAT or
DNAT seem to work.  DNAT wants to work on the incomming packets but does
what I need.  SNAT will work on the outgoing packets but doesn't do what I
need.  Mangle seems to only want to send packets to my 127.0.0.1.

Any help would be appreciated.

Will


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


