From: "Javi Legido" <javi@legido.com>
Subject: Re: Access from inside proxy to server with apache
Date: Mon, 22 Dec 2008 14:57:57 +0100
Message-ID: <22552e810812220557u6900cbc8ke7a1ec91f7140364@mail.gmail.com>
References: <22552e810812170530t79d02e5cieb363bb6afa61816@mail.gmail.com>
	 <49495841.9050601@chello.at>
	 <22552e810812180547k4759e365t8e2820dd62f2e50a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=6KYH0w/TId0QVGFZ0yO0hSB8FE3mL3tx/8xMncsFRJQ=;
        b=l1T2wx35k6VHi9jPKDB4xTo5Hm8KAaFEHIWVOcIZx7+rfCQXODrW9KofI4lHB/Fecd
         IFH9zGTWOr5Q/afYIhR5RgEAHi9JEM4p+8EtnL10Wwoufv6hjjNLuykK/AF0ip103jTl
         Zy3Sw9q7r4wWBYQiyZwaLzJc/ST894WF5dMxw=
In-Reply-To: <22552e810812180547k4759e365t8e2820dd62f2e50a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Once again:

I have this schema:

[B]

[Pc] (80) =3D> (80) [Proxy] =BF? =3D> (80) [Router] (80) =3D> (80) [Ser=
ver]

No matter          proxy_out_ip           192.168.1.1             192.1=
68.1.2

The router 'nats' port 80, 22, ... from outside to Server.

I can't access from Pc to Server (trying to display an http page from
the Apache server). I can access:

-From other pc not inside a proxy
-Via ssh from Pc to Server

If I 'shut down' iptables, I can access from Pc to Server

The /var/log/messge log:

Dec 22 14:30:55 servidor kernel: [117607.138711] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3450 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36562 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:30:55 servidor kernel: [117607.138753] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3451 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36562 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:30:55 servidor kernel: [117607.427453] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3452 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36564 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:30:56 servidor kernel: [117607.971455] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3453 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36565 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:30:57 servidor kernel: [117609.059455] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3454 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36566 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:30:59 servidor kernel: [117611.330798] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3455 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36567 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:31:03 servidor kernel: [117615.983963] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3456 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36568 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:31:12 servidor kernel: [117624.939056] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3457 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36569 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:31:29 servidor kernel: [117643.902748] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3458 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36570 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:32:04 servidor kernel: [117684.519431] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3462 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D36571 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:54 servidor kernel: [117808.239771] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3470 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30858 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:54 servidor kernel: [117808.239812] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3471 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30858 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:55 servidor kernel: [117808.511961] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3472 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30860 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:55 servidor kernel: [117809.276341] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3473 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30861 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:56 servidor kernel: [117810.537497] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3474 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30862 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:33:59 servidor kernel: [117813.014252] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3475 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30863 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:34:03 servidor kernel: [117818.310717] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3476 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30864 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:34:12 servidor kernel: [117828.414218] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3477 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30865 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:34:29 servidor kernel: [117848.339947] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3478 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30866 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492
Dec 22 14:35:04 servidor kernel: [117890.700795] INPUT_IN=3Deth0 OUT=3D
MAC=3D192_168_1_2_MAC:00:01:38:da:5c:e9:08:00 SRC=3D192.168.1.1
DST=3D192.168.1.2 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D3480 P=
ROTO=3DICMP
TYPE=3D3 CODE=3D4 [SRC=3D192.168.1.2 DST=3Dproxy_out_ip LEN=3D1500 TOS=3D=
0x00
PREC=3D0x00 TTL=3D63 ID=3D30867 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] M=
TU=3D1492

The iptables -S config:

-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-A INPUT -s proxy_out_ip/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s proxy_out_ip/32 -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --sport 80 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 4080 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 4080 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 21 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --sport 23 -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j LOG --log-prefix "INPUT_"
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -p tcp -m tcp --dport 9999 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 6882 -j ACCEPT
-A FORWARD -p udp -m udp --dport 5865 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 5865 -j ACCEPT
-A FORWARD -p udp -m udp --dport 8443 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 8443 -j ACCEPT
-A FORWARD -p udp -m udp --dport 4666 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 4662 -j ACCEPT
-A FORWARD -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
-A FORWARD -j LOG --log-prefix "FORWARD"
-A FORWARD -j REJECT --reject-with icmp-port-unreachable
-A OUTPUT -o lo -j ACCEPT

