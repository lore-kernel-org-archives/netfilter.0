From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: end iptables support
Date: Sat, 3 Oct 2020 14:58:26 +0200
Message-ID: <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net>
References: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>, netfilter@vger.kernel.org



Am 03.10.20 um 07:40 schrieb Emilio Augusto Lazo Zaia:
> When is supposed to be dropped the iptables support in Linux kernel in favor of nft? Currently I'm using iptables in many servers!

in 99% of all cases with a recent distribution you can just switch to
iptables-nft and are done

at boot (it can restore iptables-legacy rules):
/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables

after that:
alternatives --config iptables
alternatives --config arptables
alternatives --config ebtables

switch to nft backend and now your well known "iptables" commands will
use the "nft" backend behind the scenes

done that months ago on all Fedora 31 servers here while iptables-nft is
the default starting with Fedora 32

