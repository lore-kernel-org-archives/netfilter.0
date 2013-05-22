From: =?iso-8859-1?Q?Paulsberg_Andr=E9?= <Andre.Paulsberg@evry.com>
Subject: RE: IPTables - Going Stateless
Date: Wed, 22 May 2013 09:24:02 +0200
Message-ID: <ACBD9B315535B2489252E981FF05808602C2A0A034@EDBCL19EX001.edb.local>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello ,

Could you not turn on a logging statement before the REJECTS , then you=
 migth see in the log what is being blocked ?

-A INPUT -i $INTIF1 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j LO=
G --log-prefix "FW-DROP-TCP " --log-tcp-options --log-ip-options
-A INPUT -i $INTIF1 -p udp -m udp -j LOG --log-prefix "FW-DROP-UDP " --=
log-tcp-options --log-ip-options
-A INPUT -i $INTIF1 -p icmp -j LOG --log-prefix "FW-DROP-ICMP " --log-t=
cp-options --log-ip-options

-A OUTPUT -o $INTIF1 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j L=
OG --log-prefix "FW-DROP-TCP " --log-tcp-options --log-ip-options
-A OUTPUT -o $INTIF1 -p udp -m udp -j LOG --log-prefix "FW-DROP-UDP " -=
-log-tcp-options --log-ip-options
-A OUTPUT -o $INTIF1 -p icmp -j LOG --log-prefix "FW-DROP-ICMP " --log-=
tcp-options --log-ip-options

I would also check if some outgoing trafick is blocked like return pack=
ets from "--sport 22" ,
since they might come from "-i INTIF1" and not "-I LO" .
Might also be your SSH server needs dns / auth(ident) / icmp to work - =
but I guess logging will spot the trouble .


Best regards
Andr=E9 Paulsberg
Senior Network Engineer=20
Core Network
Operation, Network, Nordic Operations
andre.paulsberg@evry.com
M +47 xxx yyyyy

