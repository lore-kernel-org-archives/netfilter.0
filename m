From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ipip tunnel connection tracking
Date: Wed, 14 Apr 2004 01:08:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081897718.1731.14.camel@anduril.intranet.cartel-securite.net>
References: <EXCFE04GjcAbeYrvKM9000011ef@smtp.e-kolay.net>
	 <200404112134.40862.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404112134.40862.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Le dim 11/04/2004 =E0 22:34, Antony Stone a =E9crit :
> Why would a connection tracking module need to know about the addreses =
inside=20
> the packets, rather than the addresses in the headers?

And if you want to deal with inner packet, then you just terminate the
tunnel on your firewall and see what's in through
tun0/gre0/whateveryoulike0 interface. And you build another tunnel with
destination and you're done.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

