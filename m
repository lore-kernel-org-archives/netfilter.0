From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Ver 1.4.17 Error Appending Prerouting
Date: Wed, 06 Feb 2013 01:27:07 +0100
Message-ID: <5111A35B.9070106@plouf.fr.eu.org>
References: <CAJbW+rmxKmvLT_g8c7Aj1zCfmEH6M6g2gHPx6_xnMBR43JY_2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJbW+rmxKmvLT_g8c7Aj1zCfmEH6M6g2gHPx6_xnMBR43JY_2Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Roman Gelfand <rgelfand2@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Roman Gelfand a =E9crit :
>=20
> /usr/local/sbin/iptables -t tproxy -A PREROUTING -i wccp0 -p tcp -m
> tcp --dport 80 -j TPROXY --on-port 3228
> /usr/local/sbin/iptables -t tproxy -A PREROUTING -i wccp0 -p tcp -m
> tcp --dport 443 -j TPROXY --on-port 3229
>=20
> Why am I getting the following error:
>=20
> iptables v1.4.17: can't initialize iptables table `tproxy': Table doe=
s
> not exist (do you need to insmod?)

The message is self-explanatory : there is no such table "tproxy".

=46rom man iptables :
   TPROXY
       This target is only valid in the *mangle* table [...]
