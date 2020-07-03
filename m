From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: iptables-nft replacement for /proc/net/ip_tables_names
Date: Fri, 3 Jul 2020 13:37:30 +0200
Message-ID: <601bfa3d-fa3b-c905-44a9-7a6e4773fcd0@thelounge.net>
References: <3b9e2301-99bf-7d1d-f7b2-b1744676a192@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3b9e2301-99bf-7d1d-f7b2-b1744676a192@thelounge.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

well, and even if i grep around "iptables-nft -L -t mangle" and realize
"not used" - there is no module

so how do you kill "-t raw", "-t nat" and "-t mangle" manually?

once loaded by "iptables-nft -t nat -L" you can't unload them too.....

[root@testserver:~]$ rmmod nf_nat nft_chain_nat
rmmod: ERROR: Module nf_nat is in use by: nft_chain_nat
rmmod: ERROR: Module nft_chain_nat is in use
[root@testserver:~]$ rmmod nft_chain_nat nf_nat
rmmod: ERROR: Module nft_chain_nat is in use
rmmod: ERROR: Module nf_nat is in use by: nft_chain_nat

https://serverfault.com/questions/917872/delete-a-table-in-iptables

>> Yeah the only way to remove the entries, what I
>> showed, plus the empty tables is to remove the
>> mangle module from the kernel. You can make the
>> module blacklisted so it won't ever load.

Am 03.07.20 um 13:03 schrieb Reindl Harald:
> due transition from "iptables-legacy" to "iptables-nft" i wrote this
> function but the problem is that raw, mangle and especially nat seems to
> be loaded by the compat-layer
> 
> that ends in useless tables and chains on machines only using "-t
> filter" which some overhead given the counters are going up
> 
> is there a better way for "function loaded_tables" and/or at least a
> scriptable one to delete such unused tables and chains at the end of
> "iptables.sh" beore the ruleset is saved?
> 
> the goal is like before if "iptable.sh" is using "-t mangle" just use
> it, load what is needed and when not keep it outside the ruleset in a
> generic way
> 
> we share "iptables.sh" between all machines (host-firewalls after the
> datacenter-firewall which has completly differnets scripts) because the
> default policies are all the same and specific stuff can be wrapped in
> if-statements depending on $HOSTNAME
> 
> ------------------------------------------------------------------------------------------------
> 
> in case of "nat" that end in loading useless modules and afterward you
> have that all in the save-file
> 
> nft_chain_nat          16384  4
> nf_nat                 53248  1 nft_chain_nat
> nf_conntrack          159744  4
> xt_conntrack,nf_nat,nf_conncount,xt_connlimit
> libcrc32c              16384  2 nf_conntrack,nf_nat
> nf_tables             229376  327 nft_compat,nft_counter,nft_chain_nat
> 
> ------------------------------------------------------------------------------------------------
> 
> function loaded_tables
> {
>  local TABLE TABLES
>  if [ "$IPTABLES_NFT" == 0 ]; then
>   for TABLE in $(<'/proc/net/ip_tables_names'); do
> TABLES="${TABLES}\n${TABLE}"; done
>  else
>   for TABLE in raw mangle filter nat wtf; do if [ "$(iptables-nft -t
> "$TABLE" -L 2> '/dev/null')" != '' ]; then TABLES="${TABLES}\n${TABLE}";
> fi; done
>  fi
>  echo -e "$TABLES" | sort | uniq | awk 'NF'
> }
> 
> ------------------------------------------------------------------------------------------------
> 
> $IPTABLES -t filter -P INPUT DROP
> $IPTABLES -t filter -P FORWARD DROP
> $IPTABLES -t filter -P OUTPUT ACCEPT
> LOADED_TABLES="$(loaded_tables)"
> for table in $LOADED_TABLES; do $IPTABLES -t "$table" -F; done
> for table in $LOADED_TABLES; do $IPTABLES -t "$table" -X; done
> 
> ------------------------------------------------------------------------------------------------
> IPV4 TABLE MANGLE (STATEFUL PRE-NAT/FILTER)
> ------------------------------------------------------------------------------------------------
> Chain PREROUTING (policy ACCEPT 7719K packets, 2360M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain INPUT (policy ACCEPT 7719K packets, 2360M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain OUTPUT (policy ACCEPT 6973K packets, 12G bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain POSTROUTING (policy ACCEPT 6973K packets, 12G bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> ------------------------------------------------------------------------------------------------
> IPV4 TABLE NAT
> ------------------------------------------------------------------------------------------------
> Chain PREROUTING (policy ACCEPT 605K packets, 40M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain INPUT (policy ACCEPT 605K packets, 40M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain POSTROUTING (policy ACCEPT 342K packets, 30M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain OUTPUT (policy ACCEPT 342K packets, 30M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> ------------------------------------------------------------------------------------------------
> IPV4 TABLE RAW (STATELESS PRE-CONNTRACK)
> ------------------------------------------------------------------------------------------------
> Chain PREROUTING (policy ACCEPT 7719K packets, 2360M bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> 
> Chain OUTPUT (policy ACCEPT 6973K packets, 12G bytes)
> num   pkts bytes target     prot opt in     out     source
>  destination
> (END)

