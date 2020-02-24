From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Waiting until first release of NFTABLES
Date: Mon, 24 Feb 2020 11:58:38 +1100
Message-ID: <875zfwssw1.fsf@goll.lan>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> writes:

> I'm concerned that Centos 8 is using a pre-release version of
> nftables. I just did a system update, and found this as current:
>
> /etc/redhat-release:  CentOS Linux release 8.1.1911 (Core)
> $ nft -v:             nftables v0.9.0 (Fearless Fosdick)

You might want to look for other installed packages < 1.0.0:

    rpm -qa --qf '%{name} %{version}-%{release}\n' |
    sort --sort=version --key=2

It's... not uncommon. :-)
On my laptop, fully 20% of packages are below version 1.

> To ensure BGP-38 compliance upstream, I'll use the routing table
> extension that I have developed for NetworkManager, that I posted
> earlier, that null-routes all reserved netblocks.  (I'm not planning
> to incorporate the BOGON enhancement as suggested by others.)

I think you mean BCP-38:
https://tools.ietf.org/html/bcp38

> The following will appear in my /etc/sysctl.conf file, which turns on
> source filtering and logs martians.
>
>  net.ipv6.conf.all.disable_ipv6  = 1
>  net.ipv4.conf.all.rp_filter = 1
>  net.ipv4.conf.all.log_martians = 1
>
>  net.ipv6.conf.default.disable_ipv6 = 1
>  net.ipv4.conf.default.rp_filter = 1
>  net.ipv4.conf.default.log_martians = 1
>
> Yes, this means that I'm blocking all ipv6 for now.  I will reconsider
> as the 1.0 or later release version makes it to the CentOS 8
> distribution.

CentOS runs systemd, so rp_filter=1 (or =2 since v240) should be on by default:
https://github.com/systemd/systemd/blob/master/sysctl.d/50-default.conf

