From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft 'script' not working
Date: Tue, 20 Oct 2015 12:39:59 +0200
Message-ID: <20151020103959.GA2206@salvia>
References: <808081249.162491.1445328120632.JavaMail.ngmail@webmail12.arcor-online.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <808081249.162491.1445328120632.JavaMail.ngmail@webmail12.arcor-online.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giorgio.nicole@arcor.de
Cc: netfilter@vger.kernel.org

On Tue, Oct 20, 2015 at 10:02:00AM +0200, giorgio.nicole@arcor.de wrote:
> Hi,
> 
> I'm facing problems trying to run a simple nft script to
> setup a very simple firewall.
> 
> Here are the script pieces:
> 
> # cat /etc/nftables/fw_basic.nft
> #!/sbin/nft -f
> flush ruleset
> include "/etc/nftables/ipv4-nat"
> include "/etc/nftables/ipv6-nat"
> table inet filter {
> 	chain input {
> 		type filter hook input priority 0; policy accept;
> 		iif lo accept
> 		ct state established,related accept
> 		ip6 nexthdr icmpv6 icmpv6 type { nd-neighbor-solicit, echo-request, nd-router-advert, nd-neighbor-advert } accept
> 		tcp dport { 22, 80, 443 } accept
> 		udp dport { 5353 } accept
> 	}
> }
> include "/var/lib/nftables/user.nft"
> 
> and:
> 
> # cat /var/lib/nftables/user.nft
> add chain inet filter input { policy drop; }
> # 
> 
> And here is the result:
> # /etc/nftables/fw_basic.nft
> In file included from ./fw_basic.nft:15:1-37:
> /var/lib/nftables/user.nft:1:1-45: Error: Could not process rule: No such file or directory
> add chain inet filter input { policy drop; }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is not related to the scripting, it's currently a kernel
limitation. You can reproduce this problem with the following script:

- ruleset.file -
#!/usr/sbin/nft

add table filter
add chain filter output { type nat hook output priority 0 ; }
add chain filter output { policy drop ; }
- EOF ruleset.file -

% nft -f ruleset.file
ruleset.file:5:1-42: Error: Could not process rule: No such file or directory
add chain filter output { policy drop ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The real problem is that we currently cannot update an object that it
is being created from the same batch. This existing limitation was
already discussed on the -devel ML, and it should be easy to remove it.

> Further, I noticed that if I remove the last 'include' from the main script, 'fw_basic.nft',
> and issue the last command manually:
> # nft add chain inet filter input { policy drop\; }
> #
> 
> it works.
> 
> My second question is:
> 
> should it be possible to 'include' empty .nft files in a script without having errors ?

This works here with nft 0.5:

% touch empty.file
% cat x
#!/usr/sbin/nft

include "empty.file"
% nft -f x
