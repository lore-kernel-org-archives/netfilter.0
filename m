From: Gabriele Altomare <augustus@inwind.it>
Subject: Re: help needed-VPN
Date: 27 May 2003 12:31:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054031471.4197.2.camel@localhost.localdomain>
References: <000101c32433$e1c08b10$0223a8c0@satconet.com>
Reply-To: augustus@inwind.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c32433$e1c08b10$0223a8c0@satconet.com>
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

You have to add a static route on the machine X which say :

to the remote lan (the lan on the other side of the tunnel) use the Cipe
Gateway. That's all.


On Tue, 2003-05-27 at 11:39, Steven Mugassa wrote:
> Hello,
> 
> I'm trying to implement VPN of two remote LANs(LAN A & LAN B) using CIPE (on
> RedHat 9.0). I have tried to follow instructions from "CIPE-How to" from
> tldp.org and it seems to work (the machines on the two LANs can ping &
> traceroute each other using the internal IP addresses)
> 
> However i have one more requirement which i need advice on how to do it:-
> -One of the machines(call it machine X) in LAN B is not using CIPE gateway
> as its gateway( it is going to the internet using another gateway, which is
> also in the same LAN). This machine don't need to access machines in LAN A,
> but machine in LAN A need to access this machine. Since this machine is
> using another gateway(not CIPE gateway), then the classical CIPE-based VPN
> implementation will not allow it to be accessible by remote LAN.
> 
> -My question is, what modifications (routings, or SNAT/DNAT, ...) can i do
> to allow machine in remote LAN A to access that machine X (in LAN B)?
> 
> Thanks,
> Steven
> 



