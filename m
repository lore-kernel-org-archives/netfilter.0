From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: '-t nat -A OUTPUT -j REDIRECT' changes source address ?
Date: Wed, 8 Oct 2003 08:37:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C44F@wardrive.citadelcomputer.com.au>
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
To: paddy@cobalt0.panici.net, netfilter@lists.netfilter.org

You can only REDIRECT incoming packets AFAIK and not outgoing. And =
there's better ways of doing this..

*.*                        /var/log/pipelining

Then create a piped file.

prw-------    1 root     root            0 Oct  7 10:46 pipelining

write a script to listen to the pipeline file much like a `tail -f` does =
and resend all syslogs.

=20

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
> From: paddy@cobalt0.panici.net [mailto:paddy@cobalt0.panici.net]
> Sent: Tuesday, 7 October 2003 4:38 AM
> To: netfilter@lists.netfilter.org
> Subject: '-t nat -A OUTPUT -j REDIRECT' changes source address ?
>=20
>=20
> Hi,
>=20
> I was trying
>=20
> iptables -t nat -A POSTROUTING -p udp --dport 9998 -j SNAT=20
> --to 10.0.0.3
> iptables -t nat -A OUTPUT -p udp --dport 9998 -j REDIRECT=20
> --to-port 514
>=20
> as part of an increasingly hair-brained scheme to tunnel syslogs to a
> master server.
>=20
> I should mention that the source of this connection is local - the end
> of a pipeline of ssh and netcats, I'm trying to restore a usefull
> source ip address based on the information in the destination port no.
> while redirecting to 514/syslog.
>=20
> Is this the expected behaviour ?
>=20
> Any suggestions on sensible ways to do this ?
>=20
> Many thanks,
>=20
> Paddy
>=20
>=20

