From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip forwarding: client has stalling problems
Date: Fri, 20 Jan 2006 18:41:24 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0601201840060.12328@blackhole.kfki.hu>
References: <200601201516.13638.saintiss@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601201516.13638.saintiss@gmx.net>
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
To: SainTiss <saintiss@gmx.net>
Cc: netfilter@lists.netfilter.org

On Fri, 20 Jan 2006, SainTiss wrote:

> I just set up IP forwarding on a 2.6.12 debian system (server) and a 2.6.12
> ubuntu client. I used this script:

Either upgrade to a more recent kernel in the 2.6.x series or disable TCP
window tracking by

# echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

