From: Philip Craig <philipc@snapgear.com>
Subject: Re: many one-to-one NAT
Date: Mon, 17 May 2004 16:09:55 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A85733.5090400@snapgear.com>
References: <40A76773.2060402@mrv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40A76773.2060402@mrv.com>
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
To: Yaron Presente <ypresente@mrv.com>
Cc: netfilter@lists.netfilter.org

Yaron Presente wrote:
> I would like to do NAT from a private range to a public range of the 
> same size, in a way that just
> the network part of the IP address would be translated.

Use the NETMAP target.  This is included in 2.6, but I think you have to
patch 2.4 kernels still.

> For example, I would like a single iptables rule to map 192.168.10.0/24 
> => 10.1.1.0/24 as follows:
> 192.168.10.1 => 10.1.1.1
> 192.168.10.2 => 10.1.1.2
> .
> .
> .
> 192.168.10.254 => 10.1.1.254

Assuming 192.168.10.0/24 is private:

iptables -t nat -A PREROUTING -d 10.1.1.0/24 -j NETMAP --to 192.168.10.0/24
iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j NETMAP --to 10.1.1.0/24

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


