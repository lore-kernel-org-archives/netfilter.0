From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: [Fwd: I do not understand !!!]
Date: Wed, 16 Jan 2008 14:34:39 +1300
Message-ID: <478D5F2F.1090001@treenet.co.nz>
References: <478B32B4.9090106@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478B32B4.9090106@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>

G=E1sp=E1r Lajos wrote:
> ANYONE ????

Hm, reads like a FW blocking all packet-based traffic the hard way to m=
e.

A few steps I'd recommend:
   - find a little F/W utility called 'ferm'
   - read its manual, demos, and find a full list of iptables targets
   - define the actions you want the router to perform
   - write the ferm.conf

AYJ

>=20
> Hi list,
>=20
> I have a bit complicated script.
> But I do not understand the following output of it.
>=20
> 1. ESTABLISHED packets without 0x100 or 0x200 mark ???
> 2. NEW packets without the 0x200 mark and without SYN ???
> 3. INVALID packets with SYN/ACK ??? (As a first packet maybe? Should =
I=20
> drop it?)
> 4. Connection that started from internal gets validated as WRONG_NEW=20
> (with a simple SYN)...
>=20
> Can anyone tell me how the conntrack system works in detail?
>=20
> Thanx
>=20
> Swifty
>=20
>=20
> Chain con_tcp (1 references)
> pkts bytes target     prot
>   0     0 INVALID    tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
>   0     0 INVALID    tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,U=
RG
>   0     0 INVALID    tcp  tcp flags:SYN,RST/SYN,RST
> 5224  209K INVALID    tcp  tcp flags:FIN,RST/FIN,RST
>   0     0 INVALID    tcp  tcp flags:FIN,SYN/FIN,SYN
> 2477  101K ACCEPT     all  ctstate RELATED
> 145K 7215K tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300 ctstate=20
> ESTABLISHED
> 11M 7920M ACCEPT     all  CONNMARK match 0x100/0x300 ctstate ESTABLIS=
HED
> 2880K 1666M ACCEPT     all  ctstate ESTABLISHED
> 272K   15M tcp_NEW    all  [goto] ctstate NEW
> 29796 2233K tcp_INV    all  [goto] ctstate INVALID
>   0     0 LOG        all  LOG level debug tcp-sequence tcp-options=20
> ip-options uid prefix `UNKNOWN:'
>   0     0 ACCEPT     all
> Chain tcp_NEW (1 references)
> pkts bytes target     prot
> 232K   13M tcp_NEW_1  tcp  [goto] tcp flags:FIN,SYN,RST,ACK/SYN CONNM=
ARK=20
> match 0x0/0x300
> 38579 2014K tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300
> 969  212K LOG        all  LOG level debug tcp-sequence tcp-options=20
> ip-options uid prefix `WRONG_NEW:'
> 969  212K ACCEPT     all
> Chain tcp_NEW_1 (1 references)
> pkts bytes target     prot
> 232K   13M CONNMARK   all  CONNMARK set 0x200/0x300
> 232K   13M RETURN     all
> Chain tcp_NEW_2 (3 references)
> pkts bytes target     prot
> 184K 9229K CONNMARK   all  CONNMARK set 0x100/0x300
> 184K 9229K ACCEPT     all
>=20
> Chain tcp_INV (1 references)
> pkts bytes target     prot
>   0     0 tcp_NEW_2  all  [goto] CONNMARK match 0x200/0x300
> 2148 85920 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/RST
> 24624  986K ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,ACK
>  86 15329 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/PSH,ACK
> 752 30110 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/RST,ACK
>  80  4088 ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/SYN,ACK
> 1507  289K ACCEPT     tcp  tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,=
ACK
> 599  822K INVALID    all
>=20
> And a few log:
>=20
> INVALID: IN=3Dppp0 OUT=3D MAC=3D SRC=3D189.11.239.248 DST=3DEXT_IP LE=
N=3D40 TOS=3D0x00=20
> PREC=3D0x00 TTL=3D51 ID=3D17760 PROTO=3DTCP SPT=3D50698 DPT=3D4492 SE=
Q=3D0=20
> ACK=3D3777589785 WINDOW=3D0 RES=3D0x00 ACK RST FIN URGP=3D0
>=20
> INVALID: IN=3Dppp0 OUT=3D MAC=3D SRC=3D78.149.78.12 DST=3DEXT_IP LEN=3D=
40 TOS=3D0x00=20
> PREC=3D0x00 TTL=3D48 ID=3D61449 PROTO=3DTCP SPT=3D57102 DPT=3D4495 SE=
Q=3D0=20
> ACK=3D1455119138 WINDOW=3D0 RES=3D0x00 ACK RST FIN URGP=3D0
>=20
> INVALID: IN=3Dppp0 OUT=3D MAC=3D SRC=3D189.11.239.248 DST=3DEXT_IP LE=
N=3D40 TOS=3D0x00=20
> PREC=3D0x00 TTL=3D51 ID=3D17770 PROTO=3DTCP SPT=3D50698 DPT=3D4492 SE=
Q=3D0=20
> ACK=3D3777589785 WINDOW=3D0 RES=3D0x00 ACK RST FIN URGP=3D0
>=20
> INVALID: IN=3Dppp0 OUT=3D MAC=3D SRC=3D78.149.78.12 DST=3DEXT_IP LEN=3D=
40 TOS=3D0x00=20
> PREC=3D0x00 TTL=3D48 ID=3D61457 PROTO=3DTCP SPT=3D57102 DPT=3D4495 SE=
Q=3D0=20
> ACK=3D1455119138 WINDOW=3D0 RES=3D0x00 ACK RST FIN URGP=3D0
>=20
> WRONG_NEW:IN=3Dbr1 OUT=3Dppp0 PHYSIN=3Dlan1 SRC=3DINT_IP DST=3D85.131=
=2E72.154=20
> LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D14307 DF PROTO=3DTCP S=
PT=3D4796=20
> DPT=3D52045 SEQ=3D4243195870 ACK=3D0 WINDOW=3D65535 RES=3D0x00 SYN UR=
GP=3D0 OPT=20
> (020405AC0103030001010402)
>=20
> WRONG_NEW:IN=3Dbr1 OUT=3Dppp0 PHYSIN=3Dlan1 SRC=3DINT_IP DST=3D84.3.2=
9.226 LEN=3D52=20
> TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D14322 DF PROTO=3DTCP SPT=3D4797=
 DPT=3D6881=20
> SEQ=3D2594461565 ACK=3D0 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0 OPT=20
> (020405AC0103030001010402)
>=20
> WRONG_NEW:IN=3Dbr1 OUT=3Dppp0 PHYSIN=3Dlan1 SRC=3DINT_IP DST=3D90.52.=
165.175=20
> LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D14323 DF PROTO=3DTCP S=
PT=3D4798=20
> DPT=3D50428 SEQ=3D2039438787 ACK=3D0 WINDOW=3D65535 RES=3D0x00 SYN UR=
GP=3D0 OPT=20
> (020405AC0103030001010402)
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Please use Squid 2.6STABLE17+ or 3.0STABLE1+
There are serious security advisories out on all earlier releases.
