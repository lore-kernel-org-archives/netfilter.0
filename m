From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: gateway without nat
Date: Thu, 7 Oct 2004 19:28:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a0410071028b497f60@mail.gmail.com>
References: <200410071631.58038.lcml@pixel.it>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
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
To: lcml@pixel.it, netfilter <netfilter@lists.netfilter.org>

Bridge ??


On Thu, 7 Oct 2004 16:31:58 +0200, Lucio <lcml@pixel.it> wrote:
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
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

