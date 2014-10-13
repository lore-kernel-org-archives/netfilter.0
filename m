From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools[]: can't get kernel conntrack table
Date: Mon, 13 Oct 2014 19:42:08 +0200
Message-ID: <20141013174208.GA3980@salvia>
References: <CANNOT2BvZxngo7=OY8_vrHEVTuadqhSs3dL=oUSPZs+x+r4N3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANNOT2BvZxngo7=OY8_vrHEVTuadqhSs3dL=oUSPZs+x+r4N3g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Rapha=EBl?= Berlamont <raphael.berlamont@raphux.com>
Cc: netfilter@vger.kernel.org

On Mon, Oct 13, 2014 at 06:37:07PM +0200, Rapha=EBl Berlamont wrote:
> Hello list,
>=20
> I can't make conntrack-tool work on my system.
> Tried with vanilla kernels 2.6.39.4, 3.0.99, 3.6.11.
>=20
> I compiled/install those tools/libs :
> - libnetfilter_queue/libnetfilter_queue-1.0.2
> - libnfnetlink/libnfnetlink-1.0.1
> - libmnl-1.0.3
> - libnetfilter_cttimeout-1.0.0
> - libnetfilter_cthelper-1.0.0
> - libnetfilter_conntrack-1.0.4
> - conntrack-tools-1.4.2
>=20
> My kernel config is available here :
> http://pastebin.com/8tjVuRVT
>=20
> My conntrackd config :
> http://pastebin.com/wLZF3TZ9
>=20
> When I launch conntrackd, I have the following message in the log :
> -----
> [Mon Oct 13 16:49:20 2014] (pid=3D5388) [ERROR] can't get kernel conn=
track table

# CONFIG_NF_CT_NETLINK is not set

http://conntrack-tools.netfilter.org/manual.html#requirements

