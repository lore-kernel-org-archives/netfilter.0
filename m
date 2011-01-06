From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd: failover problems
Date: Thu, 06 Jan 2011 04:16:38 +0100
Message-ID: <4D253416.7030004@netfilter.org>
References: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>	<4D1A176C.5000105@netfilter.org>	<AANLkTimcTzk29z_9CqY9a6jNfoQrSs+V4Qx7vKRisMJh@mail.gmail.com>	<4D1B49BD.3030202@netfilter.org> <AANLkTik9OORTJp2qfVV4S42m7KGVGG+xBDB7c=T2sH0J@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik9OORTJp2qfVV4S42m7KGVGG+xBDB7c=T2sH0J@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simone Zaffalon <zaffa@zaffa.it>
Cc: netfilter@vger.kernel.org

On 04/01/11 11:06, Simone Zaffalon wrote:
> Hi Pablo.
> I managed to do some more testing, and maybe i found my problem.
> With conntrack running, i took for granted that every tcp connection
> would be tracked and resumed.
> So, as i said in my first email, i didn't set up any iptables rules
> (except one for snat).
> 
> With this configuration conntrackd does'nt work. Then i tried some
> iptables rules like the ones in
> http://conntrack-tools.netfilter.org/testcase.html
> and things started working.
> Please, to be crystal clear on that, can you confirm that when you say in manual
> 
> "
> ...
> 3) A well-formed stateful rule-set. Otherwise you are likely to
> experience problems during the fail-over. An example of a well-formed
> stateful iptables rule-set is available in the conntrack-tools
> website.
> ...
> "
> 
> you mean : "To ensure that conntrackd work correctly you must have a
> set of iptables rules with state tracking enabled" ?
> If so that's great, i found my problem.

Yes. Otherwise you trigger the following problem that can be reproduced
it if you don't use a well-formed stateful rule-set, with the following
steps:

1) you create the tcp connection between two peers A -> B, given the
following configuration A -> FW -> B. We assume NAT enabled, as in your
case.
2) you trigger the failover
3) the flow entries were not committed yet but B sends a reply packet.
The firewall receives it and it finds no flow information to undo the
NAT handling, thus it considers that it's a packet for itself and it
passes it to its local stack. This results in a tcp rst that the
firewall delivers to B.

If you have the appropriate rule-set, the firewall drops invalid
requests. Thus, if B sends a packet to the firewall and the flow
information is not present yet, then it drops the packet. B will resend
and the firewall will find the flow information to undo the NAT.
