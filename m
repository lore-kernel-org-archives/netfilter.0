From: Patrick McHardy <kaber@trash.net>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Fri, 06 Jun 2008 17:02:12 +0200
Message-ID: <48495174.30909@trash.net>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net> <4847F14D.5000806@trash.net> <484941F6.9080701@bringe.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <484941F6.9080701@bringe.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Cc: netfilter@vger.kernel.org

Thomas B=E4tzler wrote:
> Patrick McHardy wrote:
>> I guess you're seeing INVALID packets (from the view of conntrack)
>> and they're thus not NATed but delivered locally, causing a RST.
>> Does dropping -m state --state INVALID packets in PREROUTING make
>> any difference?
>=20
> I've tried that for a day, to no avail:
> ..
> My nat rules currently look like this:
>=20
> iptables -t nat -A PREROUTING -m state --state INVALID -j LOG
> iptables -t nat -A PREROUTING -m state --state INVALID -j DROP

These rules need to go in mangle, that nat table is only
traversed for the first packet of a connection.
