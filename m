From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ip_conntrack vs netstat
Date: 02 Sep 2003 22:19:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062533985.6144.18.camel@kermit>
References: <Pine.LNX.4.53.0308301423020.30825@apollo.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0308301423020.30825@apollo.rsn.bth.se>
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
To: Jonas Lindborg <jools@apollo.nu>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-08-30 um 14.37 schrieb Jonas Lindborg:
> Hello,
>=20
> When comparing the output of /proc/net/ip_conntrack with the "netstat"
> command, I'm seeing a few established connections in ip_conntrack that ar=
e
> not presented by netstat.
>=20
> These are familiar connections (ssh, imap) to known hosts that could very
> well have been done by me but not in the last 24 hrs so they should have
> timed out a long time ago.
It takes five days for an established TCP connection to time out in the
conntrack table.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

