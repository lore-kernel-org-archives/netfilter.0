From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: GRE protocol .
Date: Fri, 07 May 2010 00:00:48 +0200
Message-ID: <4BE33C10.9050707@plouf.fr.eu.org>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>	 <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>	 <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>	 <4BE2DAD7.1050802@plouf.fr.eu.org>	 <AANLkTilUsdhWBzhfGtwplySk6klKdR0VVectHILwx9f2@mail.gmail.com> <AANLkTim4Wew3a0-EecOW542_7XQwAp8roczTJC22DwpC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim4Wew3a0-EecOW542_7XQwAp8roczTJC22DwpC@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

ratheesh k a =E9crit :
>> On Thu, May 6, 2010 at 8:35 PM, Pascal Hambourg
>> <pascal.mail@plouf.fr.eu.org> wrote:
>> so you must know
>> that a GRE packet is RELATED to an existing PPTP connection.
>=20
> In my case , if first  GRE packet comes from PPTP server and get
> routed to my client machine , indicate that pptp_connection_tracking
> module is loaded ? { get ACCEPTed by    iptables  -A FORWARD -m state
> --state RELATED -j ACCEPT } .
> [ pptp helper  will install expectation tuple ? ]

This is what I would expect, though I have not tested.
