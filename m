From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ip_contrackt message
Date: 31 Aug 2003 12:46:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062326762.1607.13.camel@kermit>
References: <3F4D1828.8070605@nas.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4D1828.8070605@nas.at>
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
To: ea@nas.at
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-27 um 22.44 schrieb Erwin Ambrosch:
> Hi all,
>=20
> I'm using iptables-1.2.5-3 and got the following messages in my logfile.
> Please can one say me what exactly does this mean.
Apparently your ip_conntrack table is full. This table has a maximum
size:
/proc/net/ipv4/ip_conntrack_max
You can set it using=20
echo X > /proc/net/ipv4/ip_conntrack_max
Replace X with a number.

Read up on conntrack_max and remember to set the hashsize for
performance issues.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

