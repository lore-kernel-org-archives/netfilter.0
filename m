From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: how to filter applications with iptables
Date: 26 Jun 2003 03:25:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056612314.1893.5.camel@alpha.newkirk.us>
References: <20030626070125.065CEC11A@postfix4-2.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030626070125.065CEC11A@postfix4-2.free.fr>
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
To: Liber =?ISO-8859-1?Q?Chr=E9tien?= <liber.chretien@free.fr>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thu, 2003-06-26 at 04:03, Liber Chr=E9tien wrote:
> Hello,
> I've been looking for some information but couldn't find, so here it goes=
, I'm asking=20
> to the list : (excuse my technical english if I'm not clear enough)
>=20
> I've a LAN at home with mdk as server and win and mdk on the clients
>=20
> My question is : is there a way to block certain applications, such as sp=
ecific=20
> softwares (office suite for example), to access internet with iptables?
>  How to identify the packets emitted from such applications and block the=
m ?
>=20
> Thanks=20
>=20
> Bruno

The only way to accomplish this is blocking by IP and ports.  If there
is a certain type of connection you want to block you can perhaps
accomplish it by port.

If you want to run an iptables firewall and filter out explicitly
traffic from a certain windows application that communicates on
'standard' ports that you otherwise want open, you're out of luck.  That
would be better handled on the Win box itself with something like
ZoneAlarm that lets you grant/deny connection privileges per
application.

j




