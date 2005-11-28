From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: remove duplicate rules
Date: Mon, 28 Nov 2005 12:15:59 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B14A@mailbox.vikus.com>
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
> Oleg A. Arkhangelsky
> Sent: Saturday, November 26, 2005 7:55 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: remove duplicate rules
>=20
> Hello amit,
>=20
> Saturday, November 26, 2005, 3:39:14 PM, you wrote:
>=20
> ap> same iptables.  I want to stop this , if the same rule exists the=20
> ap> iptables should give some error or should add the same=20
> rule again .
> ap> Please help me .
>=20
>     I think you should manually check the existence of possible
>     duplicate before adding rule. Also you can do somethig like:
>=20
>     iptables -D INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>     iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>=20
>     Then you will never get duplicates.
>     But the first way is more correct.
>=20
> --
> Best regards,
>  Oleg
>=20

Just don't use that method remotely.

Derick Anderson