Can someone tell me how to 'open' iptables to get access from Pc (port
80) to Server (port 80)?

Thanks


On 18/12/2008, Javi Legido <javi@legido.com> wrote:
>>>you say traffic on port 80 is redirected. how?
>
> [A]
>
> [Pc] (80) =3D> (80) [Router] (80) =3D> (80) [Server]
>
> The router does NAT. I repeat: if i quit iptables, all works fine,
> then I assume router NAT works
>
>>> also if the destination address is changed by nat, the packets get =
routed
>>> over the other
>>> interface.
>>> that is why you need to allow the traffic in the FORWARD chain.
>>> i do not see any of those in your rules above.
>
> I added (without success) the following rule:
>
> -A FORWARD -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
>
> ------------------------------------------
>
> The trouble continues: from inside a proxy, I can't access to the
> Apache server (I can access, for instance, via ssh). If I quit
> iptables, all works fine
>
> Thanks for your interest.
>
> Javier
>
>
>
> On 17/12/2008, Mart Frauenlob <mart.frauenlob@chello.at> wrote:
>> Javi Legido wrote:
>>> Hi.
>>>
>>> I have the following schema:
>>>
>>> [A]
>>>
>>> [Pc] (80) =3D> (80) [Router] (80) =3D> (80) [Server]
>>>
>>> [B]
>>>
>>> [Pc] (80) =3D> (80) [Proxy] =BF? =3D> (80) [Router] (80) =3D> (80) =
[Server]
>>>
>>> More data:
>>>
>>> -The server has iptables and Apache
>>> -The router has port 80 tcp redirected to the server
>>>
>>> Troubleshooting:
>>>
>>> -When I 'switch on' iptables, schema [B] fails (schema [A] always w=
orks
>>> fine)
>>> -When I 'switch off' iptables, schema [B] works fine
>>>
>>> The output:
>>>
>>> ************************ iptables -S ***************************
>>>
>>> -P INPUT ACCEPT
>>> -P FORWARD ACCEPT
>>> -P OUTPUT ACCEPT
>>> -A INPUT -s public_ip_1/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCE=
PT
>>> -A INPUT -s public_ip_1/32 -i eth0 -p tcp -m tcp --dport 443 -j ACC=
EPT
>>> -A INPUT -s 192.168.1.31/32 -i eth0 -p tcp -m tcp --dport 22 -j ACC=
EPT
>>> -A INPUT -s 192.168.1.30/32 -i eth0 -p tcp -m tcp --dport 22 -j ACC=
EPT
>>> -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
>>> -A INPUT -i eth0 -p tcp -m tcp --sport 80 -j ACCEPT
>>> -A INPUT -i eth0 -p tcp -m tcp --dport 4080 -j ACCEPT
>>> -A INPUT -i eth0 -p udp -m udp --dport 4080 -j ACCEPT
>>> -A INPUT -i eth0 -p tcp -m tcp --dport 21 -j ACCEPT
>>> -A INPUT -i eth0 -p udp -m udp --dport 21 -j ACCEPT
>>> -A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
>>> -A INPUT -i eth0 -p tcp -m tcp --sport 23 -j ACCEPT
>>> -A INPUT -i lo -j ACCEPT
>>> -A INPUT -j LOG --log-prefix "INPUT_"
>>> -A INPUT -j REJECT --reject-with icmp-port-unreachable
>>> -A FORWARD -p tcp -m tcp --dport 9999 -j ACCEPT
>>> -A FORWARD -p tcp -m tcp --dport 6882 -j ACCEPT
>>> -A FORWARD -p udp -m udp --dport 5865 -j ACCEPT
>>> -A FORWARD -p tcp -m tcp --dport 5865 -j ACCEPT
>>> -A FORWARD -p udp -m udp --dport 8443 -j ACCEPT
>>> -A FORWARD -p tcp -m tcp --dport 8443 -j ACCEPT
>>> -A FORWARD -p udp -m udp --dport 4666 -j ACCEPT
>>> -A FORWARD -p tcp -m tcp --dport 4662 -j ACCEPT
>>> -A FORWARD -j LOG --log-prefix "FORWARD"
>>> -A FORWARD -j REJECT --reject-with icmp-port-unreachable
>>> -A OUTPUT -o lo -j ACCEPT
>>>
>>> ******************** /var/log/messages ****************************
>>>
>>> Dec 17 12:32:24 servidor kernel: [1120947.846431] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D56
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D155 ID=3D31428 PROTO=3DICMP TYPE=3D3 C=
ODE=3D4
>>> [SRC=3D192.168.1.2 DST=3Dpublic_ip_1 LEN=3D1500 TOS=3D0x00 PREC=3D0=
x00 TTL=3D63
>>> ID=3D16093 DF PROTO=3DTCP INCOMPLETE [8 bytes] ] MTU=3D1492
>>> Dec 17 12:32:54 servidor kernel: [1120979.925513] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:32:57 servidor kernel: [1120983.069334] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:32:57 servidor kernel: [1120983.693341] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:33:03 servidor kernel: [1120989.596154] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:33:03 servidor kernel: [1120990.224560] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:33:15 servidor kernel: [1121001.913149] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:33:15 servidor kernel: [1121002.550066] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3Dpublic_ip_2 DST=3D192.168.1=
=2E2 LEN=3D60
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PROTO=3DTCP SPT=3D4242 DP=
T=3D56202
>>> WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
>>> Dec 17 12:33:45 servidor kernel: [1121033.566738] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31434 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D1
>>> Dec 17 12:33:46 servidor kernel: [1121034.571848] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31435 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D2
>>> Dec 17 12:33:47 servidor kernel: [1121035.592819] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31436 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D3
>>> Dec 17 12:33:48 servidor kernel: [1121036.789595] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31437 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D4
>>> Dec 17 12:33:49 servidor kernel: [1121037.817587] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31438 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D5
>>> Dec 17 12:33:50 servidor kernel: [1121038.945584] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31439 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D6
>>> Dec 17 12:33:51 servidor kernel: [1121039.974620] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31440 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D7
>>> Dec 17 12:33:52 servidor kernel: [1121040.974610] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31441 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D8
>>> Dec 17 12:33:53 servidor kernel: [1121041.978981] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31442 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D9
>>> Dec 17 12:33:54 servidor kernel: [1121042.991844] INPUT_IN=3Deth0 O=
UT=3D
>>> MAC=3Dmac_server:mac_client:08:00 SRC=3D192.168.1.1 DST=3D192.168.1=
=2E2 LEN=3D84
>>> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D31443 PROTO=3DICMP TYPE=3D0 C=
ODE=3D0 ID=3D33569
>>> SEQ=3D10
>>>
>>> **************************************** end
>>> *******************************************+
>>>
>>> Notice there are 2 different ip's: public_ip_2 and public_ip_1. May=
be
>>> there is the key...
>>>
>>> Can anybody helps me to make iptables let pass the traffic to the s=
chema
>>> [B]?
>>>
>>> PD: I tested two simillar schemas [b]: two machines from inside a
>>> proxy, and the two machines failed to connect to server.
>>>
>>> Thanks in advice.
>>>
>>> Javier
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>> hello,
>>
>> you say traffic on port 80 is redirected. how?
>> i do not see any DNAT rules.
>> also if the destination address is changed by nat, the packets get
>> routed over the other interface.
>> that is why you need to allow the traffic in the FORWARD chain.
>> i do not see any of those in your rules above.
>> if i understand it correctly and you have two external interfaces on=
 the
>> router, there are no rules either.
>> and with two external interfaces your routing could come into accoun=
t.
>> but you did not provide any
>> information about that.
>>
>> greets
>>
>> mart
>>
>>
>
