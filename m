From: Jason Opperisano <opie@817west.com>
Subject: Re: set up my DMZ
Date: Fri, 17 Sep 2004 07:13:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095419610.1886.1.camel@wolfpack.ljm.dom>
References: <web-3590363@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-3590363@infinito.it>
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

On Fri, 2004-09-17 at 05:37, hamals@infinito.it wrote:
> #!/bin/bash
> 
> 
> iptables -F
> 
> iptables -t nat -F
> 
> iptables -t mangle -F
> 
> # filter table everythingd is ACCEPT  only to follow the 
> easyest way#
> 
> iptables -P INPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -P OUTPUT ACCEPT
> 
> ## make DMZ -> internet ##
> 
> iptables -t nat -A POSTROUTING -s 192.168.2.1 -o eth1 -j 
> SNAT --to-source 82.190.228.52
> 
> 
> ## make internet -> DMZ ##
> 
> iptables -t nat -A PREROUTING -i eth1 -d x.x.x.52 -j DNAT 
> --to-destination 192.168.2.1

sysctl -w net.ipv4.ip_forward=1

-j

-- 
Jason Opperisano <opie@817west.com>


