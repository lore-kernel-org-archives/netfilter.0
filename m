From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Grammar in a bash script
Date: Mon, 17 Aug 2020 10:56:58 +0200
Message-ID: <20200817085658.GA3677@salvia>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mario V Guenzi <jclark@tiscali.it>
Cc: Netfilter list <netfilter@vger.kernel.org>

Hi,

On Mon, Aug 17, 2020 at 07:55:32AM +0200, Mario V Guenzi wrote:
> Goodmorning everyone,
> Does it make sense to use this kind of grammar in a bash script?

Please, don't do bash scripting, use native scripting instead for
nftables. Bash scripting breaks atomicity when applying the ruleset.

You have to remove $NFT from your example below and use 'nft -f ruleset.nft'

> $NFT add table inet firewall
> $NFT add table inet nat
> $NFT add table netdev noddos
> 
> $NFT add chain inet firewall INPUT { type filter hook input priority 0 \;  }
> $NFT add chain inet firewall OUTPUT { type filter hook output priority 0
> \; }
> $NFT add chain inet firewall FORWARD { type filter hook forward priority
> 0 \; }
> $NFT add chain inet firewall IPS { type filter hook forward priority 10 \; }
> $NFT add chain inet firewall POSTROUTING { type filter hook postrouting
> priority 0 \; }
> $NFT add chain inet firewall SYN-FLOOD { type filter hook input priority
> 0 \; }
> $NFT -- add chain inet  nat PREROUTING { type nat hook prerouting
> priority -100 \; }
> $NFT add chain inet nat OUTPUT { type nat hook output priority 0 \; }
> $NFT add chain inet nat POSTROUTING { type nat hook postrouting priority
> 100 \; }
> $NFT -- add chain netdev noddos ingress { type filter hook ingress
> device $EXTIF priority -500 \; }
> 
> my rules
> my rules
> my rules
> .
> .
> .
> $NFT add chain inet firewall INPUT { type filter hook input priority 0
> \; policy drop \; }
> $NFT add chain inet firewall OUTPUT { type filter hook output priority 0
> \; policy drop \; }
> $NFT add chain inet firewall FORWARD { type filter hook forward priority
> 0 \; policy drop \; }
> $NFT -- add chain inet  nat PREROUTING { type nat hook prerouting
> priority -100 \; policy drop \;  }
> $NFT add chain inet nat OUTPUT { type nat hook output priority 0
> \;policy drop \;  }
> 
> The reasoning that I have done and of which I ask for confirmation is,
> after having given permission to what I need, I deny everything as a policy

You can set default policy to drop wehn defining the chain (in the
same go), no need to call it twice, my suggestion for your ruleset is
to place this in ruleset.nft:

add table inet firewall
add table inet nat
add table netdev noddos

add chain inet firewall INPUT { type filter hook input priority 0; policy drop; }
add chain inet firewall OUTPUT { type filter hook output priority 0; policy drop; }
add chain inet firewall FORWARD { type filter hook forward priority 0; policy drop; }
...

my rules
my rules
my rules
