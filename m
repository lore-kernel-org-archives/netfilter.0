From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables multi-dimensional dictionaries
Date: Fri, 4 Sep 2015 16:44:21 +0200
Message-ID: <20150904144421.GA3711@salvia>
References: <DUB109-W834148D76D2B04B8469D05E1690@phx.gbl>
 <20150903163519.GA14100@salvia>
 <DUB109-W37CC9580BFB40296703618E1570@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DUB109-W37CC9580BFB40296703618E1570@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Chapman <ajchapman88@hotmail.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Sep 04, 2015 at 02:32:31PM +0100, Alex Chapman wrote:
> Hi Pablo,
>=20
> Thanks for the response. Do I need kernel 4.2 to support this? I'm on=
 4.1 currently and the command below is erroring:
>=20
> # nft add rule ip firewall forward =A0meta iif . meta oif vmap { eth0=
 . lo : jump test }
> <cmdline>:1:55-79: Error: Could not process rule: Invalid argument
> add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : j=
ump test }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^^^^^^^^^^^^^^^
> <cmdline>:1:55-79: Error: Could not process rule: No such file or dir=
ectory
> add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : j=
ump test }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^^^^^^^^^^^^^^^
> <cmdline>:1:1-79: Error: Could not process rule: No such file or dire=
ctory
> add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : j=
ump test }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
>=20
> (table named firewall and both 'forward' and 'test' chains configured=
).=A0

You need this oneliner fix:

http://git.kernel.org/cgit/linux/kernel/git/pablo/nf.git/commit/?id=3Db=
f798657eb5ba57552096843c315f096fdf9b715

It's on its way to 4.3-rc and will send to -stable 4.1 and 4.2 asap.
