From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Counting elements of an ipset
Date: Fri, 10 Mar 2006 21:52:28 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603102146160.7496@blackhole.kfki.hu>
References: <slrne13jtk.cv0.micah@pond.riseup.net>
	<Pine.LNX.4.58.0603102130180.7349@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0603102130180.7349@blackhole.kfki.hu>
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
To: Micah Anderson <micah@riseup.net>
Cc: netfilter@lists.netfilter.org

On Fri, 10 Mar 2006, Jozsef Kadlecsik wrote:

> However, you can use ULOG as a target and log the packets by it. Feeding
> mySQL/Postgres by ulogd is easy and then you can create such accounting
> info as you wish.

Oops, I believe I'm lying here - as far as I know currently you cannot
*trigger* to log the connection packet and byte counters when a conntrack
entry is destroyed. If that piece would be there then in some way we would
produce better data that netflow.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

