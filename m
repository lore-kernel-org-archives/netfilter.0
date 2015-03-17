From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: transparent proxy with iptable redirect
Date: Tue, 17 Mar 2015 10:07:43 +0100
Message-ID: <5507EEDF.8040808@plouf.fr.eu.org>
References: <CAMGYKAewXqwykFeHWSxLeW-MJP9xqujuRMT6pwOEsjUDtGQFtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMGYKAewXqwykFeHWSxLeW-MJP9xqujuRMT6pwOEsjUDtGQFtA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Chen <peter.feifan.chen@gmail.com>
Cc: netfilter@vger.kernel.org

Peter Chen a =E9crit :
> I have a pretty straightforward question that I've been wondering. If
> I add an iptable redirect rule (e.g. dst tcp port 80 to tcp port
> 8080), it would change every tcp packet with port 80 as its
> destination to a tcp packet with destination 8080. Now if my
> application listening on 8080 were to reply to the source, it would
> transmit a tcp packet with src port 8080, but the source side is
> expecting a tcp packet with src port 80.
>=20
> So my question is, how does the reverse path from dest back to the
> src, at what point does the port number get rewritten from 8080 back
> to 80, making the redirect transparent? Is this done by iptable
> automatically on a redirect target?

Yes. Stateful NAT takes care of both directions of the connection.
