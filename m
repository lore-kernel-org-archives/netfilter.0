From: Florian Westphal <fw@strlen.de>
Subject: Re: Found extra tables in nft ruleset
Date: Fri, 6 Mar 2020 14:08:00 +0100
Message-ID: <20200306130800.GN979@breakpoint.cc>
References: <bd9702b2-0c75-96ba-24b8-b8ad05c50813@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bd9702b2-0c75-96ba-24b8-b8ad05c50813@gmx.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lars =?iso-8859-15?Q?Nood=E9n?= <lars.nooden@gmx.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

Lars Nood=E9n <lars.nooden@gmx.com> wrote:
> It's looking like nft is creating some extra tables when I create a chain.
>=20
> Seen below, I can clear the ruleset and then create a table and only the
> table I created is in the otherwise empty ruleset.  However, if I add a
> chain to that table, then two unasked for tables get created, but
> perhaps not used.  I'm not sure if they are supposed to be there or if
> they should be used.

THey are not supposed to be there.

> Is this an error on my part?  If so what?

Run 'nft monitor' to figure out what adds them.
=20
