From: Brian Davidson <davidson.brian@gmail.com>
Subject: nftables: Using ip6 dscp in maps
Date: Fri, 21 Jan 2022 21:16:17 -0500
Message-ID: <CAOoaxdEiq_wSN1nCoZquCpDsPXh8eOz-fq-6ZXN6My6e0A0jjQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=SOWcnAEsRC/I6TA8o1scYqjt1gpwuLMLlpmMnnsRFZM=;
        b=HGa74BPOzNF5RiyTJlM5pMysE3B7sUKThU8AWoRWtHD+qA+aeXf2t1Xn1W/yvFmt8D
         rrpjC/6Or7aYSMmUrsaUCJpH7mqcQ3/7SEcVB49JKtdsWpsMclMV23sCukeLcBbs0bgt
         1idoE3u5NIJClQ5F+ZWmbQ+Q+xXPbSCG8qabovbNaUKRmwo6h4F5IKrjvcLQ95bFZZ6N
         8ECbpdBCOEXcKUev31TOxjlLdin8YhCFeNv0Yb3qvVByTK7y0u+fYoeD6JT3QzFDU+6w
         dGmL+PEfy/mUOR8syhFjxmkjjvw3GYePcFm3L7GSzENgYD1De5WwWMqF9kGT4niPnFWp
         MJgw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Using nftables 1.0.1 on an OpenWrt router, I would like to follow-up on
this commit from 2018 regarding ip6 dscp crossing a byte boundary and
being unable to use it in map statements.

  https://git.netfilter.org/nftables/commit/?id=48632359f4dea5ee2484debba498ba069229e6d0
  (src: evaluate: add preliminary binop transfer support for vmaps)

My goal is to be able to copy DSCP to ct mark to take advantage of tc's
'ctinfo dscp' action to restore DSCP from connmark on ingress from WAN.

Example:
map dscpct {
        typeof ip6 dscp : ct mark
            elements = {
                cs0  : 0x00,
                cs1  : 0x08,
                cs7  : 0x38,
                be   : 0x00
            }
    }

ct mark set ip6 dscp map @dscpct

This never works for ip6, but works for an equivalent ip dscp map
without the byte boundary constraint.

After a lot of trial and error, I can perform the required action with:
  meta nfproto ipv6 ct mark set ((@nh,0,16 & 4032) >> 6)

but it would be nice to see if the original problem with ip6 dscp and
the byte boundary can be solved, or another creative solution
suggested.

# nft --debug=netlink --check add rule inet fw4 mangle_forward ct mark
set ip6 dscp map @dscpct
inet
  [ meta load nfproto => reg 1 ]
  [ cmp eq reg 1 0x0000000a ]
  [ payload load 2b @ network header + 0 => reg 1 ]
  [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
  [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
  [ lookup reg 1 set dscpct dreg 1 ]
  [ ct set mark with reg 1 ]

Regards,
Brian
