From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: nat logging
Date: 11 Aug 2003 09:48:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060588106.764.5.camel@elendil.intranet.cartel-securite.net>
References: <5.2.0.9.0.20030811092514.026a82c8@imap4.plugit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030811092514.026a82c8@imap4.plugit.net>
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
To: Simone Sestini <simone.sestini@plugit.net>
Cc: netfilter@lists.netfilter.org

Le lun 11/08/2003 =E0 09:34, Simone Sestini a =E9crit :
> right now i'm able to log the connection using
> iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j LOG
> --log-level debug --log-prefix "POSTRT: "
> iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j SNAT --to
> 111.111.111.111

When you log in nat table, you have to be aware that, for a given
connection, only the first packet (i.e. the one with state NEW) will
cross the table. Further ones will be handled by conntrack directly and
won't go through nat table. This mean you'll only be able to log very
first packet.

If you want more packets, then you'll have to log in filter or mangle
table.

> but on  my nat.log file i can get only
> Aug 11 11:20:53 gw2-709nat kernel: POSTRT: IN=3D OUT=3Deth0 SRC=3D10.50=
.72.6
> DST=3D213.199.150.90 LEN=3D78 TOS=3D0x00 PREC=3D0x00 TTL=3D126 ID=3D453=
0 PROTO=3DUDP
> SPT=3D137 DPT=3D137 LEN=3D58
> Anyone know if it's possible to see what kind of files the client has
> requested too ? i need a debug similar to squid..

Netfilter's LOG target logs packet headers. So you can't determine the
payload contents from reading them. If you want to access packet
payload, then you have to use ULOG target that will send the whole
packet to a userspace tool that will perform the kind of analysis you
need.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

