From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 20:31:41 +0100
Message-ID: <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 20.12.22 um 20:00 schrieb ToddAndMargo:
> Hi All,
> 
> $ uname -r
> 6.0.12-300.fc37.x86_64
> 
> Since kernel 6.0.1,
>     /proc/sys/net/netfilter/nf_conntrack_helper
> has been removed.

the deprecation warning dates back many years

> This breaks passive ftp.
> 
> What do you guys do to work around the problem
iptables-nft -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
