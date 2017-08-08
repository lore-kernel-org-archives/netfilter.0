From: J Doe <general@nativemethods.com>
Subject: Using sets for protocols ?
Date: Tue, 8 Aug 2017 17:15:00 -0400
Message-ID: <3F149C27-5E77-455F-B870-68307C3A87DF@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am currently experimenting with nftables syntax and was wondering if there was a way to specify that a rule applies to *BOTH* TCP and UDP.

For instance, allowing DNS resolution:

add rule filter input tcp sport domain ct state established,related accept
add rule filter output tcp dport domain ct state new,established,related accept
add rule filter input udp sport domain ct state established,related accept
add rule filter output udp dport domain ct state new,established,related accept 

...requires four rules the way I have written it.

Is there a way to decrease this by specifying the rules apply to both TCP and UDP ?

I tried using a set:

add rule filter input { tcp, udp } sport domain ct state established,related accept
add rule filter output { tcp, udp } dport domain ct state new,established,related accept

...but the nft parser rejects this syntax.

I also tried leaving the protocol out to see if it would default to both:

add rule filter input sport domain ct state established,related accept
add rule filter output dport domain ct state new,established,related accept

...but the nft parser rejects this syntax as well.

Is there another way of writing this ?

Thanks,

- J


