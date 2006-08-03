From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: DNAT with orignal source address
Date: Thu, 3 Aug 2006 09:50:17 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE12582A@q.LeBlancNet.us>
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



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Pascal Hambourg
> Sent: Thursday, August 03, 2006 9:14 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: DNAT with orignal source address
>=20
> > One question that I have regarding the recipe that you provided
> > is that since I have machines with public addresses scattered
through
> > the 192.168.2.0/24 subnet would it still be matching more then it
> > should?
>=20
> What do you mean ?
>=20
The question more specifically was: if I had a server at 192.168.2.10
would it also be caught by the 192.168.2.0/24 rule? But, I think you
answered it with the answer to my last question. It would be caught by
the more specific rule as long as it was placed before the general one.
This would prevent traffic from/to the server from going through the
general rule.

Thanks for all the help,
Robert LeBlanc

