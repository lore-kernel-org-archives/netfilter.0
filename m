From: alvin.ml@Mail.DDoS-Mitigator.net
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 10:45:40 -0700
Message-ID: <20160706174540.GA610@Mail.DDoS-Mitigator.net>
References: <loom.20160705T084958-392@post.gmane.org>
 <f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
 <20160706142100.GA30556@Mail.DDoS-Mitigator.net>
 <6a0dd625-fe5a-d3df-bf33-75a39613fa5b@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a0dd625-fe5a-d3df-bf33-75a39613fa5b@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antonio Prado <thinkofit@gmail.com>
Cc: netfilter@vger.kernel.org


hi antonio

On 07/06/16 at 05:36pm, Antonio Prado wrote:
> 
> at BGP level, when an AS is DDoSed with a 10Gbps rate (or maybe more),

10Gbps ( bits/sec ) is not that big of an ISP but still not ez to DDoS

it seems, some of the ISPs like to use RTBH for DDoS mitigation, but,
that'd still imply they received the DDoS packets in order that they
can /dev/null it ...

i wonder why they don't traceroute back to the original attacker
and have the local law enforcement come knocking on the door ..
i ISP know where all the packets is coming from that they in turn 
fwd to the next hop

> /usually/ there is a lot of gear inside an ISP that becomes unresponsive
> before it can reach an iptables/firewall/ddos-mitigation box

yup

> so, dealing with iptables to sort out some local rate-limit effect
> (until the pipe is not full) is ok, but it's useless if ASes don't
> adhere to BCP38 or if they don't deploy BGPSec (for instance)

yup

magic pixie dust
alvin
