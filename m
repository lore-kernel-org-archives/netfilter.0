From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Direct Internet Connection For Client
Date: Tue, 13 Nov 2007 10:04:05 +0200
Message-ID: <1194941045.2675.3.camel@localhost.localdomain>
References: <4739525D.70205@liqwidkrystal.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4739525D.70205@liqwidkrystal.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Cc: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 13/11/2007 =D7 12:59 +0530, Tarak Ranjan =D0=C9=DB=C5=D4=
:
> Hi list,
>            i have installed proxy and gateway in the same system. How=
=20
> can  stop "Direct Connection" in web browser for internet for the=20
> clients(proxy). i have redirect 80 port to 8080. then also direct=20
> connection is happening from the clients. what sort of iptables rules=
=20
> i've to implement in my gateway firewall , that every time users shou=
ld=20
> pass through proxy(8080). No Direct Connection........

iptables -A FORWARD -i <client_iface> -o <inet_iface> -j REJECT
--reject-with icmp-admin-prohibited

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>


