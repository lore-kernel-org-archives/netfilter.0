From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 11:09:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C4F1@wardrive.citadelcomputer.com.au>
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
To: Carlo Florendo <carlo@hq.astra.ph>, netfilter@lists.netfilter.org

This is a commonly asked question and the answer is real simple if you =
think about it..

You must DNAT to the internal IP address which is what you've already =
done for external to mx.<domain> and you must do the same for the =
internal clients with once extra step, you must change the source like =
you do if the client were MASQUERADED to the outside world. My must =
treat the mx.<domain> as if it was outside too..


iptables -t nat -A PREROUTING -i <internal_iface> -d 219.21.114.34 \
    -j DNAT --to 192.168.0.3

# Masquerade the internal client so packets are forced back via the =
firewall
iptables -t nat -A POSTROUTING -s <internal_subnet> -d 192.168.0.3 \
    -j SNAT --to 192.168.0.1 =20

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: Carlo Florendo [mailto:carlo@hq.astra.ph]
> Sent: Friday, 17 October 2003 2:56 AM
> To: netfilter@lists.netfilter.org
> Subject: local DNAT with bind,postfix,and iptables
>=20
>=20
> Hello,
>=20
> I have a box which runs bind, postfix, and iptables.  (Box A)
> This box has 2 interfaces.  One facing the net and the other=20
> the internal
> network
>=20
> There's another box behind the firewall that runs postfix and=20
> is part of the
> internal network.  (Box B).
>=20
> Here's the setup.
>=20
> -------------
> |    Internet   |
> --------------
>         |
>         |
>         |             host: my.company.org
> -------------  Pub. IP: 219.21.114.33
> |    Box A    |  runs bind, iptables, postfix
> --------------  Pri. IP: 192.168.0.1
>         |
>         |
> ------------- host: mx.my.company.org
> |    Box  B   | runs postfix
> ------------- Pri. IP 192.168.0.3
>=20
> There is an mx entry in bind, in box A, which maps the IP address
> 219.21.114.34 to mx.my.company.org (Box B).  Although Box B=20
> has no interface
> that listens as 219.21.114.34, I've done a DNAT from Box A to Box B
> so that, when Box A receives a request for 219.21.114.34, it=20
> does a DNAT to
> 192.168.0.3.  With this way, Box B can
> receive mails which it's supposed to receive.
>=20
> This is how it worked:
>=20
> iptables -t nat -A PREROUTING -i <public_iface> -d 219.21.114.34 \
>     -j DNAT --to 192.168.0.3
>=20
> Now, here's my problem:
>=20
> Since the internal network have their mail clients configured=20
> to use Box A
> as their smtp server, there should be a way
> for Box A to communicate with Box B using 219.21.114.34.
>=20
> I cannot use Box B's IP 192.168.0.3 since this would break=20
> bind.  If I do
> this, mail from outside would not reach Box B.
> Since mx requests for mx.my.company.org would return=20
> 192.168.0.3 which is
> invalid within the internet.
>=20
> The only way to do this is for Box A to be able to DNAT to box B using
> locally generated connections (that is, connections that=20
> would be initiated
> by Box A's smtp server).
>=20
> The howto says that DNAT for locally generated packets is not=20
> possible in
> 2.4 kernels.  Does this still hold true?
>=20
> Is it possible to DNAT 219.21.114.34 to 192.168.0.3 if=20
> connections originate
> from 219.21.114.33 (DNAT for locally generated packets)?
>=20
> This solution obviously does does not work:
>=20
> iptables -t nat -s 127.0.0.1 -d 219.21.114.34 -j DNAT --to 192.168.0.3
>=20
> Any workarounds?  Thanks!
>=20
> Thanks!
>=20
> Best Regards,
>=20
> Carlo
> ------
> Carlo Florendo
> Astra Philippines Inc.
> www.astra.ph
>=20
>=20
>=20
>=20

