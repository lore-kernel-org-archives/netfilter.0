From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: [ANNOUNCE] ipset-2.3.3
Date: Mon, 21 Jul 2008 18:35:25 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0807211828380.17282@mail3.jubileegroup.co.uk>
References: <Pine.LNX.4.64.0807192259320.24664@blackhole.kfki.hu>
 <Pine.LNX.4.58.0807201524360.8513@mail3.jubileegroup.co.uk>
 <Pine.LNX.4.64.0807201824590.25442@blackhole.kfki.hu>
 <Pine.LNX.4.58.0807210815530.30128@mail3.jubileegroup.co.uk>
 <Pine.LNX.4.64.0807211633550.26314@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807211633550.26314@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi Jozsef,

On Mon, 21 Jul 2008, Jozsef Kadlecsik wrote:

> On Mon, 21 Jul 2008, G.W. Haywood wrote:
>
> > Is there any chance of being able to compile a non-modular 2.4 kernel
> > with the released ipsets, or am I on my own with that?
>
> With ipset-2.3.3a you should be able to compile a non-modular kernel.
> I.e. you can configure the features of the patched kernel as you want and
> it should be compiled cleanly.

Bless my soul, so it does!  It might be worth making an adjustment in the
README, it seems to imply that only 2.6 kernels can be compiled non-modular.
I had tried anyway, with 2.4.36.6 and 2.3.3, but of course it failed - and I
didn't try again with 2.3.3a. :(

Thanks very much. :)

--

73,
Ged.
