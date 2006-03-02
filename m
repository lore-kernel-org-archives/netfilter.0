From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: Port forwarding - again ! :)
Date: Thu, 02 Mar 2006 10:38:13 -0500
Message-ID: <44071165.4020201@certicom.com>
References: <ZULUEcLsXJB7oDaSeXn000002df@zulu.barmen.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ZULUEcLsXJB7oDaSeXn000002df@zulu.barmen.nu>
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
To: netfilter@lists.netfilter.org


Stian B. Barmen wrote:
> I am wondering how to enable port forwarding from a DMZ to an internal
> network. The machine forwarding is just a normal Linux machine, no firewall in
> the DMZ, and I want it to forward one port to an internal machine on the
> intenal network.
> 
> How to forward 1 port from a machine in dmz-network to internal network!
> 
> <internet>
> |
> <firewall>
> |
> <router> - <dmz network>
> |
> <internal network>
> I just used the command:
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 217.20.20.160 --dport 81 -j
> DNAT --to 10.22.0.79:8081
> 
> # cat /proc/sys/net/ipv4/ip_forward
> 1
> 
> Also I enabled ip_forward.
> 
> But when I try to connect to 217.20.20.160:81 it just times out waiting for an
> answer. Do I need more in this minimalistic setup to make it work?
> 
> Note, the ip addresses are bogus, but representative. (the 217 is public ip
> and the 10 is private)

My guess would be you also need a MASQUERADE rule on the POSTROUTING chain of
nat table. Without it, you have a connection from machine X to 217.20.20.160,
but you have get a reply from 10.22.0.79!


