From: Phil Howard <phil-netfilter@ipal.net>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 08:00:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013080034.B15824@hamal.ipal.net>
References: <20021013065007.A15824@hamal.ipal.net> <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sun, Oct 13, 2002 at 01:10:23PM +0100
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Oct 13, 2002 at 01:10:23PM +0100, Antony Stone wrote:

| On Sunday 13 October 2002 12:50 pm, Phil Howard wrote:
| 
| > I would like to know how best to block 10000's of addresses using
| > netfilter.  Clearly I do not want to be placing 10000's of individual
| > filter table entries in.
| 
| Sounds like an incompatible set of requirements.   If you want to block 10000 
| addresses (and assuming they don't fit into contiguous network ranges) then 
| you need 10000 rules to be able to specify what you want to block.

They in fact are 10000+ different netblocks.


| Why don't you want 10000 rules on your netfilter box ?   Have you tried it 
| and found it causes any problems ?

My understanding is they are tested sequentially.  Maybe this isn't true,
but I see no documentation to the contrary regarding netfilter being any
different than past table oriented access list style filtering which uses
sequential testing to implement the ordered logic usually involved.

One other goal I had not mentioned is being able to add/delete netblocks
as needed without replacing the whole ruleset.  But I don't think it would
be a big issue.


| > Is there some kind of means to set up the
| > equivalent of a routing table like lookup structure (which can be
| > added to and removed from separately) which a single netfilter rule
| > would reference to apply matches?
| 
| Set up source routing and send the packets to a separate netfilter box whose 
| sole purpose is to eat packets ?

I'll check into that.  If source routing uses the same kinds of hashed
route tables as regular routing should (but I never confirmed whether it
actually does or not in Linux, since I've never had more than about 6 or
so routes at one time), this would be the way to go.


| > I want to block _incoming_ packets.  Null routing these addresses is
| > not sufficient, as the lame SYNs will continue to eat up resources.
| 
| I don't understand that last part.   If you null route packets, surely 
| there's no destination for the SYNs, therefore no half-open connections get 
| set up ?

Null routing is the goal.  Deciding on the course/direction to pursue is
what I am doing at the moment.  It sounds like maybe source routing might
be more appropriate than netfilter in this case.  Before this posting,
everyone is telling me to use netfilter/iptables (though I doubted they
comprehended the scale).

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

