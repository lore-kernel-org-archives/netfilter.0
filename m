From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Allowing access only some sites - onely some mac address
Date: Tue, 30 Aug 2005 16:10:34 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E27BF@farmer.vikus.com>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Taylor, Grant
> Sent: Tuesday, August 30, 2005 1:23 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Allowing access only some sites - onely some mac address
>=20
> > You may also want to consider getting arpwatch. arpwatch=20
> will tell you when a particular user changes their MAC=20
> address. MAC spoofing, while more difficult than IP spoofing,=20
> is still fairly trivial and particularly in this case where=20
> you are using a "blacklist" approach for filtering MACs. So=20
> if I'm the one with MAC 00:D8:02:D8:C8:DF and I want to get=20
> around your rules, I'll get a utility to change my MAC to=20
> something that won't trigger your firewall rule, like=20
> 10:D8:02:D8:C8:DF, which I can be sure won't collide with=20
> another MAC for quite some time.
> >=20
> > If the particular users you are trying to filter for aren't very=20
> > technical then I wouldn't worry but after two years of being a lab=20
> > assistant/server admin for a network security class I tend to be a=20
> > little paranoid. =3D)
>=20
> You are absolutely correct.  So my immediate response to this=20
> is do the exact opposite, have the MAC of the computers that=20
> are allowed to access any thing other than the sites in=20
> question.  As far as needing ARP watch to look for changes in=20
> IP, you could watch for the MAC and IP pair of allowed=20
> systems.  Sure people could still get around this but they=20
> will be breaking other things too.
>=20
>=20
>=20
> Grant. . . .

Yes, that is the best way to do things. The university I graduated from
implemented whitelist MAC-based network access very effectively and
would kill your port if you tried getting around it. Having managed
switches helped quite a bit.

Derick

