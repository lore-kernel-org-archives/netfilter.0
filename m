From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot create a nat type base (pre/post routing) chain
Date: Wed, 29 Apr 2020 11:44:33 +0200
Message-ID: <20200429094433.GA1539@salvia>
References: <690dfdf6-8a72-f6a1-8b36-f92fcc458331@aimvalley.nl>
 <daa384d8-51eb-adfa-4872-fcc188c2b931@aimvalley.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <daa384d8-51eb-adfa-4872-fcc188c2b931@aimvalley.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Cc: netfilter@vger.kernel.org

On Wed, Apr 29, 2020 at 11:36:13AM +0200, Norbert van Bolhuis wrote:
[...]
> I guess it's some kind of openwrt nf_tables (module) build/incompatibility problem!?

Your lsmod listing does not show nft_chain_nat, this module should
autoload when you invoke:

        add chain nat prerouting { type nat hook prerouting priority 0 ; }

Did you try modinfo / modprobe nft_chain_nat manually to check if you
can reach this module?
