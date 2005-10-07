From: bernin_a@informatik.haw-hamburg.de
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Fri, 7 Oct 2005 22:06:42 GMT
Message-ID: <20051007220642.4C94B3C65565@mailgate.informatik.haw-hamburg.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable
To: Marek Zachara <marek.zachara@conexe.pl>, netfilter@lists.netfilter.org

> On Friday 07 of October 2005 21:44, Marek Zachara wrote:

> As a workaround, is there a way to manually clean up conntrack table - i'=
d put=20
> it in the boot scripts to assure such problems doesn't happen again. I kn=
ow i=20
> can put a iptable rule to block all incoming UDP traffic for 3 minutes af=
ter=20
> boot-up (so the entries get cleaned), but this makes the router useless f=
or=20
> these 3 minutes ...

Do i understand this correctly, the problem why the packets don't get
masqueraded/natted properly is that they already have a conntrack entry
before the nat rules are in place ??

>=20
> Marek
>=20

--arne

_________________________________________________
Versendet =FCber Webmail der HAW Hamburg
http://www.haw-hamburg.de/webmail



