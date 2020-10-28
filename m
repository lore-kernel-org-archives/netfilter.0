From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftable rule for VRRP traffic
Date: Wed, 28 Oct 2020 23:22:19 +0100
Message-ID: <20201028222219.GA25697@salvia>
References: <9e00cb7bb2e944c981e1a9a43278aa2c@wd5b.gc.cuny.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9e00cb7bb2e944c981e1a9a43278aa2c@wd5b.gc.cuny.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wang, Lihua" <lwang2@gc.cuny.edu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Wed, Oct 28, 2020 at 03:34:34PM +0000, Wang, Lihua wrote:
> Dear NFTables community,
> 
> We are trying to migrate from firewalld to nftables in our planned upgrade from CentOS 7 to 8. 
> 
> We run keepalived on some of our servers and we need to migrate the firewall rule that allows vrrp in and out traffic to nftables format. I googled the topic, searched nftables documentations, and tested a number of possibilities but could not find the solution.
> 
> the firewalld rules for vrrp is: 
> 
> firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 --in-interface ens192 --destination 224.0.0.18 --protocol vrrp -j ACCEPT
> firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 --out-interface ens192 --destination 224.0.0.18 --protocol vrrp -j ACCEPT
> 
> which are similar to ipables commands:
> 
> # iptables -I INPUT -i ens192 -d 224.0.0.0/8 -p vrrp -j ACCEPT
> # iptables -I OUTPUT -o ens192 -d 224.0.0.0/8 -p vrrp -j ACCEPT
> 
> Could you please kindly advise what is the equivalent in nftable command or rule formate?

Use iptables-translate to request a rule translation:

# iptables-translate -I INPUT -i ens192 -d 224.0.0.0/8 -p vrrp -j ACCEPT
nft insert rule ip filter INPUT iifname "ens192" ip protocol vrrp ip daddr 224.0.0.0/8 counter accept
