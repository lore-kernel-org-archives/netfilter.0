From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: mac match and FORWARD chain
Date: Tue, 24 Oct 2006 06:23:08 -0400
Message-ID: <20061024102308.GA6433@animx.eu.org>
References: <361567501.01771@mail.nankai.edu.cn>
	<453C1F0B.4010707@mail.nankai.edu.cn>
	<20061023105043.GA1104@animx.eu.org>
	<453DE93F.3000704@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <453DE93F.3000704@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Pascal Hambourg wrote:
> Wakko Warner a ?crit :
> >Box A -> (eth1)firewall/router(eth0) -> Box B
> >
> >firewall/router does not trust eth1 and uses MAC addresses to allow access,
> >so it does this:
> >-I FORWARD -j ACCEPT -i eth1 -m mac --mac BOXAMAC
> >-I FORWARD -j DROP -i eth1
> 
> If the firewall does not trust what is beyond eth1, MAC filtering is 
> pointless : a MAC address can be easily sniffed and spoofed.

I'm quite well aware of that.  The likely hood is quite low, plus doing mac
filtering was only the first step.  Coming from that interface, I only allow
ICMP and a VPN port.

> >firewall/router knows the mac of both box a and b (obviously, box a doesn't
> >know box b's mac and vice versa).  Consider the above the only rules in the
> >firewall and box A and B have no rules at all.
> >
> >Box A pings Box B and fails.  The reason is the mac test above is seeing 
> >the
> >MAC of eth0, not of Box A.
> 
> There must be a bug in your specific setup/kernel/iptables/whatever. On 
> my box, the FORWARD chain sees the correct MAC source address.
> Besides, I don't see how iptables could see the outgoing MAC source 
> address which AFAIK is added at the link layer, after the packet has 
> leaved Netfilter.

As I explained in the other emails, the mac test was using the MAC of the
outgoing interface when the packet was forwarded.  The kernel is
2.6.8-3-generic from debian (which seems to be the only 2.6 kernel I can run
on that machine for some reason.  All newer self compiled kernels crash on
that machine within an hour w/o any explanation)

> >This is what I'm referring to and I had to add a MARK rule in PREROUTING to
> >mark packets that I want to allow and then allow in the forward chain based
> >upon the mark.
> 
> About your idea of doing this in the nat table PREROUTING chain : it 
> won't work because the nat chains see only the initial packet of a 
> connection.

I was using mangle/PREROUTING to do the MARK target, since that's the only
place it'll work.

> *Don't you ever use the nat table chains for anything else than NAT*

Sometimes you have to, esp if you do not want specific packets to be nat'd

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

