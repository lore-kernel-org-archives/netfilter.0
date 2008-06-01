From: Thomas Jacob <jacob@internet24.de>
Subject: Re: ip rule with fwmark trouble
Date: Sun, 1 Jun 2008 18:45:39 +0200
Message-ID: <20080601164538.GA5364@internet24.de>
References: <BAY122-W42B4A67BCAA87109B55011BEB80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BAY122-W42B4A67BCAA87109B55011BEB80@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Sun, Jun 01, 2008 at 09:19:40AM +0000, =E6=9D=8E=E4=BC=9F=E5=8D=8E w=
rote:
> but when i use iptables  add mark to out-traffic and use ip rule with=
 fwmark like this:
> iptables -t mangle -A PREROUTING -s SOME_IP -j MARK --set-mark 11
> ip rule add fwmark 11 table ISP2
>=20
> the SOME_IP computers can't access internet , what's wrong ? Does any=
one have hints ?QUW1=20

Maybe it's caused by rp_filter according to the following mail, if that
information is still valid:

http://lists.netfilter.org/pipermail/netfilter/2000-November/006089.htm=
l
=20
