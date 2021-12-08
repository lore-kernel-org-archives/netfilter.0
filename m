From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Wed, 8 Dec 2021 09:55:39 +0000 (GMT)
Message-ID: <a3b6fdcb-daca-53f4-2640-aef7d3258f77@jubileegroup.co.uk>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com> <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com> <4bc86df1-3971-7729-6a41-477262879b90@tootai.net> <742f7f1d-a182-c1a1-7f7e-788f51fb03fb@gmail.com>
 <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Netfilter list <netfilter@vger.kernel.org>

Hi there,

On Tue, 7 Dec 2021, Daniel wrote:

> myhandle=$(echo `$nft -sa list chain $1 $2 $3 |grep -F $4|grep -oP '(# handle ).*'`|cut -d " " -f 3)

To me, quite apart from the reliance on a bunch of system utilities
which I'd really prefer to avoid in an operation of this kind, that
looks unnecessarily complex and rather fragile.

This whole discussion suggests that something is missing from nft.

-- 

73,
Ged.
