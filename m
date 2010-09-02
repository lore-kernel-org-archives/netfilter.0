From: Giacomo Bernardi <mino@minux.it>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Thu, 2 Sep 2010 12:28:23 +0100
Message-ID: <AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
 <4C7D11F5.1010105@riverviewtech.net> <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
 <4C7D1F05.4050704@riverviewtech.net> <AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
 <20100901091426.216b1778@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100901091426.216b1778@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

> Here's the solution for your awkward scenario. It involves using
> kvm/qemu guests like in the diagram
> http://cat.piasta.pl/awkward_solution.jpeg

Thanks very much Marek (though I'm still struggling to understand how
it can work).

Using VMs would be a problem as the software application that needs to
address the device is just one, do you see any way of replicating your
solution without VMs (e.g. using bridges and "virtual" interfaces)?


-- 
Giacomo "mino" Bernardi
