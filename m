From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Fri, 3 Jul 2020 12:39:09 +0200
Message-ID: <a140ef1f-b238-3c8b-d8ec-3e266a893aea@thelounge.net>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
 <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>, netfilter@vger.kernel.org



Am 03.07.20 um 09:04 schrieb G.W. Haywood:
> On Fri, 3 Jul 2020, Timo Sigurdsson wrote:
> 
>> ... I use ipsets for blacklisting.
>>     I fetch blacklists from various sources
>> ... This approach has worked for me for quite some time.
>> ... some of my blacklists may contain the same addresses or ranges,
>>     I use ipsets' -exist switch when loading
>> ... I don't think that the use case is that extraordinary ...
> 
> +6
> 
> FWIW I'll be following this thread very closely.

it turned out at least with recent kernel and recent userland
"iptables-nft" can fully replace "iptables" and continue to use "ipset"
unchanged

-------------------------

in my case the swicth was even done by just replace the command in my
non-distribution network-up.service and reboot, the save-files are
compatible

ExecStart=/usr/sbin/iptables-legacy-restore /etc/sysconfig/iptables
ExecStart=/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables

-------------------------

before dealing with "alternatives" i prepared my scripts so that for the
migration time only the above chnage

# Check if 'iptables-nft' is loaded
if grep -q 'nft_compat' <<< $(lsmod); then IPTABLES_NFT=1; else
IPTABLES_NFT=0; fi

# Shortcuts
IPSET_SAVE_FILE="/etc/sysconfig/ipset"
IP6TABLES_SAVE_FILE="/etc/sysconfig/ip6tables"
IPTABLES_SAVE_FILE="/etc/sysconfig/iptables"
IPSET="$(which 'ipset' 2> '/dev/null')"
IPSET_SAVE="$IPSET -file $IPSET_SAVE_FILE save"

# Compat-Layer
if [ "$IPTABLES_NFT" == 1 ]; then
 IPTABLES="$(which 'iptables-nft' 2> '/dev/null' || which 'iptables' 2>
'/dev/null')"
 IPTABLES_SAVE="$(which 'iptables-nft-save' 2> '/dev/null' || which
'iptables-save' 2> '/dev/null')"
 IP6TABLES="$(which '/usr/sbin/ip6tables-nft' 2> '/dev/null' || which
'ip6tables' 2> '/dev/null')"
 IP6TABLES_SAVE="$(which 'ip6tables-nft-save' 2> '/dev/null' || which
'ip6tables-save' 2> '/dev/null')"
else
 IPTABLES="$(which 'iptables-legacy' 2> '/dev/null' || which 'iptables'
2> '/dev/null')"
 IPTABLES_SAVE="$(which 'iptables-legacy-save' 2> '/dev/null' || which
'iptables-save' 2> '/dev/null')"
 IP6TABLES="$(which 'ip6tables-legacy' 2> '/dev/null' || which
'ip6tables' 2> '/dev/null')"
 IP6TABLES_SAVE="$(which 'ip6tables-legacy-save' 2> '/dev/null' || which
'ip6tables-save' 2> '/dev/null')"
fi

-------------------------

what i *really* would love having the same for ipset with "ipset-legacy"
and "ipset-nft" to keep semantic and scripts unchanged but behind the
scenes use nftables

besides the optimizations below which as far as i understand it only
apply to native "nf_set" that coulkd be the road to finally get rid of
all the ipset/iptables code and switch everything to "nftables" without
break any userland software and homegrown scripts

https://lore.kernel.org/netfilter-devel/20200315141353.u6hv7podfwxeopgi@salvia/T/

-------------------------

finally: in over 20 years IT the switch from "iptables-legacy" to
"iptables-nft" is the first time a "dropin-replacement" really deserves
that label and it would be great if "ipset" could go the same direction
