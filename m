From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Blocking ip addresses..
Date: Fri, 20 May 2005 14:07:18 -0500
Message-ID: <428E3566.90705@riverviewtech.net>
References: <20050520172641.GF9921@gw.home.tux-labor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050520172641.GF9921@gw.home.tux-labor.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> The Problem is, when I use the conntrack modul, and I block a IP with
> this command : 
> 
> iptables -t nat -I POSTROUTING -p tcp  -s 192.168.0.23 --dport 25 -m
> conntrack --ctstate ESTABLISHED,NEW,RELATED -j DROP,
> 
> then I can't create new Connections, but I can use further on the established
> connections.

This problem has to do with the fact that the nat table is only traversed when establishing NEW connections from what I have been told.  I think this would be better done in the filter:FORWARD or the filter:OUTPUT table as such:

iptables -t filter -I FORWARD -s 192.168.0.23 -p tcp --dport 25 -j DROP
iptables -t filter -I OUTPUT -s 192.168.0.23 -p tcp --dport 25 -j DROP



Grant. . . .

