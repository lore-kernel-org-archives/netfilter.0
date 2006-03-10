From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Counting elements of an ipset
Date: Fri, 10 Mar 2006 21:34:32 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603102130180.7349@blackhole.kfki.hu>
References: <slrne13jtk.cv0.micah@pond.riseup.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrne13jtk.cv0.micah@pond.riseup.net>
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

Hi,

On Fri, 10 Mar 2006, Micah Anderson wrote:

> I'm using ipsets and it appears as if ipsets do not have counters for
> packet matching, you can only count packets that match an entire set.

That's true.

> Is there a way I can get iptables to tell me the packets of a particular
> IP in an ipset?

No, it is not possible. Accounting was not part of the design.

> I can create an ipmap ipset for each individual IP that I want to
> count, and then count each of those set's packet counts, but do I gain
> anything by doing this (ie. does using ipsets save me any memory or
> CPU in this scenario?)

No, you waste memory and CPU cycles.

However, you can use ULOG as a target and log the packets by it. Feeding
mySQL/Postgres by ulogd is easy and then you can create such accounting
info as you wish.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

