From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 14:37:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075383457.4039.16.camel@elendil.intranet.cartel-securite.net>
References: <66CE949D18BCB249ABE8D9AF48C4F1CE777AFF@helios.clb.tcfr.thales>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <66CE949D18BCB249ABE8D9AF48C4F1CE777AFF@helios.clb.tcfr.thales>
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
To: Christophe.LINDHEIMER@fr.thalesgroup.com
Cc: netfilter@lists.netfilter.org

Le jeu 29/01/2004 =E0 13:59, Christophe.LINDHEIMER@fr.thalesgroup.com a
=E9crit :
> My computer that is running iptables is 128.0.0.1
> An other computer has @ 128.0.0.2.
> I try to followings commands :
> iptables -t nat -A PREROUTING -i eth0 -j LOG
> iptables -t mangle -A PREROUTING -i eth0 -j LOG
> iptables -A INPUT -i eth0 -j LOG
> if I ping 128.0.0.1 from 128.0.0.2, I see the packets in the syslog.
> if I ping 128.0.0.10 ( for example ) from 128.0.0.2, there is nothing i=
n the
> syslog.
> Is it normal ?

Euh... Well...
I do not have an idea of your general network setup, but I do not see
why (according to the fact that your rules are issued on 128.0.0.1) a
packet from 128.0.0.2 to 128.0.0.10 should get logged by 128.0.0.1...

> I thought that I was going to see all the packets in the NAT and not on=
ly
> the packets with the right IP @.

All the packets _received_ by the box.

> Missing something ???

If I'm right, you're missing the fact that packets from 128.0.0.2 to
128.0.0.10 are not seen by 128.0.0.1, so cannot get logged there.

But, again, you should explain your LAN setup for us to be sure we
discuss the same situation.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

