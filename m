From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: QoS with netfilter (nfcan: addressed to exclusive sender for
	this address)
Date: Sun, 11 Dec 2005 11:13:12 +0100
Message-ID: <1134295992.15307.3.camel@anduril.intranet.cartel-securite.net>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<20051210150841.GI21804@salty>
	<bab495710512110140p7b2d449cm6019f8e326b697a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bab495710512110140p7b2d449cm6019f8e326b697a@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Erik <erikev@gmail.com>
Cc: nfcan.x.jimlaur@dfgh.net, netfilter@lists.netfilter.org

Le dimanche 11 d=E9cembre 2005 =E0 01:40 -0800, Erik a =E9crit :
> 2) (Sidebar) How can TOS be set? I see many packets with TOS
> set,(according to ipfilter -L, wire is still 0x00) but grep'ing the
> 'man iptables' gives no hits on TOS

iptables -j TOS --help

BTW, I know it may not be very useful for you, but:

	iptables -t mangle -A OUTPUT -j DSCP --set-dscp 0x20

Has my DSCP field modified to 0x20 for packets sniffed on output. Same
for TOS target.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

