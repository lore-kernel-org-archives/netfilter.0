From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NAT, ICMP and MTU issues
Date: Fri, 19 Sep 2003 18:19:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063988356.5012.69.camel@elendil.intranet.cartel-securite.net>
References: <1063986116.28941.41.camel@angua.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063986116.28941.41.camel@angua.localnet>
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
To: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Cc: netfilter@lists.netfilter.org

Le ven 19/09/2003 =E0 17:41, Nigel Metheringham a =E9crit :
> What appears to be happening is that everything works while packets are
> short, however when long packets come in they bounce off the lower MTU
> interface, and the returned ICMP packet is not getting back to the
> originator in a sane form.   So the connection freezes.
> Having looked closer at this I find there is an ICMP dest unreach packe=
t
> emitted from my box back to the originator.  However inside the packet
> the SNAT has been undone, but the DNAT is still in place.


Just a 0.02e quick thought...
You're facing a situation a bit like routing LANs through a PPPoE link.
Solution is to clamp TCPMSS down to correct value when routing them.

iptables -t mangle -A FORWARD -p tcp --syn -j TCPMSS --clamp-mss-to-pmtu

This sets TCPMSS to MTU-40, so 1410 for your IPSEC link.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

