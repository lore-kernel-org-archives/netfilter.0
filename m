From: Andrew Beverley <andy@andybev.com>
Subject: Re: Load Balance
Date: Sun, 15 May 2011 18:23:45 +0100
Message-ID: <1305480225.1708.2.camel@andybev>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305480240; bh=UI0P5fY1ViceurPbzopJaxAfdN3UhzHPkAM1X
	QIs724=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=cW1JGr5d
	/czrtLzWMoL7HF3gbJgbrH+BoiUe41yuYw8PhGwC69PyX9IDuHuX+Slbax59kYY4OXd
	Y3zKyewijsBnAVVhSkrIUpUClS3FPxCPH73pFwMCyw2SMUWLovFlYMCElrSpYveyDZR
	SjY2rvDemjuM1wke6+rRN7sUF3PKE=
In-Reply-To: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: netfilter@vger.kernel.org

On Sun, 2011-04-17 at 20:22 -0300, Usu=C3=A1rio do Sistema wrote:
> Hello everyone, I'm deploy an test environment with load Balance in m=
y
> Firewall using equalize as follow below
>=20
>=20
> I have two ISPs and one Inside network.
>=20
> creating the load balance:
>=20
> ip route add default scope global equalize nexthop via 200.247.209.65
> weight 1  nexthop via 201.72.12.1 weight 1
>=20
> Zeroing the ip_filter
>=20
> for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
> echo 0 > $eee
> done
>=20
> creating more one table
>=20
> ip route add default via  201.72.12.1  table telemar
>=20
>=20
> it's working in my environment. but I haven't done available in my
> production environment.
>=20

Do you mean it doesn't work in your production environment?

> my question is: there is more parameter ,which, I have to set ? for
> exemplo, timers.
>=20

If you are using 2 completely separate ISPs, then you will need to do
more than just provide equal-weighted gateways. You will need to send
the packets for each connection over the same ISP. The website below
gives more information:

http://www.sysresccd.org/Sysresccd-networking_en_Iptables-and-netfilter=
-load-balancing-using-connmark

Andy


