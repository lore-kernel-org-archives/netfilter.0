From: Jong Hian Zin <mail.zin@gmail.com>
Subject: Re: Firewall blocking Java applet?
Date: Thu, 23 Jun 2005 10:31:19 +0800
Message-ID: <cb82de5905062219311bcdfba3@mail.gmail.com>
References: <cb82de59050622183613989c5f@mail.gmail.com>
	<200506222102.32991.rob0@gmx.co.uk>
Reply-To: Jong Hian Zin <mail.zin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506222102.32991.rob0@gmx.co.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On 6/23/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
>=20
> On Wednesday 22 June 2005 20:36, Jong Hian Zin wrote:
> > http://202.188.95.52:8080/speedometer/
> >
> > The bandwidth test Java applet can be loaded, but unable to start the
>=20
> Does it work if not going through the OpenWRT?


Yes, it works if I connect the PC directly to the ADSL modem, using PPPoE.

Not from what you posted. iptables-save(8) would be easier to follow.
> But you can probably troubleshoot this on your own by putting in -j LOG
> rules for -s/-d 202.188.95.52 <http://202.188.95.52> traffic. Try it and=
=20
> see what you get. Is
> the openwrt capable of normal logging? Or maybe to a remote syslog
> server?
>=20

I will try iptables-save and logging.

--=20
Jong Hian Zin
