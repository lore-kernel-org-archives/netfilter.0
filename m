From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPv6 state match in kernel 2.6.15 and iptables 1.3.5
Date: Fri, 12 May 2006 13:54:31 +0200
Message-ID: <1147434871.5002.107.camel@anduril.intranet.cartel-securite.net>
References: <20060511131959.ALLYOURBASEAREBELONGTOUS.B31059@bla.fasel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060511131959.ALLYOURBASEAREBELONGTOUS.B31059@bla.fasel.org>
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
To: Wolfram Schlich <lists@wolfram.schlich.org>
Cc: netfilter@lists.netfilter.org

Le jeudi 11 mai 2006 =E0 15:19 +0200, Wolfram Schlich a =E9crit :
> I was happy to see that kernel 2.6.15 and iptables 1.3.5
> brought state match support for IPv6.
> When giving it a try, it turned out *all* packets were classified
> as being in INVALID state:

It seems you don't have Layer 3 independant connection tracking
(NF_CONNTRACK) and IPv6 conntrack support (NF_CONNTRACK_IPV6) built.

The thing is Linux kernel as the "old style" connection tracking that
only works for IPv4, not for IPv6. That's what you're using now. That's
why you get INVALID state for IPv6 packets.

If you want to have IPv6 conntrack, you have to remove "Connection
tracking" support in "IP Netfilter Configuration section, then go to
Core Netfilter Configuration section and activate "Layer 3 Independent
Connection tracking". Then you will see "IPv6 support for new connection
tracking" option in IPv6 Netfilter Configuration section.

And you're done.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

