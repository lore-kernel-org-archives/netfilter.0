From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Hints needed to find causes of non-specific error messages
Date: Wed, 23 Aug 2017 12:57:03 -0700
Message-ID: <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jeff Kletsky <netfilter@allycomm.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

I've now tried striping everything out of the chains, except for a lone 
"accept" statement, as well as rebooting.

sudo nft list ruleset # returns nothing

Still getting
nftables.conf:3:1-14: Error: Could not process rule: Device or resource busy
flush ruleset
^^^^^^^^^^^^^^

Have I just been staring at this for too long and am missing something 
obvious?

Jeff


P.S. Please forgive the horrendous names, not much you can do with 16 
characters


$ cat nftables.conf
#!/usr/sbin/nft -f

flush ruleset

table inet global {

     chain prer_r {
         type filter hook prerouting priority -175
         policy drop

         accept

     } # chain prer_r

     chain prer_r {
         type filter hook prerouting priority -50
         policy drop

         accept

     } # chain prer_r

     chain input {
         type filter hook input priority -50
         policy drop

         accept

     } # chain input

     chain forward {
         type filter hook forward priority -50
         policy drop

         accept

     } # chain forward

     chain output {
         type filter hook output priority -50
         policy drop

         accept

     } # chain output

     chain postr_r {
         type filter hook postrouting priority -50
         policy drop

         accept

     } # chain postr_r

     chain postr_n {
         type filter hook postrouting priority 175
         policy drop

         accept

     } # chain postr_n

} # table inet global

table ip nat4 {

     chain nat_prer_4 {
         type nat hook prerouting priority -75

         accept

     }

     chain nat_postr_4 {
         type nat hook postrouting priority 125

         accept
     }

} # table ip nat4



$ lsmod
Module                  Size  Used by
nft_chain_nat_ipv4      1185  0
nf_conntrack_ipv4       6729  1
nf_defrag_ipv4          1236  1 nf_conntrack_ipv4
nf_nat_ipv4             4224  1 nft_chain_nat_ipv4
nf_nat                 12478  1 nf_nat_ipv4
nf_conntrack           70316  3 nf_conntrack_ipv4,nf_nat_ipv4,nf_nat
nf_tables_inet          1265  0
nf_tables_ipv6          1548  1 nf_tables_inet
nf_tables_ipv4          1548  1 nf_tables_inet
nf_tables              55470  4 
nft_chain_nat_ipv4,nf_tables_ipv6,nf_tables_ipv4,nf_tables_inet
nfnetlink               4933  1 nf_tables
ax88179_178a           13649  0
spidev                  6446  0
spi_s3c64xx            11643  0
exynos_gpiomem          3162  0
8021q                  18391  0
garp                    4749  1 8021q
mrp                     6365  1 8021q
stp                     1579  1 garp
llc                     3243  2 garp,stp
ipv6                  340897  26


