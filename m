From: Florian Westphal <fw@strlen.de>
Subject: Re: [MAINTENANCE] migrating git.netfilter.org
Date: Tue, 4 Feb 2020 16:38:34 +0100
Message-ID: <20200204153834.GI15904@breakpoint.cc>
References: <20200131105123.dldbsjzqe6akaefr@salvia>
 <fbd79f10-0e17-a46e-32f5-e079389ac1f6@riseup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fbd79f10-0e17-a46e-32f5-e079389ac1f6@riseup.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?Jos=E9_M=2E?= Guisado <guigom@riseup.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Jos=E9 M. Guisado <guigom@riseup.net> wrote:
> On 31/01/2020 11:51, Pablo Neira Ayuso wrote:
> > Hi,
> >=20
> > A few of our volunteers have been working hard to migrate
> > git.netfilter.org to a new server. The dns entry also has been updated
> > accordingly. Just let us know if you experience any troubles.
> >=20
> > Thanks.
>=20
> Great!
>=20
> https://git.netfilter.org/iptables/ has been showing "Repository seems
> to be empty" for a few hours but the git url
> (git://git.netfilter.org/iptables) is working fine.

Unfortunately I don't have access to the servers so I can't do anything
about this.

Most likely the permissions are not correct and changes to the repo
make it inaccessible to gitweb.
