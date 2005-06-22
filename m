From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 18:59:02 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org


> Actually, a null scan should be generating INVALID packets, and if one

Does it really? What if there happens to be a null-flags/xmas-flags tcp packet 
in an otherwise well-behaved tcp connection? I'd guess it would match 
ESTABLISHED, even if it has got null flags.

> turns on those detections and rejections within the kernel, as well as
> perhaps adding a rule or two to DROP INVALID packets they should be
> covered, should they not? And thus with far less resource over head as
> extensive rules in their ruleset?

That depends on what you want.

The full fun (shortened here) currently present in AS_IPFW is:

    (base is iptables -P INPUT DROP)
    iptables -A scanchk -j REJECT --reject-with host-unreach -m random \
      --average 20;
    iptables -A INPUT -g scanchk -p tcp ! --syn -m state --state INVALID;
    iptables -A INPUT -j TARPIT -p tcp;
    iptables -A INPUT -j REJECT --reject-with net-unreach -m random \
      --average 10;

Of course you can all DROP that, but I like to actively hinder unwanted
senders, and so, the implementation of this hindering requires REJECT.



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

