From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 14:11:30 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019924@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Greg Cope <gregcope@gmail.com>, netfilter@lists.netfilter.org

Greg,=20

This might be real dump but do you have IP forwarding enabled?  If you
do then NAT's isn't necessary between the LANs. =20

Gary=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Greg Cope
> Sent: Tuesday, January 25, 2005 2:07 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Help debugging iptables firewall....
>=20
> Bingo.
>=20
> Seemed to have solved it.  I noticed that without the firewall running
> the following rule was in the stop section:
>=20
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24  -j MASQUERADE
>=20
> Looking at the tcp dumps when it "worked" without the firewall the db
> server thought it was talking to the firewall.
>=20
> When the firewall was on the db server was failing to talk to the
> webserver, and the conection packet got through, but there never
> seemed to be an ack packet backout.
>=20
> I am a bit confused, but it seems to work now - which is good until
> tomorrow morning.
>=20
> Thanks for your help.
>=20
> Not sure what the right way to do it is.  I suppose the LAN should be
> masqueraded to the DMZ hosts, as the DMZ hosts should not have
> detailed knowledge of the LAN side.
>=20
> Greg

