From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSet Log and drop.
Date: Thu, 21 Apr 2005 20:15:33 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504211951320.27455@blackhole.kfki.hu>
References: <4267E1BE.9010303@kitchenandassociates.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4267E1BE.9010303@kitchenandassociates.com>
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
To: Rob Carlson <rcarlson@kitchenandassociates.com>
Cc: netfilter@lists.netfilter.org

On Thu, 21 Apr 2005, Rob Carlson wrote:

> I'm currently using ipset to block some large
> blocks of addresses.  It seems to be working well,
> but a couple of rogue emails have gotten through.

E-mails? You are fully aware that E-mail headers are trivial to forge,
aren't you. Have you checked the sender machines in the Received lines?

> I've found that with vanilla IPTables, to log and
> block one sets up two rules, first the LOG
> statement, then immediately following, the DROP
> statement.  However since I am using a nethash in
> IPSet, I wonder if this approach would work, or
> whether scanning the hash twice to invoke each
> operation would be counter to the reason for using
> the IPset nethash.

ipset set types are really fast. It's hard to say, which is faster:
the rules

> iptables -A testhash -m set --set testhash src -j LOG
> iptables -A testhash -m set --set testhash src -j DROP

or

iptables -N logdrop
iptables -A logdrop -j LOG
iptables -A logdrop -j DROP
iptables -A testhash -m set --set testhash src -j logdrop

In the first case there is an additional set lookup, in the second case
there are four [six]) additional "wildcard" builtin matches (src, dst,
inface, outface, [proto, frag]) and one jump.

Probably the latter one is a teeny bit faster with a few cycles: hash key
computations are just more expensive operations than simple matches.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

