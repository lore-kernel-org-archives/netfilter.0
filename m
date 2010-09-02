From: Giacomo Bernardi <mino@minux.it>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Thu, 2 Sep 2010 17:05:30 +0100
Message-ID: <AANLkTin96+ZfAjKmpcgqY+tcxNYYHoMGZz+8bsAb1R2W@mail.gmail.com>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
 <4C7D11F5.1010105@riverviewtech.net> <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
 <4C7D1F05.4050704@riverviewtech.net> <AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
 <20100901091426.216b1778@catus> <AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
 <20100902175625.2126d7d3@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100902175625.2126d7d3@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks for all your ideas...

> The sole purpose of the virtual guests in this solution is limited to
> providing three isolated network stacks that can communicate with the
> same ip unhindered. It's also achievable (and definitely less
> cumbersome) using kernel namespaces - part of lxc [1].

I'll have a look at lxc.

Anyway, conceptually the whole problem look very simple to me...
Ideally, I'd just need to apply the following pseudo-code that
overwrites the IP fields... isn't there a simple way to do this trick
with netfilter&c.?


// OUTPUT:

if(dst_ip == 10.1.0.1) {
	rewrite dst_ip to 10.0.0.1
	rewrite src_ip to 10.0.0.2
	output on interface eth1
}
if(dst_ip == 10.2.0.1) {
	rewrite dst_ip to 10.0.0.1
	rewrite src_ip to 10.0.0.2
	output on interface eth2
}
if(dst_ip == 10.3.0.1) {
	rewrite dst_ip to 10.0.0.1
	rewrite src_ip to 10.0.0.2
	output on interface eth3
}

// INPUT:

if(input_interface == eth1 && src_ip == 10.0.0.1) {
	rewrite src_ip to 10.1.0.1
	rewrite dst_ip to 10.1.0.2
}
if(input_interface == eth2 && src_ip == 10.0.0.1) {
	rewrite src_ip to 10.2.0.1
	rewrite dst_ip to 10.2.0.2
}
if(input_interface == eth3 && src_ip == 10.0.0.1) {
	rewrite src_ip to 10.3.0.1
	rewrite dst_ip to 10.3.0.2
}



-- 
Giacomo "mino" Bernardi
