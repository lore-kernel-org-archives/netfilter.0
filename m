From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 14:44:32 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050930112129.19898.qmail@focomunicatii.ro>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: sebastian.ionita@focomunicatii.ro
Cc: netfilter@lists.netfilter.org

On Fri, 30 Sep 2005 sebastian.ionita@focomunicatii.ro wrote:

> Why doesn't iptables works with vlans interfaces? 
> iptables -t mangle -A FORWARD -i eth0 -o eth1.11 -j MARK --set-mark 4
> Gives me the error:
> host/network eth1.11 not found.

Sounds like there may be a bug in your iptables command.

Are you sure the command line given above is what you tried to use? The 
error seems to suggest a -s/-d option was used instead of -o.

Regards
Henrik

