From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: Identify traffic coming from which bridge
Date: Fri, 27 Jul 2012 19:42:27 -0700 (PDT)
Message-ID: <1343443347.74660.YahooMailNeo@web124904.mail.ne1.yahoo.com>
References: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com>
Reply-To: Ming-Ching Tiew <mctiew@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1343443347; bh=J9kStnXp87rSWmPMJQgLvMoQ+WLnk7sy8oi+w7xtduo=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=TMXLAeIZqJrzc9iz0j8DLCdD9hBKp28E2ujasVPICxknSnaG6ZkFrozheY2no7RR4GJnLAjsL2nwPrfal6Db8/umuHCatTZlzQQELCOowr3yBfWKyivtEjwJrKpmE2FC39jCgD0nqNhLMT94lmJBFZ4qn98LjCO5jR1dwevBZA8=
In-Reply-To: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>




=46rom: Ming-Ching Tiew <mctiew@yahoo.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Assuming I have a configuration with a few bridges connected to a ser=
ver.
> On the other side of bridge, there are a few clients connected.
>=20
> Eg=A0 bridge A - client A, B, C
>=A0=A0=A0=A0=A0 bridge B - client D, E, F
>=A0 =A0=A0=A0=A0 ......
>=20
> When a client X is connected to the server, is there a way for the se=
rver to
> know client X is connected via which bridge ?=20
>


Is there a command or something, give a mac address of a client, I coul=
d determine
if the client is connected to which bridge ? Will turning on spanning t=
ree algorithm or=20

something help ?

Appreciate your comments !

