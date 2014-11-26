From: leroy christophe <christophe.leroy@c-s.fr>
Subject: How are ct helper to be configured with NFT ?
Date: Wed, 26 Nov 2014 19:08:36 +0100
Message-ID: <54761724.9060201@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

I need to do something equivalent to

     iptables -t raw -A OUTPUT -p udp -d 192.168.2.1 --dport tftp -j CT 
--helper tftp


I tried the following

nft add rule filter output ct helper "tftp" udp dport tftp

But it looks like it doesn't work, I still get.

[ 1113.706274] nf_conntrack: automatic helper assignment is deprecated 
and it will be removed soon. Use the iptables CT target to attach 
helpers instead.

What is the correct syntaxe for that ?

Christophe
