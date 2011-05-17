From: netfilter@buglecreek.com
Subject: Re: Correct Chains to Apply Rules
Date: Tue, 17 May 2011 15:50:45 -0600
Message-ID: <1305669045.20717.1453045045@webmail.messagingengine.com>
References: <1305666891.6262.1453014301@webmail.messagingengine.com>
 <4DD2E89F.30801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:cc:mime-version:content-transfer-encoding:content-type:in-reply-to:references:subject:date; s=smtpout; bh=D03YvpVCFvL7Qlm3p1r4bgHcTok=; b=H5sJv6sIABr0P7Bi3UA4Rcls5BpASqZz7HlhXdkoOaJJV3pehmubexo7Ekk/nFfM0BBHvMWsy+bncVmCxd0c46mGylvkyIYNckyufoA5jiAbhug32nG4ptDU99neFP0traKjuWwKWQFbTGWqVR9yBgv2tX5JbfQCWsPnhB/ml2c=
In-Reply-To: <4DD2E89F.30801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

OK.  Thanks.  So to block/allow traffic from network A to/from network =
B
I would apply my rules to the FORWARD chain using a source/destination.=
=20
The INPUT and OUTPUT chains on eth0 and eth1 are only for traffic bound
for the firewall/router box itself?=20

On Tue, 17 May 2011 23:29 +0200, "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>=20
> netfilter@buglecreek.com a =E9crit :
> >=20
> > In the following scenario.  Someone makes a new HTTP request from t=
he
> > Internet that is allowed inbound on eth0 and goes out of the eth1
> > interface to the HTTP server in the server network.=20
> > The HTTP server in the server network sends the response to the ori=
ginal
> > requester. =20
> >=20
> > Does the response ever hit the INPUT chain of ETH1?
>=20
> No.
>=20
> > Or does it immediately go to the FORWARD chain
>=20
> Yes.
>=20
> > and out the OUTPUT chain of eth0. =20
>=20
> No.
> The three filter chains are mutually exclusive : a packet can only go
> through one of them. Forwarded packets only go through the FORWARD ch=
ain.
>=20
