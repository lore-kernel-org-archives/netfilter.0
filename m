From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables and connection tracking
Date: Thu, 2 Jul 2020 00:48:20 +0200
Message-ID: <20200701224820.GA29407@breakpoint.cc>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc>
 <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc>
 <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc>
 <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?iso-8859-15?Q?Gre=A8ko?= <mgresko8@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Marek Gre=A8ko <mgresko8@gmail.com> wrote:
> please is it a bug the rules did not work in the raw table or was it
> my configuration error?

Config error.

> How is it possible that using iptables-nft the rules are added to the
> raw table and it is working?

iptables-nft and fntables are not the same.
-j CT works with 'connection tracking templates',
but the nft equivalent sets the helper directly.

So, for iptables (and iptables-nft), the rule needs to be
executed before conntrack lookup.  With nft it has to be done
after conntrack lookup.
