From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT efficiency?
Date: Wed, 01 Sep 2004 13:53:43 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094061223.1824.37.camel@wolfpack.ljm.dom>
References: <3A6E2F2950688040B9D3127FFC06345C064F62@ndm01-mxc01.needham.verso.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3A6E2F2950688040B9D3127FFC06345C064F62@ndm01-mxc01.needham.verso.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 10:42, Nolan, Timothy wrote:
> I'd like to use iptables to map addressA/portB to addressC/portD. I need to support up to 8000 address/port pairs (can be coming from any address, so I don't think the NETMAP target will suffice). I was planning to use the NAT table and add a DNAT 
> target for each address to change the destination address and a SNAT target to change the source (total of 16000 rules).
> 
> It's my understanding that iptables uses a linear search and that hipac doesn't support NAT. Does anyone have any opinions on whether iptables will scale to support what I have described?
> 
> Thanks,
> Tim

sorry--i'm not qualified to answer the linear search/hipac part of your
question.

in the event that your only choice is to have 8000 DNAT and 8000 SNAT
rules, you can make a small optimization by doing the following (this
assumes that portB is the same for all addresses, i'm going to use 80 in
ths example):

        iptables -t nat -N dport80
        
        iptables -t nat -A PREROUTING -i $outsideIF -p tcp --syn \
          --dport 80 -j dport80
        
        iptables -t nat -A dport80 -p tcp -d $addressA \
          -j DNAT --to-destination $addressC:$portD

this way--the *only* packets that have to traverse the 8000 DNAT rules
will be TCP SYN packets coming in on the outside interface with a
destination port of 80.  once a match is made in there--let connection
tracking take over for you.  the fact that there are 8000 rules in
"dport80" won't affect any other traffic going through this gateway.

as far as traversing the "dport80" chain with 8000 entries...i dunno. 
i've done something very similar to this, but the production environment
only have ~250 entries, and the test environment used ~500 entries.  in
that case, i didn't measure any significant latency--but you're a whole
order of magnitude above this...

as i'm typing this--i just realized you *could* use NETMAP from POM in
the above situation, if portB == portD; and again, portB is the same for
all addresses:

        iptables -t nat -N dport80
        
        iptables -t nat -A PREROUTING -i $outsideIF -p tcp --syn \
          --dport 80 -j dport80
        
        iptables -t nat -A dport80 -d $ousideNet \
          -j NETMAP --to $insideNet

you may need multiple NETMAP statements if the 8000 addresses don't fall
neatly into subnet boundaries, but you should be able to summarize down
to something significantly less than 8000.

sorry for rambling--hope this is some use.

-j

-- 
Jason Opperisano <opie@817west.com>


