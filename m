From: Florian Westphal <fw@strlen.de>
Subject: Re: Assertion error when using map
Date: Sat, 4 Jan 2020 12:15:09 +0100
Message-ID: <20200104111509.GN795@breakpoint.cc>
References: <CABa6K_EvuX5EJNNxM+9aESFephAjhos9dmmNmGsZJvjEzHiupQ@mail.gmail.com>
 <20200102232529.GL795@breakpoint.cc>
 <CABa6K_FjRaPTh1Qf_PuudozzMYKfBToA6i2apx7Shfr4sND8Ww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABa6K_FjRaPTh1Qf_PuudozzMYKfBToA6i2apx7Shfr4sND8Ww@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Changli Gao <xiaosuo@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Changli Gao <xiaosuo@gmail.com> wrote:
> I know it is difficult. Do you have any plan to support this kind of
> features? Or, is there any way to work around this issue?

Yes, I think we should extend bitwise first, since that would make this
work:
src/nft -e -a --debug=netlink add rule inet filter input \
   ct mark set "ct mark & 0xffff0000 | meta mark & 0xffff"
inet filter input
  [ meta load mark => reg 2 ]
  [ bitwise reg 2 = (reg=2 & 0x0000ffff ) ^ 0x00000000 ]
  [ ct load mark => reg 1 ]
  [ bitwise reg 1 = (reg=1 & 0xffffffff ) ^ reg 2]
  [ ct set mark with reg 1 ]

As you can see I have netlink linearization part working, don't know yet
when I will start working on kernel part (or testing of this thing for
that matter ...).
