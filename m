From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 14:53:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013135349.FARY28874.mta06-svc.ntlworld.com@there>
References: <20021013065007.A15824@hamal.ipal.net> <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there> <20021013080034.B15824@hamal.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021013080034.B15824@hamal.ipal.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 13 October 2002 2:00 pm, Phil Howard wrote:

> On Sun, Oct 13, 2002 at 01:10:23PM +0100, Antony Stone wrote:

> | Sounds like an incompatible set of requirements.   If you want to block
> | 10000 addresses (and assuming they don't fit into contiguous network
> | ranges) then you need 10000 rules to be able to specify what you want to
> | block.
>
> They in fact are 10000+ different netblocks.

Doesn't matter.   You still need 10000+ rules to block 10000+ addresses, even 
if they're entire network addresses.

> | Why don't you want 10000 rules on your netfilter box ?   Have you tried
> | it and found it causes any problems ?
>
> My understanding is they are tested sequentially.  Maybe this isn't true,
> but I see no documentation to the contrary regarding netfilter being any
> different than past table oriented access list style filtering which uses
> sequential testing to implement the ordered logic usually involved.

Your understanding is correct.   Netfilter rules are tested sequentially.   
However, I think it would still be worth a test of setting up a few thousand 
rules and see whether you get acceptable bandwidth.   What speed is your 
external Internet connection ?

> One other goal I had not mentioned is being able to add/delete netblocks
> as needed without replacing the whole ruleset.  But I don't think it would
> be a big issue.

You can add and delete netfilter rules individually without having to replace 
the entire ruleset.   It's not particularly efficient at doing so, but you 
can either replace "-A" in your rule with "-D" to delete it, or you can 
insert & delete rules by number according to their sequence in the list.

> | > Is there some kind of means to set up the
> | > equivalent of a routing table like lookup structure (which can be
> | > added to and removed from separately) which a single netfilter rule
> | > would reference to apply matches?
> |
> | Set up source routing and send the packets to a separate netfilter box
> | whose sole purpose is to eat packets ?
>
> I'll check into that.  If source routing uses the same kinds of hashed
> route tables as regular routing should (but I never confirmed whether it
> actually does or not in Linux, since I've never had more than about 6 or
> so routes at one time), this would be the way to go.

Although I wrote this suggestion first, I consider it a second-best to the 
null-routing idea below:

> | > I want to block _incoming_ packets.  Null routing these addresses is
> | > not sufficient, as the lame SYNs will continue to eat up resources.
> |
> | I don't understand that last part.   If you null route packets, surely
> | there's no destination for the SYNs, therefore no half-open connections
> | get set up ?
>
> Null routing is the goal.  Deciding on the course/direction to pursue is
> what I am doing at the moment.  It sounds like maybe source routing might
> be more appropriate than netfilter in this case.

I think so.   Try using the standard routing table's abilities to block 
packets at the gateway (same way as 192.168.0.0 packets get blocked by 
routers), before actually sending them somewhere else to get eaten - the 
latter could just be a waste of time to set up.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

