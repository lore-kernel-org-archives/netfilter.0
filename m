From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: snat to multiple source ip
Date: Tue, 20 Sep 2005 11:07:24 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2CBD@farmer.vikus.com>
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
> Sent: Tuesday, September 20, 2005 10:24 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: snat to multiple source ip
>=20
> /dev/rob0 wrote:
>=20
> > On Tuesday 20 September 2005 07:39, Marco Berizzi wrote:
>=20
> > the source IP is set by
> > iproute2 in the routing tables.
>=20
> Ok, I'm not clearly explained.
> I'm using SNAT to change the source ip address because=20
> iproute2 set an ip address that I don't like.
> So, I have inserted the following line in my firewall script:
>=20
> iptables -t nat -I POSTROUTING -s iproute2_chosen_ip=20
> --protocol tcp -j SNAT --to i_want_this_first_ip --to=20
> i_want_this_second_ip
>=20
> But everytime I connect to the internet always=20
> "i_want_this_first_ip" is chosen to do the SNAT.

Uneducated, lazy guess: the SNAT target supports only one "--to [IP]"
and the command parser ignores the extraneous "--to [IP2]". You can test
this by switching the two IPs and see if you go out on a different
address.

Derick Anderson

