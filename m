From: Jason Opperisano <opie@817west.com>
Subject: Re: set up my DMZ
Date: Thu, 16 Sep 2004 13:39:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095356390.2489.70.camel@wolfpack.ljm.dom>
References: <web-3246067@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-3246067@infinito.it>
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

On Thu, 2004-09-16 at 10:44, hamals@infinito.it wrote:
> I've a DMZ with two server, I would like to acces them 
> through my iptables firewall.
> 
> IP_serve1_DMZ =192.168.2.2
> IP_serve2_DMZ =192.168.2.3
> 
> IP_server1_public = x.x.x.52
> IP_server2_public = x.x.x.53   (x is for privacy..)
> 
> 
> My firewall has
> 
> eth1 internet interface = x.x.x.50
> eth0 dmz interface = 192.168.2.1
> 
> I need to have my server access with their pubbic IP, but 
> I've only eth1 as inteface to internet.
> 
> I read that I can't use alias in iptables rules (like 
> eth1:1 etc) , then what kind of rules have I to write to 
> solve my problem?

  ip address add x.x.x.52 dev eth1
  ip address add x.x.x.53 dev eth1

  iptables -t nat -A PREROUTING -i eth1 -d x.x.x.52 \
    -j DNAT --to-destination 192.168.2.2

  iptables -t nat -A PREROUTING -i eth1 -d x.x.x.53 \
    -j DNAT --to-destination 192.168.2.3

filter rules as necessary (remember to use the 192.168.2.x address in
your filter rules)...

HTH...

-j

-- 
Jason Opperisano <opie@817west.com>


