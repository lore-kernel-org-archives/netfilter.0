From: Gordon Fish <gordfisherman@gmail.com>
Subject: How to prevent SNAT rules from being applied to 'ICMP time exceeded' responses?
Date: Tue, 19 Nov 2019 11:24:30 -0800
Message-ID: <CALVYNH_zaqSYJdvCW=JpWvz6epQvQF6nooqH-bxd0+wZ3tsR+A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3Scq9VqgwCnspwEG8x5iXp+RZ0apVNJFClcYPMBJTPI=;
        b=tYQ4bppL2Nf5BnkMoKI3o3PwCVQ9BRuAwUsJlbxhtZCiaBLzo42SzMdwj1bej1xSkS
         DSJ5tldqHKpoJ/OqPcPn/fBQV52bRRYRKeoaks/OtHFJQ0MbYKjfa0bkXeHaWunr6rxQ
         aUqAaloE1ZZXYnc557PZe21vhB3Gx3pBwyXIk7yXVnzqD6/g59+wi0M0DE+L2zatpSCg
         oCFbTxTZqAPlMw35Sj6UiSi32WMTSqC4Q3yE7ibRbit4qFDMkM3kzxGZxoogEcUf2S7l
         9kTb5K592pJbBIFVuX2NV8X1QuUuzwo7pmNfFfqwwsDS0p5DTA0kEsDFzNaw/+RXqpM+
         YtBg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have the following rules on a Linux server, to route packets
from LAN node 10.0.1.8 (a Windows machine) destined for
192.168.173.93 to 1.2.3.4 and vice versa:

  iptables -t nat -I PREROUTING  -i br0 -s 10.0.1.8 -d 192.168.173.93
    -j DNAT --to-destination 1.2.3.4

  iptables -t nat -I POSTROUTING -o br0 -s 10.0.1.8 -d 1.2.3.4
    -j SNAT --to-source      10.0.1.4


This works in general, but trace routes get fouled up due to the
SNAT rule above, for whatever reason, being applied to the source
address (the address of a hop) of *ICMP time exceeded in-transit*
packets.

Is there a way to prevent this, so that the IP of the hop isn't
changed to 192.168.173.93 (which results in each hop line showing
that ip, when running `tracert 192.168.173.93` from 10.0.1.8,
though with the correct pings)?

I ran the following trace:

  iptables -t raw -I PREROUTING -p icmp --icmp-type any -j TRACE


This is what each *ICMP time exceeded in-transit* section looks
like in the TRACE log (formatted for readability/email):

  Nov  13  15:03:23  linux  kernel:  TRACE:
    raw:PREROUTING:policy:2
      IN=br0  OUT=  MAC=Linux-br0(eth0)-MAC:Router-MAC:08:00
      SRC=IP-of-HOP  DST=10.0.1.4
        LEN=56  TOS=0x00  PREC=0x00  TTL=244  ID=57128
        PROTO=ICMP  TYPE=11  CODE=0  [
          SRC=10.0.1.4  DST=1.2.3.4
          LEN=92 TOS=0x00  PREC=0x00  TTL=1  ID=57128
          PROTO=ICMP  TYPE=8 CODE=0  ID=512  SEQ=43011
        ]
  Nov  13  15:03:23  linux  kernel:  TRACE:
    mangle:PREROUTING:policy:1
      IN=br0  OUT=  MAC=Linux-br0(eth0)-MAC:Router-MAC:08:00
      SRC=IP-of-HOP  DST=10.0.1.4
        LEN=56  TOS=0x00  PREC=0x00  TTL=244  ID=57128
        PROTO=ICMP  TYPE=11  CODE=0 [
          SRC=10.0.1.4  DST=1.2.3.4
          LEN=92 TOS=0x00  PREC=0x00 TTL=1 ID=57128
          PROTO=ICMP  TYPE=8  CODE=0  ID=512  SEQ=43011
        ]
  Nov  13  15:03:23  linux  kernel:  TRACE:
    mangle:FORWARD:policy:1
      IN=br0  OUT=br0  MAC=Linux-br0(eth0)-MAC:Router-MAC:08:00
      SRC=IP-of-HOP  DST=10.0.1.8
        LEN=56  TOS=0x00  PREC=0x00  TTL=243  ID=57128
        PROTO=ICMP  TYPE=11  CODE=0  [
          SRC=10.0.1.8  DST=1.2.3.4
          LEN=92  TOS=0x00  PREC=0x00  TTL=1  ID=57128
          PROTO=ICMP  TYPE=8  CODE=0  ID=512  SEQ=43011
        ]
  Nov  13  15:03:23  linux  kernel:  TRACE:
    filter:FORWARD:policy:1
      IN=br0  OUT=br0  MAC=Linux-br0(eth0)-MAC:Router-MAC:08:00
      SRC=IP-of-HOP  DST=10.0.1.8
        LEN=56  TOS=0x00  PREC=0x00  TTL=243  ID=57128
        PROTO=ICMP  TYPE=11  CODE=0  [
          SRC=10.0.1.8  DST=1.2.3.4
          LEN=92  TOS=0x00  PREC=0x00  TTL=1  ID=57128
          PROTO=ICMP  TYPE=8  CODE=0  ID=512  SEQ=43011
        ]
  Nov  13  15:03:23  linux  kernel:  TRACE:
    mangle:POSTROUTING:policy:1
      IN=  OUT=br0  (no MAC)
      SRC=IP-of-HOP  DST=10.0.1.8
        LEN=56  TOS=0x00  PREC=0x00  TTL=243  ID=57128
        PROTO=ICMP  TYPE=11  CODE=0  [
          SRC=10.0.1.8  DST=1.2.3.4
          LEN=92  TOS=0x00  PREC=0x00  TTL=1  ID=57128
          PROTO=ICMP  TYPE=8  CODE=0  ID=512  SEQ=43011
        ]

Or see here:
https://gist.github.com/gordon-fish/4ffe50798acdd7b4a97bfb52cff6ac68


I don't see that the source address is being changed in the normal
flow at all; it's not even hitting the *nat* table, just *raw*,
*mangle*, and *filter* tables, so I assume it's being done by
conntrack.

I'd really like to prevent that, when it comes to *ICMP time
exceeded in-transit* responses, as my rules were only intended
to translate just 192.168.173.93 to 1.2.3.4 and back.

Is there any way to accomplish this?

Thanks,

-- 
gordonfish
