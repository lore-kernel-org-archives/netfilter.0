From: =?ISO-8859-1?Q?J=F6rg_L=FCbbert?= <j.luebbert@login-lanstation.de>
Subject: Re: Policy Routing with fwmark and iptables -j MARK
Date: Sun, 25 Nov 2007 14:28:09 +0100
Message-ID: <47497869.4000901@login-lanstation.de>
References: <62183.64.81.58.143.1195982779.squirrel@calmail.berkeley.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <62183.64.81.58.143.1195982779.squirrel@calmail.berkeley.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

You might probably run into trouble with your MARK approach there as it=
=20
won't be able to correctly track connections which are related to other=
=20
connections. Ie. FTP-Data.

You'll need to rely on connmark for such situation.

$IPTABLES -A PREROUTING -t mangle -j CONNMARK --restore-mark

$IPTABLES -t mangle -A PREROUTING -p tcp -m multiport \
--dport $PORT_LIST -m statistic --mode random --probability .5 \
-m connmark ! --mark 0/0 \
-j MARK --set-mark 0x60000000

$IPTABLES -t mangle -A PREROUTING -p tcp -m multiport \
-m connmark ! --mark 0/0 \
--dport $PORT_LIST -j MARK --set-mark 0x50000000

$IPTABLES -A PREROUTING -t mangle -j CONNMARK --save-mark

As for your L7 case, I'd need some more input there. Can you give a mor=
e=20
detailled description please? You don't want to use it as part of the=20
routing decission, do you? (that wouldn't work)


- J=F6rg
