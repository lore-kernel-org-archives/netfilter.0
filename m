From: Chris Hall <netfilter@gmch.uk>
Subject: Failing to construct a 'set' for TCP Flag filtering.
Date: Wed, 2 Sep 2020 17:44:11 +0100
Message-ID: <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk>
References: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


I have constructed the file 'tryx' containing:

#---------------------------------------------------
flush ruleset
add table ip MAIN

add set ip MAIN tcp_good_flags { type tcp_flag ; flags constant ; \
elements = {                  \
   ( 0 | 0 | 0 |ack| 0 | 0 ),  \
   ( 0 | 0 | 0 |ack| 0 |urg),  \
   ( 0 | 0 | 0 |ack|psh| 0 ),  \
   ( 0 | 0 | 0 |ack|psh|urg),  \
   ( 0 | 0 |rst| 0 | 0 | 0 ),  \
   ( 0 | 0 |rst|ack| 0 | 0 ),  \
   ( 0 | 0 |rst|ack| 0 |urg),  \
   ( 0 | 0 |rst|ack|psh| 0 ),  \
   ( 0 | 0 |rst|ack|psh|urg),  \
   ( 0 |syn| 0 | 0 | 0 | 0 ),  \
   ( 0 |syn| 0 |ack| 0 | 0 ),  \
   ( 0 |syn| 0 |ack| 0 |urg),  \
   ( 0 |syn| 0 |ack|psh| 0 ),  \
   ( 0 |syn| 0 |ack|psh|urg),  \
   (fin| 0 | 0 |ack| 0 | 0 ),  \
   (fin| 0 | 0 |ack| 0 |urg),  \
   (fin| 0 | 0 |ack|psh| 0 ),  \
   (fin| 0 | 0 |ack|psh|urg)   \
} ; }

list ruleset
#---------------------------------------------------

With a view to using this to filter out invalid combinations of TCP flags.

When I give that to nft I get:

# nft -f tryx
table ip MAIN {
         set tcp_good_flags {
                 type tcp_flag
                 flags constant
                 elements = { ack, 0x30, 0x18, 0x38, rst,
                              0x14, 0x34, 0x1c, 0x3c, syn,
                              0x12, 0x32, 0x1a, 0x3a, 0x11,
                              0x31, 0x19, 0x39 }
         }
}

...which suggests that all is well so far... but it isn't.  And if I try 
to check the state of the ruleset again:

# nft list ruleset
BUG: Unknown expression binop
nft: mergesort.c:47: expr_msort_cmp: Assertion `0' failed.
Aborted (core dumped)

Indeed, nothing seems to work until I 'flush ruleset' again !

Am I asking for the impossible here ?

Thanks,

Chris

