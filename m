From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Not NATed packets
Date: Sun, 23 Apr 2006 22:35:13 +0200
Message-ID: <e2goe1$f34$1@sea.gmane.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

lukas@tank.eu.org wrote:
> I have strange problem with NAT.
Me too.

> I have kernel 2.6.14.7-5 and iptables-1.3.3-6@2.6.14.7_5 and I use nat
Tested with 2.6.11 and 2.6.16.4.

> NAT configuration is simple but some packets are not NATed - on my
> public interface packets with source address of my internal (NATed)
> network appears and i have no clue what is wrong.
I have very simple rules too. nat/PREROUTING is empty and
nat/POSTROUTING contains only one rule with MASQUARADE target on
interface with public IP (Policies are ACCEPT). I don't use ROUTE target
anywhere.

> 16:30:39.015880 IP (tos 0x0, ttl 127, id 28594, offset 0, flags [DF],
> proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F,
> cksum 0x1623 (correct), 3885889894:3885889894(0) ack 3151418643 win 65535
Exactly. I can see only FIN packets which are not translated. After
looking into conntrack table, I think MASQ ignores FIN packets that are
missing in conntrack table (Is it INVALID or NEW state?).

Very strange behaviour have counters too. These strange packets are not
loggable after MASQ rule. It seems like a bug.

- -- Petr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFES+UBuR4f4nEwzHIRArlUAKCQ9d9+f8bpcsboqoJOih6zndijEACfWOcV
E/15jUu11M4BE0mfuZztTtk=
=h4uY
-----END PGP SIGNATURE-----


