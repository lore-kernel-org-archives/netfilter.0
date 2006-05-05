From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables empty ipset matches on address of 0.0.0.0?
Date: Fri, 5 May 2006 11:48:52 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0605051141430.725@blackhole.kfki.hu>
References: <BAY106-F1F8468438D28D95E7FFD6D6B50@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F1F8468438D28D95E7FFD6D6B50@phx.gbl>
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
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 4 May 2006, Andrew Kraslavsky wrote:

> My question is regarding the iptables ipset match (-m set ...).  What I am
> seeing is that an empty ipset set of type iphash (I have not tried this with
> any other ipset type) seems to yield a match on packets with an IP address
> of 0.0.0.0.  The packets of concern here are DHCP client requests, for which
> a source IP of 0.0.0.0 is expected.
>
> With any rule, like the LOG target example below, that uses an empty ipset
> to match against source address, I see a match but, since the ipset set is
> empty, this seems odd.
>
> iptables -A INPUT -m set --set emptyset src -j LOG --log-prefix "What the!?"
>
> Is this how the match is supposed to work?  Even though 0.0.0.0 may be
> equivalent to "any", if the set is empty it seems like a match should _not_
> occur.

Default all sets are zero-filled - thus 0.0.0.0 always matches.
I think it's more a bug than a peculiar feature as it's non-intuitive.
Expect a fixed ipset release in a few days.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

