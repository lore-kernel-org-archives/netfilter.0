From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: idea for iptables
Date: Tue, 9 Nov 2004 14:26:21 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0411091421190.25655@blackhole.kfki.hu>
References: <20041108213819.GE4384@taz.net.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041108213819.GE4384@taz.net.au>
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
To: Craig Sanders <cas@taz.net.au>
Cc: netfilter@lists.netfilter.org

On Tue, 9 Nov 2004, Craig Sanders wrote:

> it would be useful when Appending or Inserting a rule into a chain, to be able
> to specify an expiry time for that rule, so that it was automatically deleted
> after N seconds, e.g. "--rule_expire 3600" for 1 hour, or "--rule_expire 86400"
> for 1 day.
>
> that would be very handy for writing log-watcher scripts (see below for
> example) without having to worry about cleaning up old rules - just Insert the
> rule with the desired expiry time and forget about it.

ipset would be more appropriate for the given task:

- single, static iptables rule:

	/sbin/iptables -I INPUT -m set --set spammers src -j DROP

- dynamically maintained 'spammers' set

Unfortunately the new ipset package is still not ready yet :-((

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

