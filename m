From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: Trouble with --dport
Date: Tue, 22 Oct 2002 09:58:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A3FA4@olga.chs.chalmers.se>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

I also got those errors when using v1.2.5. The iptables-save added a
"-m" in my rules-save and that caused the same error as "blah blah". I
edited the file (/var/lib/iptables/rules-save) and then restored the
rules again and it worked just fine after that. In the latest version of
iptables this is fixed.

//kim

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
> Sent: Monday, October 21, 2002 11:15 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Trouble with --dport
>=20
>=20
> On Monday 21 October 2002 10:07 pm, blah blah wrote:
>=20
> > The exact error message is:
> > iptables-restore v1.2.5: Unknown arg `--dport`
>=20
> Okay, so this is an error from iptables-restore, not the=20
> straight iptables=20
> command (which is what I'd mistakenly thought you meant at first).
>=20
> What commands did you set up before using iptables-save, and=20
> what is your=20
> saved configuration ?
>=20
> Antony.
>=20
> --=20
>=20
> This email was created using 100% recycled electrons.
>=20
>=20

