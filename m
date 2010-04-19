From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: SO_ORIGINAL_DST returning bogus port number
Date: Mon, 19 Apr 2010 22:09:55 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004192206330.30616@obet.zrqbmnf.qr>
References: <003f01cadff7$8ebeb720$ac3c2560$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003f01cadff7$8ebeb720$ac3c2560$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Jeff Saremi <jeffsaremi@yahoo.com>
Cc: netfilter@vger.kernel.org


On Monday 2010-04-19 21:36, Jeff Saremi wrote:
>
>Setup:
>
>iptables -A INPUT -p tcp -i eth0 -j ACCEPT
>iptables -t nat -A PREROUTING -i eth0 -p tcp -j REDIRECT --to-port 900=
0
>
>Code:
>
>=C2=A0=C2=A0=C2=A0 cli_fd =3D accept(fd, (struct sockaddr *) &cli_addr=
, &cli_len);
>=C2=A0=C2=A0=C2=A0 dst_len =3D sizeof(dst_addr);
>=C2=A0=C2=A0=C2=A0 if(getsockopt(cli_fd, IPPROTO_IP, SO_ORIGINAL_DST, =
&dst_addr, &dst_len)
>!=3D 0)
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("getsockopt() return=
ed error");
>=C2=A0=C2=A0=C2=A0 else
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("original destinatio=
n address: %s:%d\n",
>inet_ntoa(dst_addr.sin_addr), dst_addr.sin_port);

You have to use

else {
	char buf[16];
	inet_ntop(AF_INET, &dst_addr.sin_addr, dst, sizeof(dst));
	printf("%s:%hu\n", buf, ntohs(dst_addr.sin_port));
}
