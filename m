From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Matching 10000's of IP ranges
Date: Mon, 3 Jan 2005 09:07:46 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0501030902270.17874@blackhole.kfki.hu>
References: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
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
To: Brian Gunlogson <bmg300@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2 Jan 2005, Brian Gunlogson wrote:

> What is a reasonable way to match around 80000 IP ranges with iptables?

If those are truly IP ranges, then there's no easy way - maybe nf-hipac
can help you.

If the ranges are really CIDR blocks, then ipset can help you: for
same-sized CIDR blocks, you can use it immediately and can collapse the
matching against to the 80000 CIDR blocks practically into a single match.

If you have got different sized CIDR blocks, then a new maptype of
ipset could be written to support it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

