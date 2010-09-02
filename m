From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same
 ip/subnet.
Date: Thu, 2 Sep 2010 17:56:25 +0200
Message-ID: <20100902175625.2126d7d3@catus>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
	<4C7D11F5.1010105@riverviewtech.net>
	<AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
	<4C7D1F05.4050704@riverviewtech.net>
	<AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
	<20100901091426.216b1778@catus>
	<AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giacomo Bernardi <mino@minux.it>, netfilter@vger.kernel.org

Hi,

>Using VMs would be a problem as the software application that needs to
>address the device is just one, do you see any way of replicating your
>solution without VMs (e.g. using bridges and "virtual" interfaces)?

The sole purpose of the virtual guests in this solution is limited to
providing three isolated network stacks that can communicate with the
same ip unhindered. It's also achievable (and definitely less
cumbersome) using kernel namespaces - part of lxc [1].

If your software on host system can work with three
different device addresses (10.1.0.3, 10.2.0.3, 10.3.0.3), then you'd
need one instance of the application on host system.

If for some reason application is hardcoded to use 10.0.0.1 for device
access, then my solution won't do you any good :(.

Best regards,
Marek

[1]http://lxc.sourceforge.net/index.php/about/kernel-namespaces/network/
