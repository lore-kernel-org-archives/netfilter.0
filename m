From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT support for peer-to-peer games
Date: Tue, 21 Sep 2004 09:08:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095772094.1897.6.camel@wolfpack.ljm.dom>
References: <00cf01c49fb1$da5492e0$e310f43e@manowar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00cf01c49fb1$da5492e0$e310f43e@manowar>
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

On Tue, 2004-09-21 at 04:04, Serguei I. Ivantsov wrote:
> Hello!
> 
> I just interesting - whether something changes in Netfilter to support
> peer-to-peer games.
> How to implement the scheme described below using netfilter?
> 
> <from the article>

[ snip ]

DNAT the necessary ports on the outside of your netfilter box to the
host on the inside that your playing games from, and put a rule in the
FORWARD chain that allows the traffic as well.

example--game port is UDP 7777:

  iptables -t nat -A PREROUTING -i $EXTERNAL_IF -p udp \
    -d $EXTERNAL_IP --dport 7777 -j DNAT --to-destination $CLIENT_IP

  iptables -A FORWARD -p udp -d $CLIENT_IP --dport 7777 -j ACCEPT

adjust accordingly for you particular level of paranoia.

-j

-- 
Jason Opperisano <opie@817west.com>


