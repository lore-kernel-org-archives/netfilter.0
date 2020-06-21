From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables and connection tracking
Date: Sun, 21 Jun 2020 12:45:16 +0200
Message-ID: <20200621104516.GM26990@breakpoint.cc>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc>
 <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc>
 <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?iso-8859-15?Q?Gre=A8ko?= <mgresko8@gmail.com>
Cc: netfilter@vger.kernel.org

Marek Gre=A8ko <mgresko8@gmail.com> wrote:
> Hello,
>=20
> unfortunately the helper is not there:
>=20
> conntrack -L | grep sip                     -> no output
>=20
> It is strange, that if I use iptables-nft it is working. Some userspace p=
roblem?

No, looks more like a kernel bug to me, I will have a look on
Monday.

In mean time, you can work around this bug by removing the entire "ip
raw" / "ct set" stuff.

and then use:
sysctl net.netfilter.nf_conntrack_helper=3D1

to re-enable the old auto-assign behaviour.
