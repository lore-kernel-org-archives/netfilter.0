From: Philip Craig <philipc@snapgear.com>
Subject: Re: NAT PREROUTING chain ignored on returning traffic ??
Date: Mon, 01 Sep 2003 17:46:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F52F963.70202@snapgear.com>
References: <3F4FA204.6010605@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4FA204.6010605@xs4all.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zoilo <zoilo@xs4all.nl>
Cc: netfilter@lists.netfilter.org

Zoilo wrote:
> So why does a returning packet not travel through the NAT PREROUTING 
> chain, whereas a new incoming ping does travel through the NAT 
> PREROUTING chain? Both packets have exactly the same destination, huh?

The nat table is used to set up the nat mappings for a connection.
Since the nat mappings do not change throughout the life of the
connection, this is only done for the first packet in the connection.
Therefore, the nat table will only see packets that have a state
of NEW or RELATED.

For further evidence of this, notice that the outgoing packet in II)
goes through the nat OUTPUT and POSTROUTING chains, but the outgoing
packet in I) does not.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


