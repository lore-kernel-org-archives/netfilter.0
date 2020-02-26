From: Laura Garcia <nevola@gmail.com>
Subject: Re: loadbalance with 2 or more links
Date: Wed, 26 Feb 2020 09:08:04 +0100
Message-ID: <CAF90-Wh5SaSfCoQWC+ejThQCdr_YqVxN9Lqy58M5o98owkgkBQ@mail.gmail.com>
References: <825530945.480.1582660778781.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=li4g8HobUyyZBEYDapp4vKwW6NdFVLFADPtkExNCOAE=;
        b=m8tJa3sAjslmp7dn6cnWfi+K6ufZhDYtayvENyFW1Z+pQTfpq/bzOM2PyDgHBvKEy7
         VeEzchGDpuNvn6CBYGqLZUXhTjdBV5RNRPRiuC9ioHq6uAveBYLqjEOW3SgbOwkr0FZj
         Mjj9FlIVZpmDD3IXKHJ6jbjG3DrM4cmo4IXzHNlrs+JrJUu78c0FbPV+4wUAMpQ9wAc7
         R+dMGCthErqoP9N5zGhkUZX6cmNEfUt8MggidWbIcgEURVZCiCgwEa0M6Gq8kCvF7L6x
         9Utrod0pFtaE08qbBvVnalSqOUKwshLs/erOR5GVUBpPMzai4gsxVb8qqQE9v5tg6+uM
         gJog==
In-Reply-To: <825530945.480.1582660778781.JavaMail.zimbra@contatogs.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pauloric@contatogs.com.br
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Feb 25, 2020 at 9:03 PM <pauloric@contatogs.com.br> wrote:
>
> Hi
>
> I have been working with iptables and now I'm  migrating to nftables ( BTW really nice job netfilter team 80)  ).
>
> I have been using http://fatihusta.com/2015/03/07/network/linux-wan-load-balancing/  since nexthop is not working for a long time.
>
> Studing nftables wiki I found 2 solutions:
>
>
> a) nftbl   https://github.com/zevenet/nftlb
>
> nftbl looks like very good, but very complex for a single load balance solution.
>
> or
>
> b) nftables + nat/loadbalance  https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
>
> 98% is ok using iptables-restore-translate as example.
>

Both uses the same techniques, mainly for load balance services but
probably you could use it for uplinks load balancing as well if you
isolate the network interfaces to each router and put the load
balancer as the default GW in your LAN.

>
> As I've been using  iptables + mangle + iproute, what is easiest solution to use with 2 or more links ??
>

We've been using iproute for load balancing uplinks, but it shouldn't
be difficult to add it in nftlb as well.

Cheers.
