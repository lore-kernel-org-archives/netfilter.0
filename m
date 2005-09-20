From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: snat to multiple source ip
Date: Tue, 20 Sep 2005 15:00:15 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2CE5@farmer.vikus.com>
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
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Marco Berizzi
> Sent: Tuesday, September 20, 2005 11:17 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: snat to multiple source ip
>=20
> Derick Anderson wrote:
>=20
> > Uneducated, lazy guess: the SNAT target supports only one=20
> "--to [IP]"
> > and the command parser ignores the extraneous "--to [IP2]". You can
> test
> > this by switching the two IPs and see if you go out on a different=20
> > address.
>=20
> Nope!
>=20
> >From "man iptables":
>=20
> "...You  can  add  several --to-source options.  If you=20
> specify more than one source address, either via an address=20
> range or multiple --to-source options, a simple round-robin=20
> (one after another in
> cycle) takes place between these adresses."

Well that's neat, I'll have to try that some time. Might work nicely as
a load balancer where I work.

Derick

