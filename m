From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: iptables question
Date: 14 Aug 2003 12:23:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060856625.1717.87.camel@kermit>
References: <1060807798.4082.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060807798.4082.8.camel@localhost.localdomain>
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
To: ghancock@softeksoftware.com
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-13 um 22.49 schrieb Glenn Hancock:
> I have my rules setup the way I would guess they should be based on 5
> tutorials, 1 book and the man pages.  However, I still can't seem to
> get the thing to do what I want.  Could someone please help me?
>=20
> I will make this very simple:
Is this for a local machine?
> 1)  I want to allow all incoming requests to port 80
# Allow new connections to port 80
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
> 2) I want to allow all outgoing requests .... period.
# Allow outgoing connections
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
# Allow all packets belonging to established connections come back
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
>=20
>=20
> I want to drop all other incoming requests not addressed to port 80.
iptables -P INPUT DROP
iptables -P OUTPUT DROP

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org


