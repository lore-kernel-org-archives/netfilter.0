From: Robert White <rwhite@pobox.com>
Subject: Re: SNMP mangling anybody?
Date: Sat, 2 Dec 2017 02:03:39 +0000
Message-ID: <9871b3d5-87b3-0d25-6e4b-b42c4978cc7a@pobox.com>
References: <038581F89849074CAFDAFA8E4AE887F41F76D74C@GAALPA1MSGUSRBF.ITServices.sbc.com>
 <c38d24c0-9425-2b08-6db6-6df1db83261e@pobox.com>
 <038581F89849074CAFDAFA8E4AE887F41F771684@GAALPA1MSGUSRBF.ITServices.sbc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <038581F89849074CAFDAFA8E4AE887F41F771684@GAALPA1MSGUSRBF.ITServices.sbc.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "FAIR, ED" <ef7193@att.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/01/2017 05:58 PM, FAIR, ED wrote:
> Robert,
> 
> Some progress on this - continuing with the "clientaddr" approach only - no SNAT - changing /proc/sys/net/ipv4/conf/bond0.2/rp_filter=2 (was 1) stopped the blocking of the SNMP response.  See https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/ip-sysctl.txt?id=bb077d600689dbf9305758efed1e16775db1c84c#n961
> 
> I don't fully understand why rp thinks a default route in table main is better than a default route in my table, but - clearly - it's not a netfilter thing.

er...

What are your other interface addresses? (you never said.)

If you are choking on rp filter then there's probably a fundamental
error in your network layout. I mentally skipped over this as a
possibility in my previous reply.

For example if your bond0.1 and bond0.2 -- which I am assuming are vlans
-- are 192.168.168.2 and 192.168.168.3 respectively then the reverse
path filter will have all sorts of problems with things. So will
literally everything else that can see the pathing conflict.

A vlan segment must be treated as a distinct segment as far as network
design.

In point of fact, if you've got the design right you shouldn't need to
do anything with rules or specialty routing or clientaddr or snat. The
"best" local address should be automatically assigned to the outgoing
packet because it would be the only valid choice.

The advanced routing rules pretty much don't matter for locally attached
segments because the network stack would collapse if it didn't
automatically handle such segments.

The real point of advanced routing is to direct things to use a specific
first hop when they are going more than one hop.

So at this point I have to assume you are making an "advanced" (in the
Invader Zim sense) error.

Such Errors Include:

Not flushing addresses from interfaces before bonding them.

Not flushing addresses before bridging them.

Trying to coerce use of a specific adapter that is part of a bond.

Assigning multiple physical and/or semantic adapters to the same
routable segment address.

"Clever" netmasks that cause two or more segments to overlap.

---

Once you get your network topology straightened out you'll probably find
that you don't need to do _anything_ besides assign addresses to your
adapters and use the desired target addresses in your query. You
shouldn't even need clientaddr.

> I'll try using SNAT and will report final results back.

Don't bother to try SNAT yet, you have bigger problems.


--Rob.

P.S. yes, rule based nat is depreciated, which is why it's not your
friend. 8-)
