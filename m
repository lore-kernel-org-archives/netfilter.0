From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Access from inside proxy to server with apache
Date: Wed, 17 Dec 2008 20:51:29 +0100
Message-ID: <49495841.9050601@chello.at>
References: <22552e810812170530t79d02e5cieb363bb6afa61816@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <22552e810812170530t79d02e5cieb363bb6afa61816@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Javi Legido <javi@legido.com>

Javi Legido wrote:
> Hi.
>
> I have the following schema:
>
> [A]
>
> [Pc] (80) =3D> (80) [Router] (80) =3D> (80) [Server]
>
> [B]
>
> [Pc] (80) =3D> (80) [Proxy] =BF? =3D> (80) [Router] (80) =3D> (80) [S=
erver]
>
> More data:
>
> -The server has iptables and Apache
> -The router has port 80 tcp redirected to the server
>
> Troubleshooting:
>
> -When I 'switch on' iptables, schema [B] fails (schema [A] always wor=
ks fine)
> -When I 'switch off' iptables, schema [B] works fine
>
> The output:
>
> ************************ iptables -S ***************************
>
> -P INPUT ACCEPT
> -P FORWARD ACCEPT
> -P OUTPUT ACCEPT
> -A INPUT -s public_ip_1/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -s public_ip_1/32 -i eth0 -p tcp -m tcp --dport 443 -j ACCEP=
T
> -A INPUT -s 192.168.1.31/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEP=
T
> -A INPUT -s 192.168.1.30/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEP=
T
> -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --sport 80 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --dport 4080 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --dport 4080 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --dport 21 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --dport 21 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --sport 23 -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -j LOG --log-prefix "INPUT_"
> -A INPUT -j REJECT --reject-with icmp-port-unreachable
> -A FORWARD -p tcp -m tcp --dport 9999 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 6882 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 5865 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 5865 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 8443 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 8443 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 4666 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 4662 -j ACCEPT
> -A FORWARD -j LOG --log-prefix "FORWARD"
> -A FORWARD -j REJECT --reject-with icmp-port-unreachable
> -A OUTPUT -o lo -j ACCEPT
>
> ******************** /var/log/messages ****************************
>
> Dec 17 12:32:24 servidor kernel: [1120947.846431] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D56
> TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D31428 PROTO=3DICMP TYPE=3D3 COD=
E=3D4
> [SRC=3D192.168.1.2 DST=3Dpublic_ip_1 LEN=3D1500 TOS=3D0x00 PREC=3D0x0=
0 TTL=3D63
> ID=3D16093 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] MTU=3D1492
> Dec 17 12:32:54 servidor kernel: [1120979.925513] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:32:57 servidor kernel: [1120983.069334] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:32:57 servidor kernel: [1120983.693341] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:33:03 servidor kernel: [1120989.596154] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:33:03 servidor kernel: [1120990.224560] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:33:15 servidor kernel: [1121001.913149] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:33:15 servidor kernel: [1121002.550066] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1.2=
 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DPT=3D=
56202
> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Dec 17 12:33:45 servidor kernel: [1121033.566738] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31434 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D1
> Dec 17 12:33:46 servidor kernel: [1121034.571848] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31435 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D2
> Dec 17 12:33:47 servidor kernel: [1121035.592819] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31436 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D3
> Dec 17 12:33:48 servidor kernel: [1121036.789595] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31437 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D4
> Dec 17 12:33:49 servidor kernel: [1121037.817587] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31438 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D5
> Dec 17 12:33:50 servidor kernel: [1121038.945584] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31439 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D6
> Dec 17 12:33:51 servidor kernel: [1121039.974620] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31440 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D7
> Dec 17 12:33:52 servidor kernel: [1121040.974610] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31441 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D8
> Dec 17 12:33:53 servidor kernel: [1121041.978981] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31442 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D9
> Dec 17 12:33:54 servidor kernel: [1121042.991844] INPUT_IN=3Deth0 OUT=
=3D
> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1.2=
 LEN=3D84
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31443 PROTO=3DICMP TYPE=3D0 COD=
E=3D0 ID=3D33569
> SEQ=3D10
>
> **************************************** end
> *******************************************+
>
> Notice there are 2 different ip's: public_ip_2 and public_ip_1. Maybe
> there is the key...
>
> Can anybody helps me to make iptables let pass the traffic to the sch=
ema [B]?
>
> PD: I tested two simillar schemas [b]: two machines from inside a
> proxy, and the two machines failed to connect to server.
>
> Thanks in advice.
>
> Javier
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20
hello,

you say traffic on port 80 is redirected. how?
i do not see any DNAT rules.
also if the destination address is changed by nat, the packets get=20
routed over the other interface.
that is why you need to allow the traffic in the FORWARD chain.
i do not see any of those in your rules above.
if i understand it correctly and you have two external interfaces on th=
e=20
router, there are no rules either.
and with two external interfaces your routing could come into account.=20
but you did not provide any
information about that.

greets

mart

