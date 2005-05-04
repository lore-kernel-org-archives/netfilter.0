From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: forcing outgoing traffic thought eth3
Date: Wed, 04 May 2005 13:15:39 -0500
Message-ID: <4279114B.7070302@riverviewtech.net>
References: <200505041850.28455.benjamin@benjamin76.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505041850.28455.benjamin@benjamin76.plus.com>
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

> when a request is made from my client computer say 192.168.1.14 to my NFS 
> server which runs on say 192.168.1.7 I want to be able to force all the 
> outgoing traffic thought 192.168.1.6 would this be possable in iptables. If 
> so can you point down the right road please.

I think you will be looking at the ROUTE target (not sure where this is, hopefully someone else on the list can pick up here for me) to define where the traffic goes out of the system.

If you don't want to mess with the ROUTE target you could probably MARK the traffic and then match it with an "ip rule ... fwmark" and have a specific route back to the network via a different routing table.



Grant. . . .

