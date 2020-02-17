From: Haochen Tong <i@hexchain.org>
Subject: Re: nftables "native interface" for IPv6 NPT?
Date: Mon, 17 Feb 2020 20:37:40 +0100
Message-ID: <20200217193740.7gzgh32m2nsguip5@kotori.hexchain.org>
References: <8b2eff13-0857-08d8-9111-9be84b39db29@hexchain.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org; q=dns/txt;
 s=smtp; t=1581968263; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: To: From: Date: Sender;
 bh=IhiMp/MDhPaifKbffEscvPB8ROtELeNxkDU1astKKEI=; b=K2q5htRKdsZlYCD9oQ9d+s72XIZXmS3TxdHY+ehzvhM3pRjZmimgWD/Cdl0rcdaeA30sMl1f
 6hIIap4PD9DWQkNyHcdnRBZic010XlHqzCQ0zGUvvUQyHxxhJBS9TD1h6/69h693nFJx1qaS
 o3fbpsRqs0/V7jZ1Peu/FIn44rrYPzEi2OUNS2VH8y1C75BzMOi5VtREuXuZdnJFKcajG9k2
 WctPKlqnBwSpzU3KDSB7NkgaplYl0u/0vZIuKnridp9uCrnVM48o2WZxkY/rF5kHP+v9R/of
 kPu+obwunlLwrOBCYK9gtgU84H29QkDj18t5vbS3JyUJyehegWrz4Q==
Content-Disposition: inline
In-Reply-To: <8b2eff13-0857-08d8-9111-9be84b39db29@hexchain.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Feb 09, 2020 at 01:44:19AM +0100, Haochen Tong wrote:
> Hi,
> 
> While trying to implement IPv6 NPT with nftables I did not found any
> useful documentation. The wiki says "consider native interface", however
> I cannot find any reference to this "native interface".
> 
> Is this unsupported for now? Are there any workarounds?

I have hacked up something with nft, by applying bitwise arithmetic on
IP addresses and manually calculating the RFC6296 checksum for a single
/80 subnet (not necessarilly correct in the following example because IP
addresses are mangled for privacy reasons, but seems to work):

table ip6 npt {
        chain prerouting-dnpt {
                type filter hook prerouting priority mangle; policy accept;
                iif ens3 ip6 daddr 2001:da8:1400:57:a6fb::/80 ip6 daddr set ip6 daddr and ::ffff:ffff:ffff or 2001:da8:1234:5678:90ab:: notrack
        }
        chain postrouting-snpt {
                type filter hook postrouting priority mangle; policy accept;
                oif ens3 ip6 saddr 2001:da8:1234:5678:90ab::/80 ip6 daddr != 2001:da8:1234::/48 oif ens3 ip6 saddr set ip6 saddr and ::ffff:ffff:ffff or 2001:da8:1400:57:a6fb:: notrack
        }
}

However, the {S,D}NPT targets in iptables are able to calculate the checksum
automatically, for all subnets in a /64.

So, again, what is the preferred way to do NPT in nftables with "native
interfaces"? Is a new kernel module needed?

Thanks,
Haochen Tong
