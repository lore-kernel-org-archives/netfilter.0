From: Ninad A <ninad_adi@yahoo.com>
Subject: Re: Blocking Ads. Thanks.
Date: Wed, 23 Jun 2010 21:44:55 -0700 (PDT)
Message-ID: <577407.78247.qm@web112415.mail.gq1.yahoo.com>
References: <4C224635.40003@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1277354695; bh=Z3NjF8wg078f1vFkMisfaiNulHZVWJ1SdeZ9xV5HETU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=EChrFqW6leyrd1ifEO4LVRZjHSI+06+Tg4bTeOiijG1krNEFsWJ0K+jNeiaernrSaZAcO9JWha+cYu8gKDnAMD5cBZDMr7hahamuCqK4Q7qY1euMVUx8xLHb1VNX12rbMCk6GbhgxCzH3isMdxSMS2AMyhsUWFLSsRG9ovIV5tA=
In-Reply-To: <4C224635.40003@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> Honestly, I think this is probably your best approach,
> combine the best of both worlds to achieve what you are
> wanting to do with out going to a lot of effort.
> transparent proxy and application layer proxy.
> (gateway / firewall) do what it's designed to do.

Thanks, so Finally, I tested this seems to be a proper option for me.

Thanks to all greats out there.=20
I close this rule in this mail chain.=20

N.


> > Thanks, for so prompt answers to all.
>=20
> You are welcome.
>=20
> > INFO : Mine is a simple UBUNTU system with kernel
> 2.6.34 behind ppp0 not a security device which has LAN and
> WAN ports so that FORWARD chain can be used.
>=20
> You should be able to do much the same thing using the
> INPUT and / or OUTPUT chains.
>=20
> > 1) Using REJECT target will definitely send an ICMP
> error message to the opposite party but still that doesnt
> help connection at my machine which times out and thats why
> application delay is caused. What might be the problem ?
>=20
> Not all applications honor the ICMP error message that
> comes back to then.=A0 (Microsoft programs are
> notoriously bad about not honoring ICMP errors.)
>=20
> This is why I was suggesting something like a 404 error.
>=20
> This is the fault of the client software that is using your
> connection, not your firewall or its design.
>=20
> > 2) That makes me to think on different line, whether
> to use iptables for content filtering or let Application
> proxy handle the case.
>=20
> Given equal capabilities, this is somewhat a personal
> preference issue.
>=20
> Layer 3 firewalls are great at filtering packets based on
> layer 3 information.
>=20
> Application layer gateways (firewall) are great at
> filtering on application layer information.
>=20
> An application layer gateway (firewall) can filter
> different domains on the same IP *much* easier than a layer
> 3 firewall.=A0 (Layer 3 firewalls can be made to do this,
> but it is extremely difficult.)
>=20
> Application layer gateways (firewall) is really only good
> for the given application.
>=20
> Layer 3 firewalls are good at about any thing that can be
> done at layer 3, application independent.
>=20
> So you really want to choose what is going to fit your
> needs the best.
>=20
> > This might be a newbie question.
>=20
> If you have a genuine question it doesn't matter how ""new
> you are.=A0 You want / need help, so we will help.
>=20
> > 3) How do I write a iptable rule for the DNS, i.e At
> the LOCAL INPUT HOOK in the filter table when the packet is
> received there is no trace of DNS. i.e Whatever we have is
> un-interpreted data, not in user format.
>=20
> I would expect that the traffic would be seen as UDP port
> 53 in the INPUT chain, probably coming in the ppp0
> interface.
>=20
> You could probably also match the outgoing request as UDP
> port 53 in the OUTPUT chain, most likely going out the ppp0
> interface.
>=20
> > 4) Finally, how to handle the missing content
> gracefully.
> >=A0=A0=A0i) Using Application Proxies
>=20
> An application (layer) proxy (gateway / firewall) can more
> gracefully handle / filter traffic in such as it can return
> an error that the client will better understand.=A0 I.e.
> it can return an HTTP 404 (not found) error rather than a
> dropped (with or with out reject) packet.
>=20
> >=A0 ii) Apply iptables typical source ip address
> rules with REJECT.
>=20
> IPTables can reject the packet with an ICMP error
> message.=A0 However doing so has a couple of draw backs:
>=20
> =A0=A0=A01)=A0 The client application has to
> honor such ICMP error messages (many do not).
> =A0=A0=A02) the filtering happens later after the
> TCP 3-way handshake meaning that:
> =A0 =A0 =A0 a) the connection is established and
> will have to be dropped or reset.
> =A0 =A0 =A0 b) that you have to filter through
> more packets to find the criteria that you are filtering
> based on.
>=20
> > iii) Writing a custom iptable module according to
> individual requirements.
>=20
> You could re-invent the wheel, but it would be a lot more
> effort than is probably needed.
>=20
> I'd suggest that you look at transparent proxies.=A0 You
> can use IPTables to redirect (standard) HTTP traffic in to a
> transparent proxy and let the application layer proxy
> (gateway / firewall) do what it's designed to do.
>=20
> Honestly, I think this is probably your best approach,
> combine the best of both worlds to achieve what you are
> wanting to do with out going to a lot of effort.
>=20
> >=A0 iv) Putting a place holder.
>=20
> Are you wanting to put in a place holder image or something
> else saying "denied" (or what ever wording you want)?
>=20
> If you are wanting to do this, I think you will have to go
> with an application layer gateway (firewall).
>=20
> To the best of my knowledge, IPTables (and it's brethren
> ARPTables, EBTables, xTables) don't have the ability to
> replace packets and later connections to the extend that is
> required to provide a place holder.
>=20
> > Thanks,
>=20
> *nod*
>=20
>=20
>=20
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
>=20


     =20
