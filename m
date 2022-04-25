From: Maximiliano Estudies <maxiestudies@gmail.com>
Subject: using sets as snat targets in nat tables
Date: Mon, 25 Apr 2022 17:08:08 +0200
Message-ID: <CAF358wSzMHJQahvxXLofKF-bMc-xev10xjPbGCcZSpie1BMQhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=7NEM7uN+isE1jfN+7BydgV6BxhHGHyBNP4rD+Cao77M=;
        b=cxEflDWt6caTgeoednM9mrn/t+Gaje37XlFDPi9AH+34SygvnBcbateFwItZCLzDQl
         1vQ6DxhcK1NtE4amFEA6KA/3ubWOYcBYe9u/teemmcR2Km6cBENv96BDR4pFjt84egRI
         RX1KHtu7z/JZEUAlSlEd8388l0doxOsuLBrhhj+XP0vlzAAhgHwY6Uf50xg8FD8Ts+ly
         8GIX0e9RBWz/jm6YHPNGxTjgRz9uDX9wr1k4tJ6bDdZ007V+kw0EERiJPcLlSmwfuo+C
         MFflbP4ZBptCBRL8N1lzPKlDQ2UvQ+CpTufbg2b1ADogbmp1GkkX0ep1IQCZMOcxB/8K
         /RZw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I'm trying to use a set as a snat target and failing. This is my config:

table ip nat { # handle 73
set dc-cidr-nat { # handle 3
type ipv4_addr
flags interval
elements = { <internal-network> }
}

set external-ip-net { # handle 4
type ipv4_addr
elements = { <public-ip> }
}

chain POSTROUTING { # handle 1
type nat hook postrouting priority srcnat; policy accept;
ip saddr @dc-cidr-nat oif "enp1s0f0" snat to @external-ip-net comment
"internet gateway" # handle 7
}

This fails wtth "Error: syntax error, unexpected string, expecting ll
or nh or th". Using an anonymous set doesn't work either, but hard
coding the <external-ip> does. I can't find any hint in the wiki if
sets are allowed in this context.

OS: Linux version 5.4.0-107-generic (buildd@lcy02-amd64-058) (gcc
version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1))
nftables version: v0.9.3 (Topsy)
