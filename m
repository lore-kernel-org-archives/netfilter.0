From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: port forwarding through localhost
Date: Sat, 27 Jan 2007 00:09:02 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701270008040.22295@yvahk01.tjqt.qr>
References: <000001c74194$d484d9b0$0d01a8c0@Mobi>
	<45BA7E51.40505@plouf.fr.eu.org><000301c74199$7db871f0$0d01a8c0@Mobi>
	<45BA85AF.5010907@plouf.fr.eu.org>
	<000001c7419d$0bab38f0$0d01a8c0@Mobi>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c7419d$0bab38f0$0d01a8c0@Mobi>
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
To: "Andy B." <globi@hot.lu>
Cc: netfilter@lists.netfilter.org


>I am using 2.6.19.2.
>
>An intermediate tcp proxy method doesn't sound so nice, since iptables is
>way more flexible to me :-/

In fact, using such a proxy doubles the amount of packets transferred.

What you should have better done: use DNS instead of fixed IP addresses. That
way you could have had

  mysql IN A 127.0.0.1

before, and now change it noproblem to

  mysql IN A 192.168.123.45

But you have not, so better deal with it ;-)

	-`J'
-- 

