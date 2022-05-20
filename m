From: Andrew Clark <andrewclarkii@gmail.com>
Subject: Re: exclude named sets
Date: Fri, 20 May 2022 14:04:12 +0300
Message-ID: <CAMsxNkQ7rGoEuqgEFtmyGab6+HyPr0MO33DDbWZD-rtfgjTEcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=yJ290FS+bhdvl1v778q9DFk5SXRc2P5GFRgvawE5/f4=;
        b=oF2LEerEVovlMTpJVLtrg7teahnIpBxwLPiZNZYPM5rCt/CpH0Q+79WYoJcyDUfrzV
         pXT5P/ZtW+xQLN66SEN+lIhlQl7LSHrfHfwqvda+T8ogn43IXa0Pf53hRoidAKMt8wZ+
         KRyyNBN5sC++6/JSp9lwZ6m4DKEc+N83EG0mlDnsJZ7KSWz2HMd+5YZ2b5LRWrPzbBo1
         yWAU+4UIl+tBJWm5BC2XRUKTCZ6XCBJrPPnH7vdx6AWwnlzCQbH3wjIiLG9bEzLBJSAo
         lDiQd6/WpN+YkNhsH3DCWg57ukTk15Hme84g4Cg+44EMa5R/nQEpvTlVTbwxjAJ3GB/c
         Ghvg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Yes they are named sets. I define them like this:

root@anvil:~# grep "include" /etc/nftables.conf
include "/etc/nftables/*.nft"
root@anvil:~# cat /etc/nftables/nftables-stormwall.nft
table ip nat {

        set stormwall {
                type ipv4_addr;
                flags interval;
                auto-merge;
                elements = { 185.121.240.0/22,
        185.121.240.0/24,
        185.121.241.0/24,
        185.121.242.0/24,
        185.121.243.0/24,
        185.71.64.0/24,
        185.71.66.0/24,
        193.84.85.0/24,
        193.84.88.0/24,
        193.84.90.0/24,
        5.252.32.0/24,
        5.252.33.0/24,
        5.252.34.0/24,
        5.252.35.0/24
        }
    }
}
root@anvil:~#

According to nftables wiki
(https://wiki.nftables.org/wiki-nftables/index.php/Sets)
I can do like this:

nft add rule ip filter output ip daddr != @blackhole accept

But, probably not like this
nft add rule ip filter output ip daddr != {@akamai, @stromwall} accept

-- 
Talk is cheap, show me the code (c) Linus Torvalds
