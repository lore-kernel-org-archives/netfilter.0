From: Mark Morgan <morganm.qc@gmail.com>
Subject: Re: Nftables / ipset / multiple tables
Date: Tue, 13 Dec 2016 20:06:27 -0800
Message-ID: <CABAu8hPR=S+jpFtuOn3mNByWEiZmgOSnvyiazrurjNhxg787WQ@mail.gmail.com>
References: <CABAu8hMnZd84Ya-17aK9ERfqp-7TbfuhfWnDz5dydML0Jhdb0A@mail.gmail.com>
 <20161213193934.GA2881@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=3BKTm++5iafowdkoQiyn3YcjiqjHqFQEHeg1hXQs4Rk=;
        b=HzhhT3bgcrTH38xEQllS8c1Kur1jg2PlTnfDRfZrBck3WwKVRsGQMxPStFuDubxWQZ
         oJBj861TCbhP5TQSU4mySHhNxa/8qVuO/2X7KF0OK7jT7QdjreBnOwqvhOdWCQfoKSre
         WCDFABXNoTovdinLhzKwxvgFUXh3pBrPnCVY3ECqLqh0kPJ7YqQPrmpB3TNreoQU39ER
         GR/0CioKMZvWhJ7aG8xenLWozAq0X3N6iuCT/P963c4BroRC19lrwTE4Kpjmg1DotH0C
         y2cbKEc3P1FGFaJWUdCCRU8UsdQaZAjYogWkPWJ3RR4g5Qu49G9AVNtXR5d4FXNX/opO
         meRw==
In-Reply-To: <20161213193934.GA2881@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Great ideas, thank you both. I tried Pablo's suggestion and have an
error. Here's what it looks like:

# nftables.conf
include "/etc/nftables.country-block"
table inet filter {
  set country-block {
    type ipv4_addr; flags interval;
    elements = $country_block_list
  }
}

# nftables.country-block
define country_block_list = {
          1.160.0.0/12, 1.192.0.0/13, 1.200.0.0/16, 1.202.0.0/15, 1.204.0.0/14,
          # .... many lines here
        223.240.0.0/13, 223.4.0.0/14, 223.64.0.0/11
    }

And when I try to reload nftables, I receive the error:

Dec 13 19:56:18 ip-172-31-46-95 nft[563]: /etc/nftables.conf:82:16-16:
Error: syntax error, unexpected '$', expecting '{'
Dec 13 19:56:18 ip-172-31-46-95 nft[563]:     elements = $country_block_list
Dec 13 19:56:18 ip-172-31-46-95 nft[563]:                ^

Did I do something wrong? Versions if it matters (Arch Linux):

> uname -r -m
4.4.36-1-ec2-lts x86_64
> nft --version
nftables v0.6 (Support Edward Snowden)

I tried Leon's suggested approach and it just coredumps:

# nftables.conf
table inet filter {
  set country-block {
    type ipv4_addr; flags interval;
  }
}
include "/etc/nftables.country-block"

# nftables.country-block
add element inet filter country-block {
        1.160.0.0/12, 1.192.0.0/13, 1.200.0.0/16, 1.202.0.0/15, 1.204.0.0/14,
        # ... blah blah
        223.240.0.0/13, 223.4.0.0/14, 223.64.0.0/11
    }

-- Unit nftables.service has begun starting up.
Dec 13 20:00:35 ip-172-31-46-95 kernel: nft[616]: segfault at 70 ip
000000000041d662 sp 00007ffc1b3f8db0 error 4 in nft[400000+56000]
Dec 13 20:00:35 ip-172-31-46-95 systemd[1]: Started Process Core Dump
(PID 618/UID 0).
-- Subject: Unit systemd-coredump@2-618-0.service has finished start-up

Also in case size is a possible issue, here's word count on my
country-block file:

> wc nftables.country-block
  213   952 16532 nftables.country-block

Skipping 10-15 words of meta information, that's approximately ~940
CIDR blocks in the list.

Should I try different versions of nftables or a newer kernel?  Or for
the core dumping issue, feel free to point me at some docs for how to
capture useful debug information for the devs and I'm happy to read up
and submit a bug report.
