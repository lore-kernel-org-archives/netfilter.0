From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Mon, 6 Feb 2012 23:12:20 -0600 (CST)
Message-ID: <16986089.2736.1328591540466.JavaMail.root@ixer.mx>
References: <13902251.2734.1328591255561.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <13902251.2734.1328591255561.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>----- Mensaje original -----
>De: "Andrew Beverley" <andy@andybev.com>
>Para: ehuerta@ixer.mx
>CC: netfilter@vger.kernel.org
>Enviados: S=C3=A1bado, 4 de Febrero 2012 13:58:32
>Asunto: Re: iptables udp 1195 MASQUERADE
>
>On Tue, 2012-01-24 at 17:34 -0600, Enrique Huerta de la Fuente wrote:
>> Hello
>>
>> I have OpenVPN (lan to lan)
>>
>> On site 1 (4 links)
>> - eth0 (LAN)
>> - eth1 (internet link)
>> - eth3 (enalce internet)
>> - ppp0 (internet link)
>> - Deafult gateway eth1
>>
>> On site 2 (3 links)
>> - eth0 (LAN)
>> - eth1 (internet link)
>> - ppp0 (internet link)
>> - Deafult gateway ppp0
>>
>> The eth3 interface (site 1) and the eth1 interface (site 2) are the
>> same supplier, the same mask.
>>
>> The VPN works with eth3 (site 1) <---> eth1 (site 2) and it works
>> great. We must not over because they are the same provider and does
>> not require the gateway.
>>
>> But if it fails any of the VPN link (eth3 o eth1), we need to change
>> links of VPN to ppp0 (site 1) <-----> ppp0 (site 2).
>>
>> Here's the problem!
>>
>> At site 1, the UPD packets should go out by ppp0 (the default gatewa=
y
>> is eth1). To do this:
>>
>> # Iptables-t nat-I POSTROUTING-p udp-m udp - dport 1195-o ppp0-j
>> MASQUERADE # Iptables-t mangle-I OUTPUT-p udp-m udp - dport 1195-j
>> MARK - set-mark 1
>
>Are you sure you've got this rule correct? Have you tried doing a LOG
>target to check that it is matching the packets that you would expect?
>
>>
>> So are the paths:
>>
>> # Ip rule ls
>> 0: from all lookup 255
>> 32757: from all fwmark 0x1 lookup infinitum
>> 32758: from 189.143.36.36 lookup infinitum
>> 32759: from 38.124.170.15 lookup bbs
>> 32766: from all lookup main
>>
>> # Ip route ls table infinitum
>> default via 189.143.36.36 dev ppp0
>>
>>
>> The problem is that no packets arrive from site 1 to the site 2. The
>> UDP packets arrive to site 1 from site 2
>>
>> I tested with port 22 (ssh) and it works.
>>
>> # Iptables-t nat-I POSTROUTING-m tcp-p tcp - dport 22-o ppp0-j
>> MASQUERADE # Iptables-t mangle-I OUTPUT-m tcp-p tcp - dport 22-j MAR=
K
>> - set-mark 1
>>
>>
>> Any idea why that no UDP packets arrive to site 2?
>>
>> regards
>>
>> E.Huerta
>> -- To unsubscribe from this list: send the line "unsubscribe
>> netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html


Hello Andrew, thank you for the attention.

I doing a log target to check the rule in each of the OUTPUT hooks (raw=
, mangle, nat and filter) and POSTROUTING hooks (mangle and nat).


kernel: OUTPUT-22-RAW: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D189.189=
=2E5.2 LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D17619 DF PROTO=3DT=
CP SPT=3D47664 DPT=3D22 WINDOW=3D501 RES=3D0x00 ACK URGP=3D0=20
kernel: OUTPUT-1195-RAW: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D189.1=
89.5.2 LEN=3D304 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP =
SPT=3D1195 DPT=3D1195 LEN=3D284=20

kernel: OUTPUT-22-MANGLE: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D189.=
189.5.2 LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D18917 DF PROTO=3D=
TCP SPT=3D47664 DPT=3D22 WINDOW=3D501 RES=3D0x00 ACK URGP=3D0=20
kernel: OUTPUT-1195-MANGLE: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D18=
9.189.5.2 LEN=3D416 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DU=
DP SPT=3D1195 DPT=3D1195 LEN=3D396=20

kernel: OUTPUT-22-FILTER: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D189.=
189.5.2 LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D19177 DF PROTO=3D=
TCP SPT=3D47664 DPT=3D22 WINDOW=3D501 RES=3D0x00 ACK URGP=3D0=20
kernel: OUTPUT-1195-FILTER: IN=3D OUT=3Deth1 SRC=3D201.15.40.9 DST=3D18=
9.189.5.2 LEN=3D128 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DU=
DP SPT=3D1195 DPT=3D1195 LEN=3D108=20

kernel: POSTROUTING-22-MANGLE: IN=3D OUT=3Dppp0 SRC=3D201.15.40.9 DST=3D=
189.189.5.2 LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D19543 DF PROT=
O=3DTCP SPT=3D47664 DPT=3D22 WINDOW=3D501 RES=3D0x00 ACK URGP=3D0=20
kernel: POSTROUTING-1195-MANGLE: IN=3D OUT=3Dppp0 SRC=3D201.15.40.9 DST=
=3D189.189.5.2 LEN=3D160 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROT=
O=3DUDP SPT=3D1195 DPT=3D1195 LEN=3D140=20

In the out and POSTROUTING hooks in the NAT table, i can not do log.

In the last log, the output interface is already changing, but did not =
change the source address.

Apply the rule: "iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE",=
 this masks the port 22 (tcp) but not the 1195 (udp), because I can con=
nect via ssh.

It seems the problem is that does not mask the port 1195 (udp).

Any idea?

regards

E.Huerta


=20







=20
