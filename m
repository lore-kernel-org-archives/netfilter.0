From: Sandro Dentella <sandro@e-den.it>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 11:15:39 +0100
Message-ID: <20051110101539.GA12934@casa.e-den.it>
References: <4372A919.8020100@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4372A919.8020100@rosi-kessel.org>
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

On Wed, Nov 09, 2005 at 08:57:45PM -0500, Adam Rosi-Kessel wrote:
> I'm troubeshooting an issue of accessing a VPN through NAT. Right now the
> problem can be reduced to the following question:
> 
> Under what conditions would inbound packets not be routing through the nat
> PREROUTING chain?

That's a problem that puzzles me too. Do you have fancy routing tables?
(several different tables setup w/ iproute2).

I also have a setup in which icmp packets will not get to PREROUTING. My
understanding is that the kernel does not understand they are destined for
that box: could that be your situation?

In my stup, ifconfig eth3:
eth3      Link encap:Ethernet  HWaddr 00:0A:5E:59:EF:09
          inet addr:192.168.111.1  Bcast:192.168.111.255  Mask:255.255.255.0

but these packets 

10:18:07.676131 IP 192.168.111.1 > 217.27.90.70: icmp 64: echo request seq 213
10:18:07.726977 IP 217.27.90.70 > 192.168.111.1: icmp 64: echo reply seq 213

do not enter PREROUTING and are just discarded 

In my case this is due to a peculiar routing tables setup,
http://mailman.ds9a.nl/pipermail/lartc/2005q4/017168.html that I have not
been able to debug: I didn't receice any hint on this list, lartc and
netdev. Is it such an obscure matter?


sandro



-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

