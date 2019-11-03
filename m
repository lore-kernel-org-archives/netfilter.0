From: Florian Westphal <fw@strlen.de>
Subject: Re: ebtables dnat rule gets system frozen
Date: Sun, 3 Nov 2019 20:16:49 +0100
Message-ID: <20191103191649.GM876@breakpoint.cc>
References: <CAGnHSE=RxEesfAnzhHi+qteoWs1Mpc5BVWPn8zteEGqpTbgMeQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnHSE=RxEesfAnzhHi+qteoWs1Mpc5BVWPn8zteEGqpTbgMeQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Yan <tom.ty89@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Tom Yan <tom.ty89@gmail.com> wrote:
> Kernel version being 5.3.8, after adding a dnat rule (to the OUTPUT
> chain) with ebtables-nft in iptables 1.8.3, my system is frozen as
> soon as I ping anything. I couldn't catch anything with dmesg -w. Can
> anyone reproduce the same issue? I am on Arch Linux.

Yes, investigating.
