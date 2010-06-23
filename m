From: Ninad A <ninad_adi@yahoo.com>
Subject: Re: Blocking Ads.
Date: Wed, 23 Jun 2010 02:37:31 -0700 (PDT)
Message-ID: <215194.52736.qm@web112405.mail.gq1.yahoo.com>
References: <4C211CE1.7000400@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1277285851; bh=sMeprpCA6qoNNcmUmmm6pH9UxsLIJgFLM9A6983o2Pc=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=DJyLELi4b1QIkn/26nqNODO+tX0ilffO5VSPBYnnh03QVn+J65G6DMYdd4t+P/ivKaVjII3X8fPbTLexXU9ZVZaINkm0nz6JCBOMsNvELPF+xvwLM3YskiRjF41O+f//YaAo80DMNRdBBk+zqt1m650drPdJf/zJnILqQ+15NSI=
In-Reply-To: <4C211CE1.7000400@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: jengelh@medozas.de, gtaylor@riverviewtech.net, craig@haquarter.de, curby@cur.by

Thanks, for so prompt answers to all.

I am sorry for this state, but I am bit confused.

INFO : Mine is a simple UBUNTU system with kernel 2.6.34 behind ppp0 no=
t a=20
       security device which has LAN and WAN ports so that FORWARD chai=
n=20
       can be used.

1) Using REJECT target will definitely send an ICMP error message to th=
e  =20
   opposite party but still that doesnt help connection at my machine =20
   which times out and thats why application delay is caused.
   What might be the problem ?

2) That makes me to think on different line, whether to use iptables fo=
r
   content filtering or let Application proxy handle the case.
=20
   This might be a newbie question.
3) How do I write a iptable rule for the DNS, i.e At the LOCAL INPUT HO=
OK
   in the filter table when the packet is received there is no trace
   of DNS. i.e Whatever we have is un-interpreted data, not in user for=
mat.

4) Finally, how to handle the missing content gracefully.
          i) Using Application Proxies
         ii) Apply iptables typical source ip address rules with REJECT=
=2E
        iii) Writing a custom iptable module according to individual=20
             requirements.
         iv) Putting a place holder.

Thanks,
N
-----------------------------------------------------------------------=
-

=46or Reference.

> > As far as I know, ad blocking is more commonly
> performed using DNS, by resolving domain names to 127.0.0.1,
> or to a server to serve up notices of removed content (e.g.
> in a business environment, users could request that sites be
> unblocked).=A0 Is there a reason why you want to block
> specific IP addresses instead of domains?
>=20
> Agreed.=A0 Normally this is done via DNS, or (IMHO)
> better via an application layer proxy.
>=20
> If I was going to DNS poison names where content was served
> from, I'd either provide a place holder, or an HTTP 404
> error so that the client could gracefully handle the missing
> (blocked) content.
>=20
> > Anyway, I suspect that sending back appropriate ICMP
> error messages instead of DROPing such requests would
> provide hints to clients that they should give up instead of
> wait for a reply.
>=20
> Agreed.=A0 This is why you want to REJECT with an ICMP
> error message, so that clients (that will honer them) get an
> immediate notification that the connection has been
> blocked.
>=20
> Not all clients will honor the ICMP rejection
> message.=A0 But that is a client problem, not a flaw
> introduced by your firewall.=A0 Returning an HTTP 404
> error would probably be better handled than returning an
> ICMP unreachable message.
>=20
>=20
>=20
> Grant. . . .




     =20
