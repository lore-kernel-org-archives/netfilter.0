From: Romp <romp@siil.net>
Subject: iplimit bug?
Date: Thu, 3 Oct 2002 15:48:03 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0210031531100.4186-100000@nuhkija.sise>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'am using the iplimit module (from latest patch-o-matic) with 2.4.20pre8.
The only iptables rule is:

iptables -A INPUT -p tcp --syn --dport 21 -m iplimit --iplimit-above 1 -j REJECT

everything seems to work fine - the 2nd connection is rejected, but some
hosts are still logged into my ftp server with more than one session!?!

I changed the rule:

iptables -A INPUT -p tcp --syn --dport 21 -m iplimit --iplimit-above 1 -j DROP

and no any limits any more - the first syn packet is silently dropped, but
the retransmitted packet is accepted!  Propably the first rule works the
same way - if client ignores the rejecting packet (or it is dropped by
network) he/she can bybass the limit.

Any ideas to fix it?

romp


