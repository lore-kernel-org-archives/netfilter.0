From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: new tcp connections, without SYN
Date: Wed, 9 Apr 2003 14:31:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091431.22200.mklingens@ism.nl>
References: <200304091216.28528.carlosble@terra.es> <1049887993.22720.3.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049887993.22720.3.camel@elendil.intranet.cartel-securite.net>
Content-Disposition: inline
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

On Wednesday 09 April 2003 13:33, Cedric Blancher wrote:
> Le mer 09/04/2003 =E0 13:16, Carlos Ble a =E9crit :
> > Hi all. Two days ago, i added the policy that drops all new tcp
> > connections
> > that starts without SYN to prevent port scaners and other attacks:
> > iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
> > --log-prefix "NEW tcp try no SYN:"
> > iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
>=20
> You can add RELATED state to this :
>=20
> 	iptables -A bad_tcp_packets -p tcp ! --syn -m state \
> 		--state NEW,RELATED -j DROP

That doesn't necessarily help though.

Our firewall also has a 'new, not syn' filter and it gets hit a LOT. On=20
average about 20% of all blocked packets. Another 20% are unexpected RSTs=20
(i.e. RST that's cannot be mapped to a RELATED or ESTABLISHED connection.)

It has been like this for quite some months, and everything works as expect=
ed=20
but we never found the cause of these new not syns and unexpected resets.

(Yes, related traffic _is_ properly accepted, so that can't be the case.)

--=20
Martijn


