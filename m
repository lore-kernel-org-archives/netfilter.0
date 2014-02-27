From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nft error
Date: Thu, 27 Feb 2014 12:10:48 +0100
Message-ID: <CAFnufp1JMj9MHpyQSpL4L7cyaKPjFypbXGJjSdAVFD5pHKUvfw@mail.gmail.com>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <20140226102530.GA4093@localhost> <20140226104555.GA4215@localhost>
 <CAFnufp2EFQcaT6rKQaRLjOrgu32CPgaHvOjBfKzTAawkxOayVg@mail.gmail.com>
 <CAFnufp3Jigct_=uwUO+7sgNzQuRUHAczSWJ3yS+jSBhu=9H6VQ@mail.gmail.com> <20140226163458.GA22606@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=WuzIJ2zjEiWoMoNJipiZlVdy3a3EW0R8KUfFM+TkcI4=;
        b=kV3aLXP1zpOA1YdU4aFrWwz5zAQvo8ujJjYFKJx501AWso6Q6V+Ms1GUuR7rWEL5Zb
         VH4YU0KrxufLEZGBM2Q1YEPAUWzknvhJp6hqfYxE35NU2b3b1MthHFuerxS68hw3+i17
         g60ZuZkpUMD/bCDVKhIqUahV1yS3SXtwJG525f+FkTLnkVLEDaLbK6+WxAjd9x6ZsE5e
         qGPzNSm2Q1HJcuG6WMwVlpIDRWos0Q00BUVSUUGSR7Li6fQd8IL3mR8VEC2R2tRPTLLd
         7sJXOCisUyCDWP8PLOK0O4O2UXOh3rDCGkX4T6SsbvWDlIzRG4JsHynKiVBZnJW607gQ
         mdMg==
In-Reply-To: <20140226163458.GA22606@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thanks all, I've nftables working, I'm playing with some rule.
I'm trying on my gateway to do NAT  with SNAT (masquerading is not
implemented yet) with this rule:

table ip nat {
        chain postrouting {
                 type nat hook postrouting priority 0;
                 oif eth0 snat $eth0
        }
}

$eth0 is the outgoing ethernet ip address.
if from a PC I try to ping 8.8.8.8 I can sniff on the gateway the
outgoing ICMP with the correct address $eth0,
but the replies aren't forwarded back to the PC.

Is the snat target supposed to do also connection tracking?


2014-02-26 17:34 GMT+01:00 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Wed, Feb 26, 2014 at 05:26:58PM +0100, Matteo Croce wrote:
>> What module I'm missing now?
>>
>> # nft list table global
>> table ip global {
>>         chain one {
>>                  type filter hook input priority 0;
>>         }
>> }
>>
>> # nft add set global ipv4_ad \{ type ipv4_address \; \}
>> internal:0:0-0: Error: Could not add set: Operation not supported
>
> nft_hash               12900  0
> nft_rbtree             12808  1
> nf_tables              42349  3 nf_tables_ipv4,nft_hash,nft_rbtree



-- 
Matteo Croce
OpenWrt Developer
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 BARRIER BREAKER
 -----------------------------------------------------
  * 1/2 oz Galliano         Pour all ingredients into
  * 4 oz cold Coffee        an irish coffee mug filled
  * 1 1/2 oz Dark Rum       with crushed ice. Stir.
  * 2 tsp. Creme de Cacao
 -----------------------------------------------------
