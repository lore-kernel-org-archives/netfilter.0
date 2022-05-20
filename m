From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: exclude named sets
Date: Fri, 20 May 2022 11:10:45 +0200
Message-ID: <87tu9kh8mi.fsf@alfa.kjonca>
References: <CAMsxNkTfGW+dhr32RYFxn1rdJDRCSBFms_fJa5UVhPb-Piad-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1653037847; bh=a6e51OvnDJzzHjHAoM7dgPt2FaiW+iWbr09DV+eU2Ek=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=g23LYkmfhBF1/UzdpUVMS8bRUdcr5kfH0r9WheiIKI2aWUtT9E5Lt4/8U2du4xfNS
         NZ43ymZFAVYmzbx8modoPJARnKEEIREk01vhKQE2ZsUo1/zXvahJjkFpNskP5qznJ5
         6PWfPmkMHKhD/u17iEEiJ2rOL7jZ7IFySf5xQozU=
In-Reply-To: <CAMsxNkTfGW+dhr32RYFxn1rdJDRCSBFms_fJa5UVhPb-Piad-w@mail.gmail.com>
        (Andrew Clark's message of "Fri, 20 May 2022 12:01:31 +0300")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Andrew Clark <andrewclarkii@gmail.com> writes:

> Thank you for your answer Kamil!
> Under words "not valid" I mean this:
>
> root@anvil:~# /usr/sbin/nft -f /etc/nftables.conf
> /etc/nftables.conf:113:48-48: Error: syntax error, unexpected @
>                 iifname $int_ifs ip daddr != { @stormwall, @akamai }
> meta l4proto tcp redirect to :9051
>                                                ^
And that is what I expected.

> root@anvil:~# vim /etc/nftables.conf
> root@anvil:~# /usr/sbin/nft -f /etc/nftables.conf
> /etc/nftables.conf:113:49-57: Error: unknown identifier 'stormwall'
>                 iifname $int_ifs ip daddr != { $stormwall, $akamai }
> meta l4proto tcp redirect to :9051
>                                                 ^^^^^^^^^
> Your proposal:
>
> iifname $int_ifs ip daddr != @akamai meta l4proto tcp redirect to :9051
>
> Also does not work.
And error message is ... ?
How you define these sets?
by
--8<---------------cut here---------------start------------->8---
define SIMPLE_SET = ...
--8<---------------cut here---------------end--------------->8---
or  as named set?

KJ

-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
