From: Giacomo Bernardi <mino@minux.it>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Thu, 2 Sep 2010 17:54:46 +0100
Message-ID: <AANLkTinpOm77pqyffk436uUhX_an_q5-OE8hkDDbbiCJ@mail.gmail.com>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
 <4C7D11F5.1010105@riverviewtech.net> <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
 <4C7D1F05.4050704@riverviewtech.net> <AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
 <20100901091426.216b1778@catus> <AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
 <20100902175625.2126d7d3@catus> <AANLkTin96+ZfAjKmpcgqY+tcxNYYHoMGZz+8bsAb1R2W@mail.gmail.com>
 <20100902183430.03fb9ceb@catus> <AANLkTi=uKngWrWpxMQJjLP6qTkfsPay9E3+-CKk2+7NO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=uKngWrWpxMQJjLP6qTkfsPay9E3+-CKk2+7NO@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> The reason is you
> can have just one arpcache entry for 10.0.0.1. Correct me if I'm
> wrong. Anyone?

I may be wrong, but isn't arp per-interface?

root@host ~# arp -i eth0 -s 10.0.0.1 11:22:33:44:55:66
root@host ~# arp -i eth1 -s 10.0.0.1 11:22:33:44:55:66
root@host ~# arp -an
...
? (10.0.0.1) at 11:22:33:44:55:66 [ether] PERM on eth0
? (10.0.0.1) at 11:22:33:44:55:66 [ether] PERM on eth1



[sorry I forgot to cc the list]

--
Giacomo "mino" Bernardi
