From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 12:17:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C4F3@wardrive.citadelcomputer.com.au>
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

Oh OK.. sorry, must've skipped a line somewhere there..

OK, this is even simpler solution. Use sendmails "mailertable" or =
postfixs "transport" to redirect the domain to a different IP..

mailertable use:
mx.my.company.org			esmtp:[192.168.0.3]

postfix use:
mx.my.company.org			smtp:[192.168.0.3]

this effects this server only and if mail is sent via sendmail.postfix =
which the domain MX is overriding the DNS..

this is a mail server resolution and not iptables if noone noticed.. ;P

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
> Sent: Friday, 17 October 2003 4:11 AM
> To: George Vieira; netfilter@lists.netfilter.org
> Subject: Re: local DNAT with bind,postfix,and iptables
>=20
>=20
> ----- Original Message -----
> From: "George Vieira"
>=20
> > You must DNAT to the internal IP address which is what=20
> you've already done
> > for external to mx.<domain> and you must do the same for=20
> the internal
> > clients with once extra step, you must change the source=20
> like you do if
> > the
> > client were MASQUERADED to the outside world. My must treat the
> > mx.<domain>
> > as if it was outside too..
> >
> > iptables -t nat -A PREROUTING -i <internal_iface> -d 219.21.114.34 \
> >     -j DNAT --to 192.168.0.3
> >
> > # Masquerade the internal client so packets are forced back via the
> > firewall
> > iptables -t nat -A POSTROUTING -s <internal_subnet> -d 192.168.0.3 \
> >     -j SNAT --to 192.168.0.1
>=20
> I'm sorry for not making myself very clear.   You were the=20
> one actually who
> taught me how to do this bermuda triangle routing when I long=20
> ago posted a
> message "DNAT from an IP address that does not exist, etc..."  :)
>=20
> This solution works if the smtp connection is initiated from=20
> any of the
> internal hosts but 192.168.0.1.  In this case however, it is=20
> 192.168.0.1
> that initiates the connection.
>=20
> The problem is that the smtp server (postfix) which the=20
> internal hosts use
> is 192.168.0.1.  It is that smtp server which queries bind=20
> (DNS) for the mx
> entry (bind and postfix in the same machine).  Since bind returns
> 210.21.114.34 when postfix queries for the mx entry, postfix tries to
> initiate a connection to 210.21.114.34.
>=20
> However, since 210.21.114.34 is actually 192.168.0.3, the=20
> smtp connection
> from 192.168.0.1 should be DNATted to 192.168.0.3.  That is, machine
> 192.168.0.1, the same machine where iptables runs, should=20
> DNAT 210.21.114.34
> to 192.168.0.3.
>=20
> In other words, if I do a telnet from 192.168.0.1 to port 25 of
> 210.21.114.34, there should be a connection.
> However, this does not happen.
>=20
> If I do a telnet to port 25 of 210.21.114.34 from any of the=20
> 192.168.0.0/24
> machines in the internal network, with the exception of=20
> 192.168.0.1, I get a
> connection.   Thanks to the solution you posted :)
>=20
> How is it possible to DNAT to 210.21.114.34 from 192.168.0.1=20
> if iptables
> runs in 192.168.0.1 itself?
>=20
> Thanks so much!
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
> >>
> >> Hello,
> >>
> >> I have a box which runs bind, postfix, and iptables.  (Box A)
> >> This box has 2 interfaces.  One facing the net and the other
> >> the internal
> >> network
> >>
> >> There's another box behind the firewall that runs postfix and
> >> is part of the
> >> internal network.  (Box B).
> >>
> >> Here's the setup.
> >>
> >> -------------
> >> |    Internet   |
> >> --------------
> >>         |
> >>         |
> >>         |             host: my.company.org
> >> -------------  Pub. IP: 219.21.114.33
> >> |    Box A    |  runs bind, iptables, postfix
> >> --------------  Pri. IP: 192.168.0.1
> >>         |
> >>         |
> >> ------------- host: mx.my.company.org
> >> |    Box  B   | runs postfix
> >> ------------- Pri. IP 192.168.0.3
> >>
> >> There is an mx entry in bind, in box A, which maps the IP address
> >> 219.21.114.34 to mx.my.company.org (Box B).  Although Box B
> >> has no interface
> >> that listens as 219.21.114.34, I've done a DNAT from Box A to Box B
> >> so that, when Box A receives a request for 219.21.114.34, it
> >> does a DNAT to
> >> 192.168.0.3.  With this way, Box B can
> >> receive mails which it's supposed to receive.
> >>
> >> This is how it worked:
> >>
> >> iptables -t nat -A PREROUTING -i <public_iface> -d 219.21.114.34 \
> >>     -j DNAT --to 192.168.0.3
> >>
> >> Now, here's my problem:
> >>
> >> Since the internal network have their mail clients configured
> >> to use Box A
> >> as their smtp server, there should be a way
> >> for Box A to communicate with Box B using 219.21.114.34.
> >>
> >> I cannot use Box B's IP 192.168.0.3 since this would break
> >> bind.  If I do
> >> this, mail from outside would not reach Box B.
> >> Since mx requests for mx.my.company.org would return
> >> 192.168.0.3 which is
> >> invalid within the internet.
> >>
> >> The only way to do this is for Box A to be able to DNAT to=20
> box B using
> >> locally generated connections (that is, connections that
> >> would be initiated
> >> by Box A's smtp server).
> >>
> >> The howto says that DNAT for locally generated packets is not
> >> possible in
> >> 2.4 kernels.  Does this still hold true?
> >>
> >> Is it possible to DNAT 219.21.114.34 to 192.168.0.3 if
> >> connections originate
> >> from 219.21.114.33 (DNAT for locally generated packets)?
> >>
> >> This solution obviously does does not work:
> >>
> >> iptables -t nat -s 127.0.0.1 -d 219.21.114.34 -j DNAT --to=20
> 192.168.0.3
> >>
>=20
>=20
>=20

