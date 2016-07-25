From: namus <suman.subj@gmail.com>
Subject: Fwd: Need guidance in - dropping incoming packets to a interface in a
 bridged network.
Date: Mon, 25 Jul 2016 13:37:02 +0300
Message-ID: <CAGx1xT3r9xXVU1uZYWJL3P68NMvOutKnR5FW8JDhFHnRYq4u7A@mail.gmail.com>
References: <CAGx1xT3HGq8WNmHAmEAOUR551LuBrDoFo=uhW6VV1w50KpBb4A@mail.gmail.com>
 <CAGx1xT1+z8=0k9bc-iHKJZkjP0Lbe2rdU-V2wFMaus2tXzpT1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=H3YyiZaGzn5GD+6NOuJ55u7Gkv7O4pNFm2J2hyeZ9sg=;
        b=t9Yz4s3a2QQNvBowf1M4EL2Gi15C6TQFg/lCeAXLnd1k4hxBBb/aUWrFN91/pwi05y
         Grp/hU0rdNbPkDUEutzPoJ2l+F1KT0xb2TonuIASWQSz71N+xQwZKlY4YS2vK+4WtjUO
         LRZinrBotcWxSbEwQ1HrX9lKTxOfxr1i7jPmKaRcXskNt0go4Z2qo3YmraUyZ/vcxUd6
         Al6M8MXbrUCuW824EhZcK0YA8d9gk9Vi0NjfM5oM9qcAqvOirZESlqZZIszQXtNqyHMI
         xga4UMAdlzVW3ycwcipihqcfS0DWAd3nkkLaNGM5VVHy+W2zEjxabkqCDtrfxlv+L6lM
         UPhA==
In-Reply-To: <CAGx1xT1+z8=0k9bc-iHKJZkjP0Lbe2rdU-V2wFMaus2tXzpT1Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Team,

My device contains 2 ethernet interfaces(eth1 and eth2)  added to
bridge interface(br0)
I am trying to DROP all the packets to eth1 interface based on some
user-condition .
and I am new to netlink programming apis.


I did get past thru :
drv->nf_sock = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
getsockopt(drv->nf_sock,IPPROTO_IP,IPT_SO_GET_INFO,&info,&nf_sock_len)
getsockopt(drv->nf_sock, IPPROTO_IP, IPT_SO_GET_ENTRIES, &entries,&tmp)


now I am struck in finding exact match in those entries , replacing it
with DROP rule and commit the (DROP) rule .
Could you please help me in this ?

Also I tried to get the debug : /tmp/libiptc-so_get_entries.blob file
can you please suggest me (with od / hexdump/.. tool) command to view
the details in that file.


or any other approach to solve ..from here .. ?

More info:

I am using linux kernel 2.6.31 and
iptables 1.4.9.1
ebtables 2.0.6
libnfnetlink-1.0.0
libnl2  libraries


I am confused whether to use socket-based or to include libiptc in my
code to invoke functions.. whichever way would be suitable for my
implementation , could you
please point me in that direction?


Following commands do not work:

iptables -t filter -I INPUT -i eth2 -j DROP (doesn't drop any packets
- checked via tcpdump of eth2 )
iptables -t filter -I FORWARD -i eth2 -j DROP (doesn't drop any
packets - checked via tcpdump of eth2 )

whereas following commands work:

iptables -t filter -I INPUT  -j DROP (does work .. cant see any
packets flowing thru )
iptables -t filter -I FORWARD -j DROP (does work .. cant see any
packets flowing thru)


iptables -t filter -I INPUT -i br0 -j DROP (does work .. cant see any
packets flowing thru )
iptables -t filter -I FORWARD -i br0 -j DROP (does work .. cant see
any packets flowing thru)

I hope bridging is playing a role in dropping the packets here.

Your help will be greatly appreciated .
Thanks in Advance,
Suman.
