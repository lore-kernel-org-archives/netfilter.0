From: Jason Opperisano <opie@817west.com>
Subject: Re: gateway without nat
Date: Thu, 07 Oct 2004 21:00:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097197235.1722.7.camel@wolfpack.ljm.dom>
References: <200410071631.58038.lcml@pixel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410071631.58038.lcml@pixel.it>
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

On Thu, 2004-10-07 at 10:31, Lucio wrote:
> Hello everybody.
> 
> I need to setup a linux firewall with iptables with 3 NICs (LAN, WAN, DMZ). 
> The LAN/WAN routing is no problem because I'm going to use NAT and a couple 
> of rules to filter out the packets; so is the LAN/DMZ routing. However the 
> computers that make up the DMZ are already in place (with an old firewall 
> that's being substituted by the linux box), and they are already configured 
> with their respective public ip addresses. What I need is a gateway for the 
> DMZ that doesn't translate those public ip addresses, because I cannot modify 
> the configurations of the computers in the DMZ to make them become 
> 192.168.whatever.youwant.
> The problem is that I don't know how to make the kernel route packets between 
> the DMZ and WAN NICs without using a SNAT rule: can anyone help me please?
> 
> Thanks in advance,
> Lucio.

are the WAN and DMZ subnets different?  if so--the answer to your
question, is to simply enable IP forwarding and make sure that the ISP
router is forwarding the DMZ subnet to the WAN IP of the firewall (which
i would assume is how it's working with the current firewall).

  sysctl -w net.ipv4.ip_forward=1

if your current firewall is doing some bridging--things get a bit more
interesting.

either way--you need to provide us more details.  your question is
unclear, or inane...i assume the former.

-j

-- 
Jason Opperisano <opie@817west.com>


