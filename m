From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: TTL Examples
Date: Wed, 20 Apr 2005 17:24:00 -0500
Message-ID: <4266D680.7090802@riverviewtech.net>
References: <060601c54572$90801ab0$09603fca@southern>
	<42663E7E.6050201@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42663E7E.6050201@hotpop.com>
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
To: Georgi Alexandrov <tehlists@hotpop.com>
Cc: netfilter@lists.netfilter.org

> This is pointless ... as the user on the other side can increase their 
> TTL value the same way you decreased it :-)

Not exactly.

If you use the "--ttl-dec" yes it would be sort of futile as the client on the other side could artificially inflate his / her TTL.  HOWEVER if you use the "--ttl-set" then you could set the TTL to be what ever you want irregardless of what it was set to when it came in to your router.



Grant. . . .

