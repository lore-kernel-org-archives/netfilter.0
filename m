From: Gio <gioflux@gmail.com>
Subject: Re: nftables character limits?
Date: Wed, 11 Jan 2023 21:04:51 -0500
Message-ID: <CADhidkpgNX81zBcUerSAe+9VKgTcNbi8e8TvqEguY948c-n54Q@mail.gmail.com>
References: <CADhidkqEE_Pud167s6-AXJ1rBuODQFkbDUUB+nCvDhFs805xkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNsuRYJLpsg4IDgsesfSPFlvZlletPtBFfxUkOrumDw=;
        b=J3FEspNb13ypkgFaHblQcNqXPxaANqNtyQBBCnR3ZQCyr5m6hR6CXjH2SLC2NWHwfg
         tBp00nGv+q4YbQKjGwSC793FohsxjQl3tO/fdxmBgFeHhvS6AqONrvhQZEIhwv29/8bR
         GO1HvPQsK0JrXlKy3wPtLdgJdhGxUVo7I6nSMBkfzG03fispNPP9ZG17uys+HhUI5SvN
         eOn76XS9eb64JTX7ZFB2H7wlY2xoKU6DXfjAOy/36KflyQAcVcQ/qxlrS3HW/JranSGt
         d4twT03+WRb4+l9edc+SPxugLG00sXHkxR+c45JFvsJidVB+X5ps+hMLaOpjuWQQjIEF
         21cQ==
In-Reply-To: <CADhidkqEE_Pud167s6-AXJ1rBuODQFkbDUUB+nCvDhFs805xkA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Circling back on this as I never heard back.

Looks like there is a hardcoding of "comment" limit to 127 characters
and also there cannot be multiple comment lines? Any reason for this
very small limit? could this be removed please? I'm using comments for
specific security references.

Here's a NFT config you can use to reproduce this bug (I don't
consider 127 char limit a feature):

table inet filter {
        chain input {
                 type filter hook input priority 0; policy drop;

                 # accept any localhost traffic
                 iif lo accept

                 # accept traffic originated from us
                 ct state established,related accept

                 # accept neighbour discovery otherwise IPv6 connectivity breaks
                 icmpv6 type { nd-neighbor-solicit, nd-router-advert,
nd-neighbor-advert } accept

        }
    chain root0 {
        comment "version:
KM3Xi-8BOkAvcGxhY2VyL3Byb2QvaG9tZS9zZWNvcHMtbmV0LWFjbC1wbGFjZXIvc25hcHNob3RzL3BhcnRpdGlvbj1zc2QvQgYIzMr7nQZKBgj9y_udBlIGCL7L-50GWgYIzMr7nQZqBgjpzvudBnIGCPXP-50GegYIy7v7nQaCAQYIuM37nQaKAQYIps_7nQaSAQYI58j7nQY="
        comment "Policy name: host"
        comment "Restrictions enabled"
}


----
error
root@nf:~# nft -f verb.nft
verb.nft:16:17-235: Error: comment too long, 128 characters maximum allowed
        comment "version:
KM3Xi-8BOkAvcGxhY2VyL3Byb2QvaG9tZS9zZWNvcHMtbmV0LWFjbC1wbGFjZXIvc25hcHNob3RzL3BhcnRpdGlvbj1zc2QvQgYIzMr7nQZKBgj9y_udBlIGCL7L-50GWgYIzMr7nQZqBgjpzvudBnIGCPXP-50GegYIy7v7nQaCAQYIuM37nQaKAQYIps_7nQaSAQYI58j7nQY="

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
verb.nft:18:9-38: Error: You can only specify this once. This
statement is duplicated.
        comment "Restrictions enabled"
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
verb.nft:20:1-1: Error: syntax error, unexpected end of file
}
^






On Thu, Dec 23, 2021 at 3:10 AM Gio <gioflux@gmail.com> wrote:
>
> I'm writing a script that converts firewall policies from one platform
> format to .nft format to use inside VMs.
>
> During conversion of data from one format to another I need to
> consider maximum character limits in fields like comments, chain
> names, etc.
>
> I have not been able to find a central place documenting the maximum
> character limits for certain fields, the only reference I found so far
> "Set names must be 16 characters or less" from
> https://wiki.nftables.org/wiki-nftables/index.php/Sets
>
> Are there any better places or could someone help fill in the blanks
> for me, for example are there any limits on how long of a string
> `comment` may be?
