From: =?UTF-8?Q?Luis_Mario_Niedas_Hern=C3=A1ndez?= <lmniedas@gmail.com>
Subject: HELP rules nftables conntrack works
Date: Thu, 17 Sep 2020 14:56:10 -0400
Message-ID: <CALtjan=mRON-wNz1Mevfs4JqF9uDDXxrXrSBY1G7DWAu3an8yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PiReGljEvZ9MoMO2KHSyx6RASQ0KsNJD4jM47aZN274=;
        b=Sx2b17JwDFHsTBmuDlzeDdoYyfIDedesBNii7Y3tId2Je6bIAkWWMIuPu8YP8/W0/b
         ydZ39FU6sXeoLvED5qK5Jz/mAb2UNFWkYL+66HRQW1IdJ9a+xamaGCMRjBtd5EmXmSP6
         bQOpQtOdxY4qyhtsEQS/HAywb3L1KUzikNmttN54+JW8F9A7S8EzdTc7mSJeNv9kuS3h
         iA99f4IAPQpJMUaWfMciA8nuTcYHNfeYxXPSQWuutzcnSh4M4gLAb2t3cYYd1EataCe4
         woVfzhOtPsbWSekF5LMSMXNNFzECyC3pT/yW9AdMAHtIu7tFOkRDwBnD71fqvxbwMEO2
         qIgg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>, =?UTF-8?Q?Lista_cubana_de_soporte_t=C3=A9cnico_en_Tecnologias_Libres?= <gutl-l@jovenclub.cu>

Hola. Necesito que me ayuden a comprender como funciona conntrack, sus
estados y como estos estan relacionados con las reglas en nftables.
Voy a mostrarles mi nftables.conf para que me puedan entender.
Hello. I need help to understand how works conntrack, it's state and
how this one is related with the rules in nftables. I will show you my
nftables.conf just so you can understand me.

#!/usr/sbin/nft -f

flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0; policy accept;
        iifname "lo" accept
        iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh counter
packets 21512 bytes 1833976 accept
        iifname "ens18" ip saddr 192.168.1.0/24 tcp dport 3128 counter
packets 1781072 bytes 216353018 accept
        iifname "ens19" ip saddr 201.220.211.68 tcp sport 3128 counter
packets 2995294 bytes 3960634157 accept
        iifname "ens19" udp sport domain counter packets 33955 bytes
3076365 accept
        iifname "ens19" tcp sport domain counter packets 0 bytes 0 accept
        iifname "ens19" tcp sport http counter packets 41966 bytes
68096526 accept
        iifname "ens19" tcp sport https counter packets 10348 bytes
6399161 accept
        icmp type { echo-reply, echo-request } counter packets 408
bytes 24692 limit rate 1/second accept
        icmp type { echo-reply, echo-request } counter packets 0 bytes 0 dr=
op
        iifname "ens18" ip saddr 192.168.1.0/24 udp dport ntp counter
packets 229 bytes 17404 accept
        iifname "ens19" ip saddr 201.220.222.146 udp sport ntp counter
packets 197 bytes 14972 accept
        iifname "ens19" ip saddr 201.220.222.91 tcp sport {
xmpp-client, 5223 } counter packets 0 bytes 0 accept
    }

    chain forward {
        type filter hook forward priority 0; policy drop;
    }

    chain output {
        type filter hook output priority 0; policy accept;
        oifname "lo" accept
        oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh counter
packets 16396 bytes 2435939 accept
        oifname "ens18" ip daddr 192.168.1.0/24 tcp sport 3128 counter
packets 2469407 bytes 4127574258 accept
        oifname "ens19" ip daddr 201.220.211.68 tcp dport 3128 counter
packets 2082185 bytes 250047659 accept
        oifname "ens19" tcp dport domain counter packets 0 bytes 0 accept
        oifname "ens19" udp dport domain counter packets 34127 bytes
2295099 accept
        oifname "ens19" tcp dport http counter packets 27180 bytes
1721552 accept
        oifname "ens19" tcp dport https counter packets 10387 bytes
2430969 accept
        icmp type { echo-reply, echo-request } counter packets 410
bytes 24808 limit rate 1/second accept
        icmp type { echo-reply, echo-request } counter packets 0 bytes 0 dr=
op
        oifname "ens18" ip daddr 192.168.1.0/24 udp sport ntp counter
packets 229 bytes 17404 accept
        oifname "ens19" ip daddr 201.220.222.146 udp dport ntp counter
packets 201 bytes 15204 accept
        oifname "ens19" ip daddr 201.220.222.91 tcp dport {
xmpp-client, 5223 } counter packets 0 bytes 0 accept
    }
}

table ip nat {
    chain postrouting {
        type nat hook postrouting priority 100; policy accept;
        oifname "ens19" ip saddr 192.168.1.1 udp dport 53 counter
packets 0 bytes 0  snat to 10.16.10.11

    }
}

Yo deseo permitir solo las conexiones que se hagan por el puerto ssh
que vengan desde mi red local (192.168.1.0) hacia mi
firewall(192.168.1.3). Entiendo que el primer paquete que mi servidor
vea, lo pondr=C3=A1 como NEW y que cuando mi servidor responda, se
establecer=C3=A1 la conexi=C3=B3n, y entonces el conntrack actualizar=C3=A1=
 la
conexi=C3=B3n establecida.

I  want to allow only the connection made by my lan
network(192.168.1.0) against to my firewall(192.168.1.3). I understand
that the first packet that my firewall sees, it's tagged  like a NEW
connection and when my server replies, then the connection will be
tagged like established.

Mi duda ser=C3=ADa: c=C3=B3mo implementar la reglas utilizando conntrack?
deber=C3=ADa de sustituir esta regla en la cadena input :
My dude will: How i can implement the rules using contrack states? I
should replace the following rule in the input chain

iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh counter packets
21512 bytes 1833976 accept
por::
for  :

iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh  ct state new,
established counter packets 21512 bytes 1833976 accept

o solo esta:
or only this one:

iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh  ct state new
counter packets 21512 bytes 1833976 accept

y en la cadena output entonces modificar esta regla:
and  in the output chain then i should modify this one rule:

oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh counter packets
16396 bytes 2435939 accept
por esta:
for this one:

oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh  ct state
established counter packets 16396 bytes 2435939 accept

La verdad no entiendo como implementar las reglas utilizando los
estados del conntrack, he le=C3=ADdo este link
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#STATEMAC=
HINE
y entiendo los estados de conntrack pero no s=C3=A9 como utilixzarlos. Pido
disculpas por el tiempo que vayan a dedicar a ayudarme. Espero poder
alg=C3=BAn d=C3=ADa devolver la ayuda recibida. Saludos.

Truly, I don't understand how I can make my rules using the contrack
states. I read this link:
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#STATEMAC=
HINE
and i understand the conntrack states concept, but i don't know how to
use it.I apologize for the time you are spending helping me. I hope
one day to return the help received. Regards








--=20
"El futuro tiene muchos nombres. Para los d=C3=A9biles es lo inalcanzable.
Para los temerosos, lo desconocido. Para los valientes es la
oportunidad"
Victor Hugo
