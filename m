From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem in setting NAT using IP tables for kernel 2.4.x
Date: Tue, 5 Apr 2005 11:43:47 -0400
Message-ID: <20050405154347.GA2805@bender.817west.com>
References: <54d79d81050402214135b12fa5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <54d79d81050402214135b12fa5@mail.gmail.com>
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

On Sun, Apr 03, 2005 at 11:11:47AM +0530, Rahul Hirve wrote:
> hi all 
> 	I am using uClinux to test nat on IXDP425 the setup is use is as shown below
> 
> LAN
> with subnet <-------------[ixp0:10.0.10.11/23 (IXDP425) ixp1:
> 192.168.0.1/24]----------->PC with 10.0.10.0/23					 				             
>             IP 192.168.0.4/24
>                                                                       
>                           Default Gateway 192.168.0.1
> 
>                                                         
> now here th IXDP425 acting as router with ip_forward = 1
> ixp0(eth1) with IP 10.0.10.11 is acting as WAN port connecting to LAN
> of subnet 10.0.10.0/23 and
> 
> ixp1(eth0) is acting as LAN port connecting to PC of IP 192.168.0.4
> with default gateway as 192.168.0.1

<--snip-->

> LOOPBACK=lo
> LAN=ixp1
> WAN=ixp0

<--snip-->

> iptables -t nat -A POSTROUTING -s 192.168.0.4 -o ${LAN} -j SNAT --to 10.0.10.11

shouldn't that be "-o $WAN"

-j

--
"Stewie: Well, I'd love to stay and chat, but you're a bitch."
        --Family Guy

