From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ftp connection tracking
Date: 31 Aug 2003 12:48:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062326882.1607.15.camel@kermit>
References: <00eb01c36cc1$b29fa240$020b0b0b@home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00eb01c36cc1$b29fa240$020b0b0b@home>
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
To: David Luyens <david.luyens@skynet.be>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-27 um 19.36 schrieb David Luyens:
> Hi,=20
> =20
> When a change the portnumber of my ftp deamon, the connection tracking
> of netfilter does not work anymore.
> Is it possible to say to netfilter to look at a different port (than
> 21) for ftp connections?
Yes, see:
# modinfo ip_conntrack_ftp
filename:  =20
/lib/modules/2.4.20-20.9/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
description: <none>
author:      <none>
license:     "GPL"
parm:        ports int array (min =3D 1, max =3D 8)
parm:        loose int

You can define the ports when loading the ip_conntrack_ftp module.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

