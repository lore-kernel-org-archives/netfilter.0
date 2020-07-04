From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables-nft replacement for /proc/net/ip_tables_names
Date: Sat, 4 Jul 2020 02:18:21 +0200
Message-ID: <20200704001821.GA1378@salvia>
References: <3b9e2301-99bf-7d1d-f7b2-b1744676a192@thelounge.net>
 <601bfa3d-fa3b-c905-44a9-7a6e4773fcd0@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <601bfa3d-fa3b-c905-44a9-7a6e4773fcd0@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

On Fri, Jul 03, 2020 at 01:37:30PM +0200, Reindl Harald wrote:
> well, and even if i grep around "iptables-nft -L -t mangle" and realize
> "not used" - there is no module
> 
> so how do you kill "-t raw", "-t nat" and "-t mangle" manually?
> 
> once loaded by "iptables-nft -t nat -L" you can't unload them too.....
> 
> [root@testserver:~]$ rmmod nf_nat nft_chain_nat
> rmmod: ERROR: Module nf_nat is in use by: nft_chain_nat
> rmmod: ERROR: Module nft_chain_nat is in use
> [root@testserver:~]$ rmmod nft_chain_nat nf_nat
> rmmod: ERROR: Module nft_chain_nat is in use
> rmmod: ERROR: Module nf_nat is in use by: nft_chain_nat
> 
> https://serverfault.com/questions/917872/delete-a-table-in-iptables

# nft delete table ip nat

deletes the tables completely.

There is no similar command for iptables-nft though.
