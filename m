From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: simple questions to finally understand netfilter
Date: 27 Nov 2003 18:49:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069955392.28653.96.camel@kermit>
References: <1069947718.9126.39.camel@webmail.aeropostal.com.ve>
	 <1069949045.28653.85.camel@kermit>
	 <1069949657.9126.55.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069949657.9126.55.camel@webmail.aeropostal.com.ve>
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
To: Juan Hernandez <alucard@kanux.com>
Cc: Lista de netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-11-27 um 17.14 schrieb Juan Hernandez:
> Another question...
>=20
> On Thu, 2003-11-27 at 12:04, Ralf Spenneberg wrote:
> > Am Don, 2003-11-27 um 16.41 schrieb Juan Hernandez:
> >=20
> > > 1) This rule tells netfilter to drop any packet forwarding I guess
> > > iptables -P FORWARD DROP
> > This is a default rule. All packets not accepted or dropped by other
> > rules will be dropped by this one.
>=20
> If this drops everything else, how come there's access to the webserver
> in that same machine?? It's not that I dont want it, its just that im
> curious on what does this rule drops exactly cause I can still access my
> webserver=20
Because the FORWARD chain only covers packets to be forwarded to other
machines. Packets destined to the local machine are filtered in the
INPUT chain. Do a=20
iptables -P INPUT DROP=20
and you webserver should stop responding (if there are no other INPUT
rules).

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

