From: =?ISO-8859-1?Q?Fl=E1vio?= Brito <flavio@gral.com.br>
Subject: Re: Newbie Question - Redirect traffic to internal Web server -
	SOLUTION
Date: 18 Oct 2002 07:36:32 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034933793.1262.7.camel@pegasus.gral.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-KqHCnB2gNHRR6BJwnjeM"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-KqHCnB2gNHRR6BJwnjeM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit




--=-KqHCnB2gNHRR6BJwnjeM
Content-Disposition: inline
Content-Description: Mensagem encaminhada - Re: Newbie Question - Redirect
	traffic to internal Web server - SOLUTION
Content-Type: message/rfc822

Return-Path: <flavio@gral.com.br>
Delivered-To: flavio@gral.com.br
Received: from [192.168.1.33] (unknown [192.168.1.33]) by mail.gral.com.br
	(Postfix) with ESMTP id CB01BD1EE6 for <flavio@gral.com.br>; Fri, 18 Oct
	2002 03:46:39 -0400 (EDT)
Subject: Re: Newbie Question - Redirect traffic to internal Web server -
	SOLUTION
From: =?ISO-8859-1?Q?Fl=E1vio?= Brito <flavio@gral.com.br>
To: =?ISO-8859-1?Q?Fl=E1vio?= Brito <flavio@gral.com.br>
In-Reply-To: <1034882656.2076.31.camel@pegasus.gral.com.br>
References: <1034882656.2076.31.camel@pegasus.gral.com.br>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailer: Ximian Evolution 1.0.8 (1.0.8-10) 
Date: 18 Oct 2002 07:35:47 -0200
Message-Id: <1034933747.1249.5.camel@pegasus.gral.com.br>
Mime-Version: 1.0
Status: 

Dear List

The solution to redirect my Web traffic to a internal server

iptables -t nat -A POUSTROUTING -S 192.168.1.0/24 -j MASQUERADE
iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.33 -j ACCEPT
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -d
200.179.213.245 -j DNAT --to 192.168.1.33


How can I see my server if my firewall has a SQUID Proxy? My FW IP is
192.168.1.1 - eth1 and 200.179.213.245 - eth0

Thanks=20

Fl=E1vio





Em Qui, 2002-10-17 =E0s 17:24, Fl=E1vio Brito escreveu:
> Dear List
>=20
> I have two servers in my net,one with a valid IP. I want to redirect all
> the HTTP Traffic(external -> internal) to my internal Web server I'm
> trying to learn iptables, but when I test my rules, sometimes when I try
> to erase them it appears not do what I want.
>=20
> Questions
> 1)
> I use it to erase my rules. But sometimes without sucess. Bug?=20
> #erasing rules=20
> iptables -F
> iptables -F -t nat
> iptables -X
> iptables -X -t nat
> iptables -Z=20
> iptables -Z  -t nat
>=20
> 2)To redirect the traffic to my internal server I must have a DNS in my
> FW server?  or only redirect?
>=20
>=20
>       	[FW]-eth0-> [200.179.213.245]------> Internet
> 	|
> 	|
> 	|eth1 ->[192.168.1.1]
> 	| ---------------> [Web Server ] 192.168.1.33
> 	|----------------> [LAN Hosts] [192.168.1.2 to 192.168.1.100]
>=20
> eth0-> 200.179.213.245
> eth1-> 192.168.1.1
>=20
> Can someone help me with this rules?
>=20
> iptables -t nat -A POSTROUTING -s 192.168.1.10/24 -d any/0 -j MASQUERADE
> iptables -A INPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT
> iptables -A OUTPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www -j ACCEPT
> iptables -A PREROUTING -t nat -p tcp -d 0/0 --dport www -j REDIRECT
> --to-port 80
>=20
> Thanks=20
>=20
> Fl=E1vio=20
>=20
>=20
>=20


--=-KqHCnB2gNHRR6BJwnjeM--


