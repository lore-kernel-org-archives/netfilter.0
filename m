From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: a doubt about INPUT rule
Date: 14 Aug 2003 23:28:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060896514.1717.147.camel@kermit>
References: <20030814064610.GA1701@linux.local>
	 <1060759344.1711.13.camel@kermit>  <20030815164629.GA2245@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030815164629.GA2245@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-08-15 um 18.46 schrieb Payal Rathod:
> On Wed, Aug 13, 2003 at 09:22:25AM +0200, Ralf Spenneberg wrote:
> > --dport requires the definition of a protocol beforehand. It is only
> > defined when the protocol is either udp or tcp. Omitting the protocol o=
r
> > using all does not work because icmp, esp, ah, etc. do not have a port.
>=20
> Ok. Got it now. Thanks a lot Ralf for the excellent mails so far.
>=20
> > Book: Intrusion Detection f?r Linux Server   http://www.spenneberg.com
>=20
> Why is this ? in "f?r Linux Server"
It is the german word fuer. ue is a german umlaut. One character spelled
=DC.
This is a german book I wrote last year. You will find several chapters
online. But they are german because so far I have not found an
english/american publisher willing to publish it.


Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

