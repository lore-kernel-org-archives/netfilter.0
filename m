From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: help,i have a problem with nftable redirect
Date: Thu, 10 Dec 2015 12:17:34 +0100
Message-ID: <20151210111734.GA1582@salvia>
References: <20151210020004.4CA232A09CE@webmail.sinamail.sina.com.cn>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151210020004.4CA232A09CE@webmail.sinamail.sina.com.cn>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Lin <helloworldjack@sina.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, Dec 10, 2015 at 10:00:04AM +0800, Jack Lin wrote:
> hi all,
> i think the version of kernel is ok, why it printed "Error: Could not process rule: No such file or directory" when i inputed "nft add rule table123 natpre tcp dport 22 redirect to 2222".
> i configured it followed "http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)"
> 
> root@debian:/bin# ^C
> root@debian:/bin# cat /proc/version 
> Linux version 4.2.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 4.9.3 (Debian 4.9.3-8) ) #1 SMP Debian 4.2.6-3 (2015-12-06)
> root@debian:/bin# nft -v
> nftables v0.5 (Support Edward Snowden)
> root@debian:/bin# nft list table table123 -a
> table ip table123 {
> chain pre {
> type filter hook prerouting priority 0; policy accept;
> }
> chain post {
> type filter hook postrouting priority 0; policy accept;
> }
> chain natpre {
> type nat hook prerouting priority 0; policy accept;
> }
> chain natpost {
> type nat hook postrouting priority 0; policy accept;
> }
> }
> root@debian:/bin# nft add rule table123 natpost ip saddr 10.68.166.44 ip protocol icmp snat 10.68.166.45
> root@debian:/bin# nft add rule table123 natpre redirect
> <cmdline>:1:1-33: Error: Could not process rule: No such file or directory
> add rule table123 natpre redirect
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> root@debian:/bin# nft add rule table123 natpre tcp dport 22 redirect to 2222
> <cmdline>:1:1-54: Error: Could not process rule: No such file or directory
> add rule table123 natpre tcp dport 22 redirect to 2222
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> root@debian:/bin#
> 
> root@debian:/lib/modules/4.2.0-1-amd64/kernel/net/netfilter# lsmod |grep nf
> nft_counter 16384 1 
> nft_reject 16384 0 
> nft_ct 16384 0 
> nf_conntrack_amanda 16384 0 
> nf_nat_redirect 16384 0 
> nft_redir 16384 0 

I don't see the nft_redir_ipv4 module here, does your kernel support
this?

Could you check if:

 modprobe nft_redir_ipv4

works? Anyway, this should really work without manual module
modprobing.

> nft_nat 16384 1 
> nft_chain_nat_ipv4 16384 4 
> nf_conntrack_ipv4 20480 1 
> nf_defrag_ipv4 16384 1 nf_conntrack_ipv4
> nf_nat_ipv4 16384 1 nft_chain_nat_ipv4
> nf_nat 24576 3 nf_nat_redirect,nft_nat,nf_nat_ipv4
> nf_conntrack 110592 5 nf_nat,nft_ct,nf_nat_ipv4,nf_conntrack_amanda,nf_conntrack_ipv4
> nf_tables_ipv4 16384 4 
> nf_tables 69632 15 nf_tables_ipv4,nft_chain_nat_ipv4,nft_nat,nft_ct,nft_redir,nft_counter
> nfnetlink 16384 1 nf_tables
> binfmt_misc 20480 1 
> nfsd 282624 2 
> auth_rpcgss 57344 1 nfsd
> nfs_acl 16384 1 nfsd
> nfs 249856 0 
> lockd 90112 2 nfs,nfsd
> grace 16384 2 nfsd,lockd
> fscache 61440 1 nfs
> sunrpc 327680 6 nfs,nfsd,auth_rpcgss,lockd,nfs_acl
> tpm_infineon 20480 0 
> tpm 40960 2 tpm_tis,tpm_infineon
> root@debian:/lib/modules/4.2.0-1-amd64/kernel/net/netfilter# ^C
