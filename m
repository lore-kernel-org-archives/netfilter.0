From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: unexpected behaviour...?
Date: 02 Sep 2003 22:26:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062534369.6144.24.camel@kermit>
References: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Christof Nyffenegger <cnyf@yahoo.de>
Cc: Jim Carter <jimc@math.ucla.edu>, Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-08-28 um 13.33 schrieb Christof Nyffenegger:
>  --- Jim Carter <jimc@math.ucla.edu> schrieb:
> > Hmmm, good point.  However, I think a packet is considered to be part o=
f an
> > established connection because it has particular header bits set, not
> > because of IP address matching in the conntrack tables.  Someone who's =
more
> > familiar with the sources, could you please confirm or correct this
> > statement?
No bits in the header. It is simply matching the IP addresses, protocol
and ports. If you add the TCP-Window-Tracking patch it does more.
At the moment TCP is handled just like  UDP, ICMP, and generic
protocols.

If the client behind the firewall sends an ACK the connection is
automatically picked up by iptables.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

