From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block ports
Date: Mon, 16 Sep 2002 21:13:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916201323.OLCG17905.mta07-svc.ntlworld.com@there>
References: <200209161226.11945@.> <20020916074619.KCJK295.mta06-svc.ntlworld.com@there> <200209170024.26303@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209170024.26303@.>
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

On Monday 16 September 2002 8:01 pm, PayalR wrote:

> Hi,
> Thanks a lot for the mails. They were pretty helpful.
> I still have some doubts.
> Antony suggests putting,
> iptables -P INPUT DROP
> at start of rules while Alex wants it at end. What do I do?

Doesn't matter.   Same thing.   I prefer having a default DROP policy, so I 
know that's what's going to happen to any packets which reach the end of my 
ruleset, and I can add rules any time without worrying about where the DROP 
rule is.

Alex may prefer to have an explicit rule saying DROP so it's more obvious 
that it's there.

If in doubt, use both :-)

> I want to send email and browse the net from server. The server does have
> to make dns look-ups.

In that case make sure TCP port 53 and UDP port 53 are allowed out from the 
machine, and ESTABLISHED,RELATED packets are allowed back in.

> One more small thing, I was getting flood udp requests to port 2002.

So is everyone these days:

http://www.sophos.co.uk/virusinfo/analyses/linuxslappera.html

> I had blocked ICMP totally incoming as outgoing totally.

Not a good idea.   There are some ICMP packets you really should allow in to 
your machine - these are covered by the RELATED rule.

> Now what i did was for
> port 2002 INPUT rule I told to REJECT the packet with reject-with
> icmp-port-unreachable. Now will this setup send the error message back to
> the remote server, cos' in the previous rule I had totally blocked ICMP.

Yes it will, however I doubt it'll do much good.   My approach would be to 
DROP these UDP 2002 packets and not use up any of your outgoing bandwidth 
sending ICMP packets which the remote machine probably won't pay attention to.

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

