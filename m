From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: h.323 compatibility
Date: Wed, 19 Nov 2003 13:21:22 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AD21@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>

>And if you're banning my ISP - Comcast - you've just banned the =
majority of broadband users in the US.
Hoah!!  How cool.. :)

I have no problems with H323 and using NetMeeting behind a 2.4.19 kernel =
firewall. The only thing that was needed to get 2 people who are both =
behind linux firewalls was that 1 had to Host a Meeting for someone =
outside to connect. I found that part weird..

Have you tried this patch at all yet. Just remember there's 2 modules =
neededing to be loaded a I forgot one the first time around.

Thanks,
____________________________________________
George Vieira

> -----Original Message-----
> From: Marc Williams [mailto:marcw@onlymooo.com]
> Sent: Wednesday, 19 November 2003 1:13 PM
> To: netfilter list
> Subject: h.323 compatibility
>=20
>=20
> Even though I'm new to this list, I think that this should probably be
> addressed by Jozsef Kadlecsik.
>=20
> Jozsef, I've read a couple of your posts on this list that seem to
> indicate that there is a known incompatibility between your h323
> conntrack module and the openh323 libraries.
>=20
> Is this accurate?  If so, are there any plans to address this
> incompatibility?  I've been unable to get the GNU gatekeeper=20
> functioning
> correctly behind an iptables firewall for possibly this reason.
>=20
> Thanks!
>=20
>=20
> p.s.
> Btw, I tried emailing you about this but it was bounced=20
> saying that your
> MTA rejected my email saying my site was banned because of unsolicited
> email.  I can assure you that there has never been one single spam
> emanating from my site ever.  And if you're banning my ISP - Comcast -
> you've just banned the majority of broadband users in the US.
>=20
>=20
>=20

