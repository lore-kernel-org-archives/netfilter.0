From: SamLT <sam@sltosis.org>
Subject: Re: using 8021.q for trunk
Date: Fri, 27 Apr 2012 09:19:08 +0200
Message-ID: <20120427071907.GQ20607@tosh.sltosis.org>
References: <CAMTjHrwkg4Ydj=YdLi+t0rUyF9pih99RBOjSnmS=0Sxr-sSbzA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1335511151; bh=TCxrEmGDTfqngSzgThJ+cC2bht2ZNUDElpSSY8u1e9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIpqvoOzEVM6LmCRttdjHgFHd43XyTpE9KdlNL7QPXY3+AhMJrgAEm5i1WFUGG92+
	 tPwUO04PhEEeWhf0HWBlj09bdH8CM0p5pJ0ArBrSIrAZaI7OjCUXI1TZIgG54XQBAK
	 OcjNAYSB/6KzdFHn9d8pWk2GfR9igMn+HoP7UHFw=
Content-Disposition: inline
In-Reply-To: <CAMTjHrwkg4Ydj=YdLi+t0rUyF9pih99RBOjSnmS=0Sxr-sSbzA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?Q?Usu=C3=A1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, Apr 27, 2012 at 12:18:59AM -0300, Usu=C3=A1rio do Sistema wrote=
:
> Hello, I have never stablished trunk between an Linux machine and an
> Switch. currently a customer gives me to accomplish.
>=20
> so....I wish an suggest about how to vlan configuration on linux
> machine. there are some docs at the Internet but I prefer get from
> here.
>=20

unless I misunderstood, it really is as simple as the following:

| ip link set eth0 up
| ip link add link eth0 eth0.10 type vlan id 10
| ip addr add $ip/$mask dev eth0.10
| ip link set eth0.10 up

=20
>=20
> some sites or docs are welcome.
>=20
> thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
