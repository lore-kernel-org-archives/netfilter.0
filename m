From: Florian Westphal <fw@strlen.de>
Subject: Re: Why inet table doesn't support nat prerouting chain?
Date: Fri, 6 Mar 2020 12:37:34 +0100
Message-ID: <20200306113734.GM979@breakpoint.cc>
References: <DF324CE0-08D5-4041-9761-D7F740979715@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DF324CE0-08D5-4041-9761-D7F740979715@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

Glen Huang <heyhgl@gmail.com> wrote:
> Hi,
>=20
> It seems I can create a nat prerouting chain in either ip or ip6 table, b=
ut not inet, I wonder if that=E2=80=99s by design?

Kernel too old? Should work as of 5.2.
