From: Andrew Beverley <andy@andybev.com>
Subject: Re: fail in the connmark load-balancing
Date: Sun, 12 Feb 2012 22:10:58 +0000
Message-ID: <1329084658.18690.375.camel@andrew-desktop>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329084658;
	bh=M+iXBww5wqT9+HLd9iTPtXL51JBi5+zfa6noyk9G/I8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=EmOtKUPp1hLIwoKkqLH8D+LFbgSUMeJrQg3cn93xlvl4v2kOr56Fabn+B1Uq+TRo2
	 AfEBqDLqs8Qa5KEAuydbioeofyj9U6ku0DLoLM/LzufYyUH5xYwp0D05931CYDR5/M
	 2hASn0af2rPizHECKnybO5Qkmgu20rZg52jhMHqw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Sat, 2012-02-11 at 18:19 -0200, Usu=C3=A1rio do Sistema wrote:
> Hello,
>=20
> I've just deployed the load balance in the my firewall iptables
> 1.4.3.1 as How to below:
>=20
> http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilt=
er-load-balancing-using-connmark

> I need add follow line to occur the load balance ??

[...]

> ip route add default scope global equalize nexthop via x.y.t.z1 weigh=
t
> 2  nexthop via x.y.t.z2 weight 2

No, you don't need that line when doing load sharing with the method
described above. That will break the sharing per-connection, which is
obviously what you are trying to achieve.

If it's not working, there must be another problem. Please show the
output of "ip rule show", "ip ro" and "ip ro show table <table>" for
each of your tables where <table> is the name of the tables.

Andy



