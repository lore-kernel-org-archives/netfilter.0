From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Group on Iptables
Date: 31 Aug 2003 12:50:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062327009.1607.17.camel@kermit>
References: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
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
To: "Masiero Giorgio, PD" <gmasiero@cerved.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-27 um 16.44 schrieb Masiero Giorgio, PD:
> Hy my name is Giorgio,
> 	I'm tryng to translate our Checkpoint FW-1 ruleset into Iptables.
> 	I do not know iptables well so I really need a suggestion to plan my fut=
ure efforts.
> 	The problem is this:
> 	Is it possible to use objects like Checkpoint Groups (that is a set of h=
ost and/or networks) into an Iptables rule.
>=20
> 	It seems to me that iptables accept souce/destination that are only one =
host/network.
>=20
You can use the ippool feature to match several hosts using one rule.
ippool is in patch-o-matic. Go the the netfilter homepage and read up on
applying patch-o-matic and ippool.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

