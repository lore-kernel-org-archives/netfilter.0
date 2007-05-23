From: Pat Riehecky <prieheck@iwu.edu>
Subject: Re: Conntrack rule timeout problem
Date: Wed, 23 May 2007 08:42:11 -0500
Message-ID: <1179927731.28690.16.camel@thales.lan>
References: <1179765250.12001.18.camel@thales.lan>
	<465437E1.9030600@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465437E1.9030600@freemail.hu>
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
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

On Wed, 2007-05-23 at 14:47 +0200, G=C3=A1sp=C3=A1r Lajos wrote:
> Hi,
>=20
> Pat Riehecky =C3=ADrta:
> > I seem to be capturing way more packets than I intend (or even expect=
!).
> > I am running squid and have the firewall rules below running on it.  =
For
> > some reason I am capturing hundreds of packets that I don't think sho=
uld
> > be caught.
> >  =20
> Maybe someone is scanning you....
> > I have increased the timeouts in /proc/ (via sysctl) to fix this, but=
 no
> > dice.  Anyone have any idea why the sample packet below would be
> > captured?  It is getting picked up by either the=20
> > -A INPUT -p tcp -m tcp ! --syn -m conntrack --ctstate INVALID -j DROP
> > but sometimes the
> > -A INPUT -p tcp -m tcp ! --syn -m state --state NEW -j DROP
> >  =20
> Take a look on nmap...
> > The packet looks to have been requested by squid, it is coming on por=
t
> > 80...  I also seem to be having the same behavior on the squid side
> > where the FIN/ACK packets are being caught by the conntrack rule...
> >
> > I know I have something wrong, just what exactly is eluding me...
> >
> > Any help would be helpful!
> >  =20
> Swifty
>=20

I am about 90% certain that I am not being scanned as a bunch of the
dropped packets are coming from places like the New York Times,
Microsoft, and Google.  Admittedly they could be spoofed IP addresses.
but the packets are all coming from 80 or 443 and they are all destined
for TCP Ports in the ephemeral range.  Additionally in my squid logs I
have a corresponding entry requesting data from that server.

All evidence I have points to some sort of conntrack timeout.
Occasionally I can find the IP addresses in the output from iptstate,
but...=20

Thanks for the ideas, any chance for more theories?
Pat


