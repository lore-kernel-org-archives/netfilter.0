From: Rainer Arnst <Rainer.Arnst@ee-consultants.de>
Subject: Re: IPSec Transport Mode
Date: Fri, 09 Jul 2004 18:25:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089390320.4237.29.camel@PCA-ARNSTR.ee-consultants.de>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407071453.49223.Antony@Soft-Solutions.co.uk>
	 <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407072154.52923.Antony@Soft-Solutions.co.uk>
	 <1089387536.4237.20.camel@PCA-ARNSTR.ee-consultants.de>
	 <1089389598.2111.33.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089389598.2111.33.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

On Fri, 2004-07-09 at 18:13, Cedric Blancher wrote:
> Le ven 09/07/2004 =C3=A0 17:38, Rainer Arnst a =C3=A9crit :
> > I tried to work with that, but failed to produce the desired results,
> > which were to enable IPSec transport mode packets to pass through the
> > firewall not being NATed.
> [...]
> > Got anyone any ideas?
>=20
> Yes, I got one I previously explained. IPSEC transport mode can't cope
> with NAT if you do TCP. ESP transport port only encapsulate IP packet
> payload (layer 4) as opposed to ESP tunnel which encapsulate full IP
> packet.

I know, that is why I wanted to avoid NAT for ESP/AH, passing packets
through without rewriting their destination, following this suggestion
from Antony@Soft-Solutions.co.uk:

> 1. Put a genuine public IP address on the destination Security Gateway
> machine, routed through the firewall without nat.

> When you do NAT, you alter IP source and/or destination. But TCP
> checksum includes IP addresses, which means you have to recompute it on
> the fly when NATing. Anf for it is ciphered, you can't.

Unfortuneately I have to find a way to make the transport mode work; we
were using NAT-T, which worked fine, but now I am looking for another
solution which does not require the VPN Gateway to support NAT-T.

Greetings,
Rainer


