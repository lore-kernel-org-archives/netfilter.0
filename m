From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: port redirect for local host
Date: 03 Sep 2003 12:54:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062586455.18242.3.camel@kermit>
References: <Pine.LNX.4.33.0309012154390.24379-100000@pandora.is.bizsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0309012154390.24379-100000@pandora.is.bizsystems.com>
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
To: Michael Robinton <michael@insulin-pumpers.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-09-02 um 07.00 schrieb Michael Robinton:
> I have a relatively simple redirect that does not seem to work for the
> local host. I'm running a DNSBL on a virtual IP address on a host that
> already has a DNS daemon running.
>=20
> entry is...
>=20
> $IPTABLES -t nat -A PREROUTING -p tcp -d $DNSBL_IP --dport 53 -j REDIRECT
> --to-port $DNSBL_PORT
>=20
> this works fine from both the network (internet) and from the interfaces
> on the private side. eth1, eth0
>=20
> I does not work at all from the local host and no amount of tweaking of
> the rule set seems to help.
locally generated packets do not traverse the PREROUTING but the OUTPUT
chain.=20

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

