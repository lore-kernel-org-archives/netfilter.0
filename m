From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter/nftables: chain rule dumps
Date: Wed, 13 Jul 2016 16:40:36 +0200
Message-ID: <20160713144036.GA1385@salvia>
References: <578636F6.70802@toulouse.viveris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <578636F6.70802@toulouse.viveris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jalvarez <jalvarez@toulouse.viveris.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 13, 2016 at 02:41:26PM +0200, jalvarez wrote:
> Hi,
> 
> First I want to thank the netfilter developpers for nftables as it is really
> great ! :)
> 
> My problem is mostly about libnftnl / libmnl.
> 
> I am currently trying to port an IPTC application to work with nftables for
> a high performance firewall, those rules (~50000) are updated very often
> (from 5 to 60 times per second).
> I know it is not really supported, but i can't afford using nft from command
> line as it is too slow and offers less control than the low level C APIs.
> 
> I have been looking at the code of libmnl, libnftnl and nftables, and I
> currently didn't see any way of doing the following :
> - dumping the rules for a specific chain or table. I saw it is indeed
> possible to dump the rules for a specific family as it is done in
> mnl_nft_rule_dump, but i didn't see any way of doing so for a specific
> chain.

There is no support for this selective dumping yet in the kernel, but
it should be very easy to add by enhancing the rule dumping. You can
attach .data via netlink_dump_control structure. You only have to
define a container structure like:

        struct nft_rule_dump {
                const char *table;
                const char *chain;
        };

The idea is to strdup() the string that comes with NFTA_RULE_TABLE and
NFTA_RULE_CHAIN and attach this to the container structure above, then
use this information from nf_tables_dump_rules(). Don't forget to
release these two pointers by setting .done callback in
netlink_dump_control.

The file to modify is net/netfilter/nf_tables_api.c under the kernel
tree, this should result in a relatively small patch. Would you
contribute this update?

> - getting the handle id of a rule after sending a message to add it
> without the need to dump the whole ruleset. In other words, is it
> possible to retrieve the handle of the rule right after its
> insertion to the ruleset ?  Or is there a reliable way to predict
> this handle ?

You can get this through the NLM_F_ECHO flag. This flag makes the
netlink event notification report back to you what rule you have
created, including the 64-bit ID that was allocated. You just have to
invoke recvmsg() after sendmsg().

You can probably enhance the existing libnftnl example to support
this and print the rule ID after creation.
