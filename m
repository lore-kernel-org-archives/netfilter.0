From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat with mac instead of ip address?
Date: Tue, 13 Jul 2004 12:57:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407131257.54467.Antony@Soft-Solutions.co.uk>
References: <OF10BF823B.F4DC31CA-ONC1256ED0.0034E497-C1256ED0.0034FAB7@promon.cz> <200407131200.03000.Antony@Soft-Solutions.co.uk> <1089718849.2100.1.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089718849.2100.1.camel@anduril.intranet.cartel-securite.net>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 13 July 2004 12:40 pm, Cedric Blancher wrote:

> Le mar 13/07/2004 =E0 13:00, Antony Stone a =E9crit :
> > Change the destination MAC address on a packet, without changing the =
IP
> > address?
>
> OP has to see ebtables :
>
> 	http://ebtables.sourceforge.net/
>
> Ebtables can perform SNAT and DNAT regarding MAC addresses, but as far
> as I could see, you can provide a solution to all examples without this.
> In fact, MAC DNAT could be seen as a "simple" form of ARP proxy.

I'm still intrigued at why the OP thinks he wants to do this....

Antony.

--=20
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


