From: mailinglists@belfin.ch
Subject: AW: default policy
Date: Fri, 1 Nov 2002 17:48:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B2401@mx.snizek.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Rob' <rwideman@austin.rr.com>, Netfilter <netfilter@lists.netfilter.org>


Hi

> I have been looking at several scripts checking the default 
> policies on
> them.
> Some include items that others don't.  Oscars tutorial 
> doesn't cover all of
> these compared to Ziegler's book.  I have been wondering if 
> the following
> covers ALL built-in chains?
> iptables -P INPUT   DROP
> iptables -P OUTPUT  DROP
> iptables -P FORWARD DROP

These will do the job (in most cases). 
iptables -P INPUT DROP will stop everything trying to hit your bastion host.
iptables -P OUTPUT DROP will stop everything leaving your bastion host.
iptables -P FORWARD DROP will stop everything trying to get through your
bastion host.
These policies cover all network adatpers in your system.

> Ziegler's book states that it should be this (it was never 
> put in these
> words but this is what I am gathering from my reading):
> iptables -t nat    -P PREROUTING  DROP
> iptables -t nat    -P OUTPUT      DROP
> iptables -t nat    -P POSTROUTING DROP
> iptables -t mangle -P PREROUTING  DROP
> iptables -t mangle -P OUTPUT      DROP
> iptables -t filter -P INPUT       DROP
> iptables -t filter -P OUTPUT      DROP
> iptables -t filter -P FORWARD     DROP

Of course you can do that. But this is multiple pleonasm. I.e. if you drop
PREROUTING you don't have to drop INPUT anymore. If your DROP Policy covers
every built-in chain you must write a rule for every DROPed chain to allow a
certain action. Your filter becomes unclear and thus, hard to read and hard
to manage.  

> The last seems to be the most thorough but i cant find 
> anywhere that covers
> this in detail.
> Are these all of the built-in chains?

Yes.
 
HTH
Philipp

