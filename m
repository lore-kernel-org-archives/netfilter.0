From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: routing all HTTP requests to my own web server
Date: Fri, 17 Oct 2008 13:32:56 -0500
Message-ID: <48F8DA58.7090202@riverviewtech.net>
References: <a0a0d59c0810171040s3646c212g150d7691e6d92f4b@mail.gmail.com>	 <48F8D21E.9050601@riverviewtech.net> <a0a0d59c0810171129h17c16603vf1d323b71d4a2a02@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0a0d59c0810171129h17c16603vf1d323b71d4a2a02@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 13:29, Jeremy Pullicino wrote:
> Thanks Grant - I understand exactly what you mean.

*nod*

> To solve the TCP Triangle problem I should probably add this rule=20
> (192.168.11.1 is the local machine):
>=20
> iptables =96t nat =96A POSTROUTING -p tcp --sport 80 =96j SNAT =96-to
> 192.168.11.1
>=20
> Would that be correct?

I would not use an "sport" match.  I would match on "dport".  Remember=20
that client TCP connections can come from any port between 1024 and=20
65535.  However seeing as how it is going to your proxy server on a=20
specific port I'd match on that.  I'd probably also match on your proxy=
=20
server's destination IP.

> Thanks for your advice.

You are welcome.
