From: Jason Opperisano <opie@817west.com>
Subject: Re: Network mapping from internal and external
Date: Mon, 04 Oct 2004 06:42:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096886543.22962.83.camel@wolfpack.ljm.dom>
References: <200410040342.i943gOqM012108@ylpvm15.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410040342.i943gOqM012108@ylpvm15.prodigy.net>
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

On Sun, 2004-10-03 at 23:42, Gregory Gerard wrote:
> I'm not sure how to describe my setup and intended network in iptables
> parlance. Have searched much and can't find anything that matches my
> situation.
> 
>  
> 
> I have 5 static IPs from my ISP. Out the Ethernet end of my DSL box I see
> those 5 IPs directly. I have no control over the router but that's fine.
> 
>  
> 
> I have many more than 5 machines in my network.
> 
>  
> 
> Internally, I have 10.9.x.x (255.255.0.0).
> 
>  
> 
> I would like to setup iptables such that 4 of the external IP addresses map
> completely map onto exactly 4 internal IP addresses. The fifth external
> address will simply be used to NAT for internal only machines.

assuming 1 of the 5 IP's is actually assigned to your netfilter
machine's external nic (i.e. 1.1.1.2), you need to add IP aliases for
the remaining 4 IP's (1.1.1.3 - 1.1.1.6):

ip addr add 1.1.1.3 dev $EXTERNAL_IF
ip addr add 1.1.1.4 dev $EXTERNAL_IF
ip addr add 1.1.1.5 dev $EXTERNAL_IF
ip addr add 1.1.1.6 dev $EXTERNAL_IF

setup 1:1 outbound NAT:

  iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -s 10.9.1.3 \
    -j SNAT --to-source 1.1.1.3
  iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -s 10.9.1.4 \
    -j SNAT --to-source 1.1.1.4
  iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -s 10.9.1.5 \
    -j SNAT --to-source 1.1.1.5
  iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -s 10.9.1.6 \
    -j SNAT --to-source 1.1.1.6

setup many:1 outbound NAT:

  iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -s 10.9.0.0/16 \
    -j SNAT --to-source 1.1.1.2

you don't specifically say whether you want the 4 1:1 NAT's to map for
inbound traffic as well, but if you do:

  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d 1.1.1.3 \
    -j DNAT --to-destination 10.9.1.3
  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d 1.1.1.4 \
    -j DNAT --to-destination 10.9.1.4
  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d 1.1.1.5 \
    -j DNAT --to-destination 10.9.1.5
  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d 1.1.1.6 \
    -j DNAT --to-destination 10.9.1.6

-j

-- 
Jason Opperisano <opie@817west.com>


