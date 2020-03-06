From: Dennett Ingram <d@epicup.com>
Subject: use numgen to create address in rule
Date: Fri, 6 Mar 2020 10:08:59 -0700
Message-ID: <CAD8My5xdrceMzRr_z4gaCsc1fWgr+5scJbprFpXny30a8k2+Lw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=epicup-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=KbywEwxZss5re5Ad1styZ3BPCTIL+yqejzX3lsokc4w=;
        b=0udDv6fV3JIUkun/vYOM2P3mt+TTZsB+TFeuySjYqUPF9vd6RhtvA4I3T4I+CnTMY3
         Zfd9r7LCgttveQI1hEauLi9xQETtwXjKQacXD94q0FG4YZUnPImTsNkTuaeNUapEFQae
         kxBLpPI6VBCVoZVrKnZOPimKgT3YAokv6lnuiENxP/Dcrq/6n2ITB9Nj5TqsxMKPsL4A
         ChDb7qazlj3hTfzdw1OcS5OGKPO93WZ4okm1UezINJPxNHRWh/9mD5lPSobIZpC4e5Uy
         54orcf6l+GEFcjOza7cGHwRwCmIpuST3psq4lZECS5bRwRQeZ11F0lxnZwLr68kgXTqw
         AJ5Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

So I currently see no way of doing this.  But I figured I'd just write
out to verify.

Is there anyway to have a statement "evaluated" for each packet?

https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing

shows the use of:

% nft add rule nat prerouting dnat to numgen inc mod 2 map { \
               0 : 192.168.10.100, \
               1 : 192.168.20.200 }


which is great, to be able to generate a random number and use that to
find one of X items from the Map.  What would be really nice is if
there was some way you could do:

% nft add rule nat prerouting dnat to 192.168.10.(100+numgen inc mod 20)

which would then do the same type of mapping as before, but going from
192.168.10.100-192.168.10.120, without needing to create a map and
iterate through every value.

Being able to do simple math in there as well, you could have
100+2*(numgen inc mod 20) or whatever to have it skip every two.  or
2000:2000:A356::( numgen inc mod  65,536).ToHex() to have it generate
an IPv6 address in that /64 block randomly.  The ToHex() is just
something I put out there, I figure there would be some way to write
it in hex, or write the IPv6 address as a double, that could be
accepted.

I know this is a very niche situation, and not something supported,
but just thought I'd bring it up.
