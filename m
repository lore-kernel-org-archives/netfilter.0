From: Jason Opperisano <opie@817west.com>
Subject: Re: Multiple output routes
Date: Wed, 15 Dec 2004 10:10:22 -0500
Message-ID: <1103123422.871.11.camel@hubcap.ljm.dom>
References: <200412151044.46362@X-Blurb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412151044.46362@X-Blurb>
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

On Wed, 2004-12-15 at 04:44, O-Zone wrote:
> Hi all,
> i want to route traffico for a specific subnet to routeA while default route 
> for my linuxbox is routeB. Here's the diagram:
> 
> (internet)--[Router A]---+
>                                     |
>                                 [Linux BOX]----(Subnet 10.0.0.x)
>                                     |
> (internet)--[Router B]---+
> 
> RouterA and RouterB have the same subnet (i.e. RouterA lan is 192.168.0.1 and 
> RouterB has 192.168.0.2) and LinuxBox have ONLY ONE externat iface like 
> 192.168.0.3. While i use LinuxBOX i wanna go "out" trought 192.168.0.1 but 
> PC's MASQ'ed in Subnet 10.0.0.x must go out throug 192.168.0.2. 

leave the default gateway of "Linux Box" set to RouterA--which will take
care of all packets from "Linux Box" being routed out via RouterA.

setup policy routing so that packets from 10.0.0.0/24 get routed out via
RouterB:

  echo 200 RouterB >> /etc/iproute2/rt_tables

  ip rule add fwmark 0x01 table RouterB

  ip route add default via 192.168.0.2 table RouterB

  ip route flush cache

  iptables -t mangle -A PREROUTING -i $insideIF -s 10.0.0.0/24 \
    -j MARK --set-mark 0x01

add filter and nat rules as necessary...

-j

--
"I'm a well-wisher, in that I don't wish you any specific harm."
	--The Simpsons


