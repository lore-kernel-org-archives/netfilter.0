From: Jason Opperisano <opie@817west.com>
Subject: Re: TCP handshake sequence enforcement
Date: Thu, 19 May 2005 18:04:30 -0400
Message-ID: <20050519220430.GA9168@bender.817west.com>
References: <BAY106-F32D87D362841FA2A488E17D6080@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY106-F32D87D362841FA2A488E17D6080@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 19, 2005 at 12:52:48PM -0700, Andrew Kraslavsky wrote:
> Good day,
> 
> Does any part of iptables/netfilter (possibly conntrack?) provide srtict 
> TCP handshake sequence enforcement?  By which I mean, ensure that:
> 
> 1) The 1st packet in a TCP traffic flow has only the SYN flag set.
> 
> 2) The 2nd packet is a reply with only SYN+ACK (assuming the connection is 
> being accepted).
> 
> 3) The 3rd packet is the ACK from the traffic flow originator.
> 
> I know I can enforce the 1st part using a rule that checks the TCP flags on 
> a traffic flow in the NEW state as described in section B.2 in Oskar 
> Andreasson's excellent "Iptables Tutorial", which lists the following 
> example (n.b. this example uses the old ipchains style '-syn' instead of 
> the new '--tcp-flags' argument but these are functionally equivalent):
> 
>     iptables -A INPUT -p tcp ! --syn -m state NEW -j DROP
> 
> However, how can I enforce the second and third steps?
> 
> Why do I ask?  Well, there's this outfit called ICSA, see, and this is one 
> of their requirements and the places where I want to install my 
> router/firewall demand ICSA certification.  I'm not real clear on the set 
> of exploits the enforcement of the above would foil but I'm guessing some 
> kind of intrusion or other.
> 
> Anyway, I'm hoping this is something inherently handled by conntrack 
> (because I'm lazy and I don't want to have to code anything up myself)...

as you state--you need to enforce step 1 in your rules:

  iptables -A CHAIN -p tcp --syn -m state --state NEW ... -j ACCEPT

steps 2 and 3 and (unmentioned) 4 (where the continuing SEQ and ACK
numbers are validated against what is expected) and (unmentioned) 5
where the 4-way TCP teardown sequence is validated are all handled by
Jozsef Kadlecsik's tcp-window-tracking patch from PoM (for 2.4 kernels),
which is in the mainline kernel as of 2.6.9.  the timeouts for the
varied states are controlled by the 'sysctl net.ipv4.netfilter'
variables.

as an aside, are you going to pay to have netfilter (or i guess more
correctly, some installation/configuration thereof) ICSA certified?

-j

--
"Woman: Pervert.
 Brian: Oh, don't flatter yourself, honey; I don't have any sweat
 glands."
        --Family Guy

