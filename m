From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: block packet by size
Date: Wed, 8 Oct 2008 20:19:52 +0200
Message-ID: <20081008181952.GA21177@outback.rfc2324.org>
References: <98f5d92c0810080921t6232cebai52c6128cf655e731@mail.gmail.com> <20081008165852.GA25766@khasse.inl.fr> <98f5d92c0810081003p67913c73tf89e93147b4d3bef@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98f5d92c0810081003p67913c73tf89e93147b4d3bef@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2008 Servers 4you scripsit:

> 2008/10/8 Eric Leblond <eric@inl.fr>:

> > man iptables :
> >
> >   length
> >          This module matches the length of the layer-3 payload (e.g.
                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          layer-4 packet) f a packet against a specific value or range
> >          of values.
> >
> >   [!] --length length[:length]

> yes i try see man page, but they dont explain if the size its: the
> full packet size or the data part.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> i have a packet with diffent total size (becouse the header change)
> but always with 14bytes on data.

Which parts of the header changes in your setup?
What do you in general want to accomplish?

Ciao
Max
-- 
	Follow the white penguin.
