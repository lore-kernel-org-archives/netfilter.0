From: Andrew Beverley <andy@andybev.com>
Subject: Re: redundancy with Adsl modem
Date: Tue, 03 Jan 2012 07:14:14 +0000
Message-ID: <1325574854.2270.130.camel@andybev-desktop>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325574867;
	bh=4bZXw+nDrFe64nx5lVUCiqQ8UTUzMVqgMre89bZoD44=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=o/zwifZmlsNA/WKTHMp2ZFfZBE8USOYJCVxfgnzWm/bbU9wJQvQG1Wi414RMxGuz/
	 QuZT9db8wxzd50DMc3ZmRBHZ7njzB1azHKSz+WKeSykomkqqXCxW7rTIr790NvFRnD
	 4qUBEmuDNjN3LpUcWaAf3dzVnioRV3ARieNG9Rjw=
In-Reply-To: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Mon, 2012-01-02 at 23:54 -0200, Usu=C3=A1rio do Sistema wrote:
> Hello everyone,
>=20
> I'm searching a way of the redundancy with my firewall CentOs Linux
> 5.5 that is behind from two adsl modem.
>=20
>=20
> well, I wish that when a link adsl comes down ( side from ISP line
> adsl no Ethernet cable that connects the modem adsl to my firewall )
> the traffic go to for other link adsl.
>=20
> there is any way to reach this redundancy with Linux iptables ??

I would recommend using LSM[1] and configuring that to run the relevant
iptables/iproute2 commands should an interface fail.

Andy

[1] http://lsm.foobar.fi/


