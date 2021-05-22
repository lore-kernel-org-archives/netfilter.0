From: Florian Westphal <fw@strlen.de>
Subject: Re: libnetfilter_conntrack: ABI breakage error
Date: Sat, 22 May 2021 13:14:51 +0200
Message-ID: <20210522111451.GE3559@breakpoint.cc>
References: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
 <20210521215632.GA3619@salvia>
 <CAFqmWq_rRH8_XydrUdFgmG0kYe1+xXJucp7XZbEows5DE=qxbg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqmWq_rRH8_XydrUdFgmG0kYe1+xXJucp7XZbEows5DE=qxbg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy 22 <psyspy2020@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Psyspy 22 <psyspy2020@gmail.com> wrote:
> Hello Pablo,
> 
> I cross compiled the application. Host/Build: Ubuntu 20,10, x86_64.
> Target machine: aarch64, Linux kernel: 4.1.

4.1?  There is no synproxy support in that version.

Are you passing unitialised garbage data to the library by mistake?
