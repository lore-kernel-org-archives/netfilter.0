From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Question about nfmark
Date: 05 Jun 2003 00:23:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054765405.694.79.camel@tux.rsn.bth.se>
References: <3EDE33EA.6030908@cpsc.ucalgary.ca>
	 <1054756430.818.32.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054756430.818.32.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: gupta@cpsc.ucalgary.ca, Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-06-04 at 21:53, Cedric Blancher wrote:

> An example... Suppose you implement DNAT. This sits in PREROUTING chain.
> 
> 	iptables -t nat -A PREROUTING -d $PUB_IP -j DNAT --to $PRIV_IP
> 
> How can I filter packets destined to $PUB_IP form those which were
> destined to $PRIV_IP as they appear the same way into FORWARD chain ?
> Use mark.
> 
> 	iptables -t mangle -A PREROUTING -d $PRIV_IP -j MARK --mark 0x01
> 
> Then, in filter table, I do this :
> 
> 	iptables -A FORWARD -m mark --mark 0x01 -j DROP
> 
> As I don't people access directly my private IP. Doing this, you get in
> FORWARD chain information that would not be available otherwise.

There are other ways.

iptables -A FORWARD -d $PRIV_IP -m conntrack ! --ctorigdst $PUB_IP -j DROP

-- 
/Martin

