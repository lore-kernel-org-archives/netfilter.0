From: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Subject: Re: Access Interfaces Wan
Date: Fri, 30 Sep 2011 11:02:57 -0300 (BRT)
Message-ID: <1586563365.76.1317391377548.JavaMail.root@mercurio.contatogs.com.br>
References: <CAMTjHrznU95sGq-0e1CPYetKdXpzprHAo_E3q_R6NdfFFDrLpw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrznU95sGq-0e1CPYetKdXpzprHAo_E3q_R6NdfFFDrLpw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Maicon


----- Mensagem original -----
> De: "Usu=C3=A1rio do Sistema" <maiconlp@ig.com.br>
> Para: "Mail List - Netfilter" <netfilter@vger.kernel.org>
> Enviadas: Sexta-feira, 30 de Setembro de 2011 10:52:35
> Assunto: Access Interfaces Wan
> Hello everyone,
>=20
>=20
> I'm needing that my inside network accesses some IPs which are in the
> my firewall wan interfaces. for exemplo, in the firewall there is the
> IP 200.247.222.1 on the wan interface. those has a destination NAT to
> a inside network machine for FTP protocol. so from Internet to
> ftp://200.247.222.1 it's Working! but from my inside network to
> ftp://200.247.222.1 isn't Working.
>=20
> I've done some rules as follow:
>=20

I am writing in english for the rest of guys to undersatnd us...8)

=46irst could you draw your network in ASCI for us to completely unders=
tand your problem?

If I got correctly you want from inside your LAN access a FTP which is =
inside yout lan. Is it correct???

If it's what you want, the easiest way is to mount a internal dns serve=
r pointing a internal ip for your dns and let all your internal machine=
s to access your ftp without passing through firewall...8)

best regards

>=20
> iptables -t nat -I PREROUTING -s 128.2.0.0/24 -d 200.247.222.1 -p tcp
> --dport 21 -j DNAT --to-destination 128.2.8.214
>=20
> iptables -t nat -I POSTROUTING -s 128.2.0.0/24 -d 200.247.222.1 -o
> bond0 -j SNAT --to-source 128.2.7.16
>=20
> iptables -I FORWARD -s 128.2.0.0/24 -d 200.247.222.1 -j ACCEPT
>=20
>=20
> 128.2.0.0/24 is my inside network
>=20
> bond0 is the inside interface
>=20
> I've done tcpdump on the ftp machine and shows me :
>=20
> access from 128.2.20.71 to ftp://200.247.222.1
>=20
> 09:44:03.719062 IP 128.2.20.71.35768 > 128.2.8.214.21: S
> 395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 728976
> 0,nop,wscale 7>
> 09:44:03.719273 IP 128.2.20.71.35768 > 128.2.8.214.21: R
> 395591609:395591609(0) win 0
> 09:44:06.730331 IP 128.2.20.71.35768 > 128.2.8.214.21: S
> 395591608:395591608(0) win 14600 <mss 1460,sackOK,timestamp 729278
> 0,nop,wscale 7>
> 09:44:06.735412 IP 128.2.20.71.35768 > 128.2.8.214.21: R
> 395591609:395591609(0) win 0
>=20
> seems that the source NAT isn't working becuase is appear 128.2.7.16
> instead 128.2.20.71
>=20
> when access direct ftp://128.2.8.214 ( bypass the firewall ) show :
>=20
> 09:44:37.499007 IP 128.2.20.71.34638 > 128.2.8.214.21: S
> 931391232:931391232(0) win 14600 <mss 1460,sackOK,timestamp 732355
> 0,nop,wscale 7>
>=20
> 09:44:37.499210 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack
> 2427650415 win 115 <nop,nop,timestamp 732355 1042489571>
>=20
> 09:44:37.500931 IP 128.2.20.71.34638 > 128.2.8.214.21: . ack 35 win
> 115 <nop,nop,timestamp 732355 1042489573>
>=20
> 09:44:37.523867 IP 128.2.20.71.34638 > 128.2.8.214.21: P 0:16(16) ack
> 35 win 115 <nop,nop,timestamp 732357 1042489573>
> 09:44:37.525707 IP 128.2.20.71.34638 > 128.2.8.214.21: P 16:42(26) ac=
k
> 69 win 115 <nop,nop,timestamp 732357 1042489596>
> 09:44:40.469622 IP 128.2.20.71.34638 > 128.2.8.214.21: F 42:42(0) ack
> 91 win 115 <nop,nop,timestamp 732652 1042492541>
>=20
> there is ack TCP! and it's work!
>=20
> How can I access my ip outside 200.247.222.1 from my inside network ?=
?
> what is missing in my rules. pay attention in bond0 ( bind eth0 and
> eth1 ) maybe it's the problem ?
>=20
>=20
>=20
> thanks
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> The Firewall is a Red-Hat
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

--=20
Paulo Ricardo Bruck
Consultor Linux
cel 011 9235-4327 tel 011 3596-4881/4882
http://www.contatogs.com.br
