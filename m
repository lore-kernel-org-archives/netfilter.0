From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nmap
Date: Wed, 23 Oct 2002 16:25:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210231526.g9NFQ3L02964@vulcan.rissington.net>
References: <1035264046.15391.85.camel@hyperno> <plopm33cqxs6qt.fsf@drizzt.dyndns.org> <031501c27a8d$f2070940$583a29c4@ghome>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <031501c27a8d$f2070940$583a29c4@ghome>
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

On Wednesday 23 October 2002 1:15 pm, Gavin wrote:

> Would I be right in thinking that the OUTPUT chain only filters traffic
> originating from the firewall box itself, and that any traffic coming from
> your clients would fall into the FORWARD chain?  If that is the case, then
> filtering OUTPUT would have no effect on your users' ability to surf, mail
> etc, but only on the firewall box's ability to generate traffic.

Yes, you are correct in this understanding of what the OUTPUT and FORWARD 
chains are for, however I believe this thread started by asking about setting 
up rules in the OUTPUT chain to enable nmap to be used *from the box which 
the netfilter rules are on*.

Therefore the packets being discussed are all locally generated anyway.

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

