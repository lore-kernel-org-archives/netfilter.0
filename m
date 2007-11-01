From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: redirect to webpage
Date: Thu, 01 Nov 2007 10:56:53 +0100
Message-ID: <4729A2E5.20600@plouf.fr.eu.org>
References: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>	<4728AF60.4090102@riverviewtech.net>	<20071031130209.wnb2jsiao0owc8ok@webmail.harrisonburg.k12.va.us>	<4728CACF.70601@riverviewtech.net> <20071031205706.4i9hlqmw008ck4g0@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071031205706.4i9hlqmw008ck4g0@mail.harrisonburg.k12.va.us>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

dhottinger@harrisonburg.k12.va.us a =E9crit :
>=20
> The main reason I =20
> used the url is because the ip addresses of the sites change quite a =
=20
> bit also.

Then keep in mind Grant's remark :
>> the IPTables binary will translate the names to IP addresses at the
>> time the command was run.  So if the IP address changes you will nee=
d
>> to update your rule.

Note : cantbustme.net is a hostname, not a URL. A URL would be for=20
example <http://cantbustme.net/foo/bar.html>.
